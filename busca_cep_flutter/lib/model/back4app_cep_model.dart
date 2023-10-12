class Back4appCepModel {
  List<CepBack4appModel>? _ceps;

  Back4appCepModel({List<CepBack4appModel>? ceps}) {
    if (ceps != null) {
      _ceps = ceps;
    }
  }

  List<CepBack4appModel>? get ceps => _ceps;
  set ceps(List<CepBack4appModel>? results) => _ceps = results;

  Back4appCepModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _ceps = <CepBack4appModel>[];
      json['results'].forEach((v) {
        _ceps!.add(CepBack4appModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_ceps != null) {
      data['results'] = _ceps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CepBack4appModel {
  String _objectId = "";
  String _cep = "";
  String _logradouro = "";
  String _localidade = "";
  String _bairro = "";
  String _uf = "";
  String _createdAt = "";
  String _updatedAt = "";

  CepBack4appModel(
      String? objectId,
      String? cep,
      String? logradouro,
      String? localidade,
      String? bairro,
      String? uf,
      String? createdAt,
      String? updatedAt) {
    if (objectId != null) {
      _objectId = objectId;
    }
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (uf != null) {
      _uf = uf;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }
  CepBack4appModel.criar(
     
      String? cep,
      String? logradouro,
      String? localidade,
      String? bairro,
      String? uf,
     ) {
    
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (uf != null) {
      _uf = uf;
    }
    
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId!;
  String? get cep => _cep;
  set cep(String? cep) => _cep = cep!;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro!;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade!;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro!;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf!;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt!;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt!;

  CepBack4appModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _localidade = json['localidade'];
    _bairro = json['bairro'];
    _uf = json['uf'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['localidade'] = _localidade;
    data['bairro'] = _bairro;
    data['uf'] = _uf;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['localidade'] = _localidade;
    data['bairro'] = _bairro;
    data['uf'] = _uf;
    return data;
  }
}
