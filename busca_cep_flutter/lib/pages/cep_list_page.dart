import 'package:busca_cep_flutter/components/tile.dart';
import 'package:busca_cep_flutter/model/back4app_cep_model.dart';
import 'package:busca_cep_flutter/repository/back4app_cep_repository.dart';
import 'package:flutter/material.dart';

class CepListPage extends StatefulWidget {
  const CepListPage({super.key});

  @override
  State<CepListPage> createState() => _CepListPageState();
}

class _CepListPageState extends State<CepListPage> {
  late Back4appCepRepository back4appCepRepository;
  Back4appCepModel back4appCepModel = Back4appCepModel();

  @override
  void initState() {
    back4appCepRepository = Back4appCepRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    back4appCepModel = await back4appCepRepository.listaCep();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cep'),
      ),
      body: ListView.builder(
        itemCount: back4appCepModel.ceps?.length ?? 0,
        itemBuilder: (bc, index) {
          var endereco = back4appCepModel.ceps ?? [];
          var cep = endereco[index];
          return Dismissible(
            onDismissed: (DismissDirection dismissDirection) async {
              await back4appCepRepository.deletar(cep.objectId ?? "");
            },
            key: Key(cep.objectId ?? ""),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Tile(
                cep: cep.cep.toString(),
                lograouro: cep.logradouro.toString(),
                bairro: cep.bairro.toString(),
                localidade: cep.localidade.toString(),
                uf: cep.uf.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
