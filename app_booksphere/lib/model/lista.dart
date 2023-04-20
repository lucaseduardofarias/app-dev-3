class ListaLivros {
  late int id;
  late String titulo;
  late int quantidade;
  late String imagem;

  ListaLivros(
      {required this.id,
      required this.titulo,
      required this.quantidade,
      required this.imagem});

  ListaLivros.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    quantidade = json['quantidade'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['titulo'] = titulo;
    data['quantidade'] = quantidade;
    data['imagem'] = imagem;
    return data;
  }
}
