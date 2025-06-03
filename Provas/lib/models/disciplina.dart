class Disciplina {
  final int id;
  final String descricao;
  final int qtdAulas;

  Disciplina({
    required this.id,
    required this.descricao,
    required this.qtdAulas,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'qtdAulas': qtdAulas,
    };
  }
}