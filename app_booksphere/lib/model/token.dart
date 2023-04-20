class Token {
  String? nome;
  String? accessToken;
  String? refreshToken;

  Token({this.nome, this.accessToken, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
    nome = json['Nome'];
    accessToken = json['AccessToken'];
    refreshToken = json['RefreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome'] = nome;
    data['AccessToken'] = accessToken;
    data['RefreshToken'] = refreshToken;
    return data;
  }
}
