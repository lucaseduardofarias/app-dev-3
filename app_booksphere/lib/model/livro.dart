class Livro {
  late int id;
  late String titulo;
  late String descricao;
  late int paginas;
  late int paginasLidas;
  late String imagem;

  Livro(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.paginas,
      required this.paginasLidas,
      required this.imagem});

  Livro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    paginas = json['paginas'];
    paginasLidas = json['paginas_lidas'];
    imagem = json['imagem'];
  }
}
