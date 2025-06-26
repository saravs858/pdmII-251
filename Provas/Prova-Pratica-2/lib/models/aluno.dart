class Aluno {
  final int id;
  final String nome;
  final String matricula;

  Aluno({
    required this.id,
    required this.nome,
    required this.matricula,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'matricula': matricula,
    };
  }
}