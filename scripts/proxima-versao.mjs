#!/usr/bin/env node
// Calcula a próxima versão semântica a partir dos commits desde a última tag
// (PGC 9 e 14). Segue a mesma lógica do scripts/proxima-versao.mjs da ONGConecta.
//
//   feat:                       -> minor (1.0.0 -> 1.1.0)
//   fix: / perf:                -> patch (1.0.0 -> 1.0.1)
//   tipo!: ou "BREAKING CHANGE:" -> major (1.0.0 -> 2.0.0)
//   docs:, chore:, ci:, test:... -> sem release nova
//   sem nenhuma tag ainda        -> primeira release = 1.0.0
//
// Saídas (stdout e $GITHUB_OUTPUT): atual, versao, release, tipo
// Se NOTAS_ARQUIVO estiver definida, grava as notas da release nesse arquivo.
//
// Uso: node scripts/proxima-versao.mjs
//      NOTAS_ARQUIVO=notas-release.md node scripts/proxima-versao.mjs

import { execSync } from 'node:child_process';
import { appendFileSync, writeFileSync } from 'node:fs';
import { pathToFileURL } from 'node:url';

const SEPARADOR = '---fim-do-commit---';
const PESO = { none: 0, patch: 1, minor: 2, major: 3 };

export function classificarCommit(mensagem) {
  const [titulo = '', ...resto] = mensagem.split('\n');
  const corpo = resto.join('\n');
  if (/^[a-z]+(\([^)]*\))?!:/.test(titulo) || corpo.includes('BREAKING CHANGE:')) {
    return 'major';
  }
  if (/^feat(\([^)]*\))?:/.test(titulo)) return 'minor';
  if (/^(fix|perf)(\([^)]*\))?:/.test(titulo)) return 'patch';
  return 'none';
}

export function tipoDeIncremento(mensagens) {
  let tipo = 'none';
  for (const mensagem of mensagens) {
    const atual = classificarCommit(mensagem);
    if (PESO[atual] > PESO[tipo]) tipo = atual;
  }
  return tipo;
}

export function incrementar(versao, tipo) {
  const [maior, menor, correcao] = versao.split('.').map(Number);
  if (tipo === 'major') return `${maior + 1}.0.0`;
  if (tipo === 'minor') return `${maior}.${menor + 1}.0`;
  if (tipo === 'patch') return `${maior}.${menor}.${correcao + 1}`;
  return versao;
}

export function gerarNotas(versao, mensagens) {
  const grupos = { Funcionalidades: [], 'Correções': [], Outros: [] };
  for (const mensagem of mensagens) {
    const titulo = mensagem.split('\n')[0];
    const tipo = classificarCommit(mensagem);
    if (tipo === 'major' || tipo === 'minor') grupos.Funcionalidades.push(titulo);
    else if (tipo === 'patch') grupos['Correções'].push(titulo);
    else grupos.Outros.push(titulo);
  }
  let notas = `## v${versao}\n`;
  for (const [nome, itens] of Object.entries(grupos)) {
    if (itens.length === 0) continue;
    notas += `\n### ${nome}\n\n${itens.map((t) => `- ${t}`).join('\n')}\n`;
  }
  return notas;
}

function git(comando) {
  return execSync(`git ${comando}`, { encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] }).trim();
}

function ultimaTag() {
  try {
    return git('describe --tags --abbrev=0 --match "v[0-9]*.[0-9]*.[0-9]*"');
  } catch {
    return null;
  }
}

function lerCommits(tag) {
  const intervalo = tag ? `${tag}..HEAD` : 'HEAD';
  const saida = git(`log ${intervalo} --format=%B${SEPARADOR}`);
  return saida
    .split(SEPARADOR)
    .map((m) => m.trim())
    .filter((m) => m.length > 0);
}

function main() {
  const tag = ultimaTag();
  const atual = tag ? tag.replace(/^v/, '') : '0.0.0';
  const mensagens = lerCommits(tag);

  let tipo = tipoDeIncremento(mensagens);
  let versao = incrementar(atual, tipo);

  // Primeira release do projeto: sempre 1.0.0.
  if (!tag && mensagens.length > 0) {
    tipo = 'major';
    versao = '1.0.0';
  }

  const release = tipo !== 'none';
  const saidas = { atual, versao, release: String(release), tipo };
  const linhas = Object.entries(saidas).map(([k, v]) => `${k}=${v}`).join('\n') + '\n';

  process.stdout.write(linhas);
  if (process.env.GITHUB_OUTPUT) appendFileSync(process.env.GITHUB_OUTPUT, linhas);
  if (process.env.NOTAS_ARQUIVO) {
    writeFileSync(process.env.NOTAS_ARQUIVO, gerarNotas(versao, mensagens));
  }
}

if (import.meta.url === pathToFileURL(process.argv[1] ?? '').href) {
  main();
}
