import 'package:busca_cep_flutter/model/via_cep_model.dart';
import 'package:busca_cep_flutter/pages/cep_list_page.dart';
import 'package:busca_cep_flutter/pages/new_cep_page.dart';
import 'package:busca_cep_flutter/repository/via_cep_repository.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController cepController = TextEditingController();
  ViaCepModel viaCepModel = ViaCepModel();

  ViaCepRepository viaCepRepository = ViaCepRepository();

  bool loading = false;
  String logradouro = '';
  String localidade = '';
  String uf = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Cep'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Text('CEP'),
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                onChanged: (String value) async {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                    viaCepModel = await viaCepRepository.buscaCep(cep);

                    localidade = viaCepModel.localidade ?? "";
                    logradouro = viaCepModel.logradouro ?? "";
                    uf = viaCepModel.uf ?? "";
                  }
                  setState(() {
                    loading = false;
                  });
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewCepPage()));
                  },
                  child: const Text('Não achou o cep? cadastre um novo.')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CepListPage()));
                  },
                  child: const Text('veja os cep cadastrados')),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator()),
              Text(logradouro),
              Text('$localidade - $uf')
            ],
          )
        ],
      ),
    );
  }
}
