import 'package:sistema_controle_academico/models/professor.dart';
import 'package:sistema_controle_academico/models/disciplina.dart';
import 'package:sistema_controle_academico/models/aluno.dart';

class Curso {
  final int id;
  final String descricao;
  final List<Professor> professores = [];
  final List<Disciplina> disciplinas = [];
  final List<Aluno> alunos = [];

  Curso({
    required this.id,
    required this.descricao,
  });

  void adicionaProfessor(Professor professor) {
    professores.add(professor);
  }

  void adicionaDisciplina(Disciplina disciplina) {
    disciplinas.add(disciplina);
  }

  void adicionaAluno(Aluno aluno) {
    alunos.add(aluno);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'professores': professores.map((p) => p.toJson()).toList(),
      'disciplinas': disciplinas.map((d) => d.toJson()).toList(),
      'alunos': alunos.map((a) => a.toJson()).toList(),
    };
  }
}