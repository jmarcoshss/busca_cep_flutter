import 'dart:convert';

import 'package:busca_cep_flutter/model/via_cep_model.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  
  
  Future<ViaCepModel> buscaCep(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
        
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCepModel.fromJson(json);
    }
    return ViaCepModel();
  }
}
