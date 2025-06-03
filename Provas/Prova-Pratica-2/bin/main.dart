import 'package:sistema_controle_academico/models/aluno.dart';
import 'package:sistema_controle_academico/models/curso.dart';
import 'package:sistema_controle_academico/models/disciplina.dart';
import 'package:sistema_controle_academico/models/professor.dart';
import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  // Criar disciplinas
  var matematica = Disciplina(
    id: 1,
    descricao: 'Matemática Básica',
    qtdAulas: 60,
  );

  var programacao = Disciplina(
    id: 2,
    descricao: 'Programação em Dart',
    qtdAulas: 80,
  );

  // Criar professores
  var professor1 = Professor(
    id: 1,
    codigo: 'PROF001',
    nome: 'Ricardo Taveira',
  );
  professor1.adicionaDisciplina(matematica);
  professor1.adicionaDisciplina(programacao);

  var professor2 = Professor(
    id: 2,
    codigo: 'PROF002',
    nome: 'Maria Silva',
  );
  professor2.adicionaDisciplina(programacao);

  // Criar alunos
  var aluno1 = Aluno(
    id: 1,
    nome: 'João da Silva',
    matricula: '20230001',
  );

  var aluno2 = Aluno(
    id: 2,
    nome: 'Ana Oliveira',
    matricula: '20230002',
  );

  // Criar curso e adicionar entidades
  var curso = Curso(
    id: 1,
    descricao: 'Ciência da Computação',
  );

  curso.adicionaProfessor(professor1);
  curso.adicionaProfessor(professor2);
  curso.adicionaDisciplina(matematica);
  curso.adicionaDisciplina(programacao);
  curso.adicionaAluno(aluno1);
  curso.adicionaAluno(aluno2);


  final jsonData = curso.toJson();
  final jsonString = JsonEncoder.withIndent('  ').convert(jsonData);
  print(jsonString);

  await enviarEmail(jsonString);
}

Future<void> enviarEmail(String jsonData) async {
  final smtpServer = gmail('sara.silva09@aluno.ifce.edu.br', 'tlid roct dyaw ewip');
  
  final message = Message()
    ..from = Address('sara.silva09@aluno.ifce.edu.br', 'Sara Vieira')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'Dados do Sistema Acadêmico'
    ..text = 'Dados em formato JSON:\n\n$jsonData';

  try {
    await send(message, smtpServer);
    print('Email enviado com sucesso!');
  } on MailerException catch (e) {
    print('Erro ao enviar email: $e');
  }
}
