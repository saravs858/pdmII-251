import 'package:sistema_controle_academico/models/disciplina.dart';

class Professor {
  final int id;
  final String codigo;
  final String nome;
  final List<Disciplina> disciplinas = [];

  Professor({
    required this.id,
    required this.codigo,
    required this.nome,
  });

  void adicionaDisciplina(Disciplina disciplina) {
    disciplinas.add(disciplina);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'nome': nome,
      'disciplinas': disciplinas.map((d) => d.toJson()).toList(),
    };
  }
}