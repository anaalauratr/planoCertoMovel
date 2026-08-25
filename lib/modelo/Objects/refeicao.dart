import 'dart:convert';

class Refeicao {
  final int id;
  final String nome;
  final String descricao;
  final String horario;
  final int calorias;
  final int planoAlimentarId;
  final bool concluida;

  //construtor da classe que recebe cada um de seus atributos
  Refeicao({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.horario,
    required this.calorias,
    required this.planoAlimentarId,
    this.concluida = false, // campo local, ainda não existe no bd
  });

  // Converte o objeto para um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'horario': horario,
      'calorias': calorias,
      'plano_alimentar_id': planoAlimentarId,
      'concluida': concluida,
    };
  }

  // Cria um objeto a partir de um Map
  factory Refeicao.fromMap(Map<String, dynamic> map) {
    return Refeicao(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      horario: map['horario'] ?? '',
      calorias: map['calorias'] ?? 0,
      planoAlimentarId: map['plano_alimentar_id'] ?? 0,
      concluida: map['concluida'] ?? false,
    );
  }

  // Cria uma cópia do objeto trocando apenas o que for informado
  // para marcar e desmarcar como concluida sem mexer no resto dos dados
  Refeicao copyWith({bool? concluida}) {
    return Refeicao(
      id: id,
      nome: nome,
      descricao: descricao,
      horario: horario,
      calorias: calorias,
      planoAlimentarId: planoAlimentarId,
      concluida: concluida ?? this.concluida,
    );
  }

  // Facilita a conversão de uma lista de objetos para uma String JSON
  static String encode(List<Refeicao> refeicoes) => json.encode(
    refeicoes.map<Map<String, dynamic>>((r) => r.toMap()).toList(),
  );

  // Facilita a conversão de uma String JSON para uma lista de objetos
  static List<Refeicao> decode(String refeicoesJson) =>
      (json.decode(refeicoesJson) as List<dynamic>)
          .map<Refeicao>((item) => Refeicao.fromMap(item))
          .toList();
}