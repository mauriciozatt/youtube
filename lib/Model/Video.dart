class Video {
  //Atributos

  String _id;
  String _titulo;
  String _descricao;
  String _imagem;
  String _canal;


  //construtor
   Video(this._id, this._titulo, this._descricao, this._imagem, this._canal);

  String get id => _id;

  set id(String value) {
    _id = value;
  }


  String get titulo => _titulo;

  String get canal => _canal;

  set canal(String value) {
    _canal = value;
  }

  String get imagem => _imagem;

  set imagem(String value) {
    _imagem = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  set titulo(String value) {
    _titulo = value;
  }
}
