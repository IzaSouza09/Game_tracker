String? validarNota(String? valor) {
  if (valor == null || valor.isEmpty) {
    return 'Informe a nota';
  }

  final nota = double.tryParse(valor.replaceAll(',', '.'));

  if (nota == null) {
    return 'Digite um número válido';
  }

  if (nota < 0 || nota > 10) {
    return 'A nota deve estar entre 0 e 10';
  }

  return null;
}