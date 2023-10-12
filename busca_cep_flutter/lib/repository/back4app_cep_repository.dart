import 'package:busca_cep_flutter/model/back4app_cep_model.dart';
import 'package:dio/dio.dart';

class Back4appCepRepository {
  Back4appCepModel back4appCepModel = Back4appCepModel();
  var _dio = Dio();
  Back4appCepRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        "Ydne9ibbfm9MxtPXbPk7cHqNgWWImMhcSFUhah3p";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "EfGfAFNZ5ptmAEur9JVNSjmrfsj3W8coQL6yRQG2";
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<Back4appCepModel> listaCep() async {
    var response = await _dio.get("/cep");

    return Back4appCepModel.fromJson(response.data);
  }
  Future<void> criar (CepBack4appModel cepBack4appModel)async{
    try {
    await _dio.post('/cep', data: cepBack4appModel.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletar (String objectId)async{
    try {
    await _dio.delete('/cep/$objectId');
    } catch (e) {
      rethrow;
    }
  }
}
