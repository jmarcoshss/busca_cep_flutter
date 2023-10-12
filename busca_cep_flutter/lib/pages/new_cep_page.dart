import 'package:busca_cep_flutter/model/back4app_cep_model.dart';
import 'package:busca_cep_flutter/pages/cep_list_page.dart';
import 'package:busca_cep_flutter/repository/back4app_cep_repository.dart';
import 'package:flutter/material.dart';

class NewCepPage extends StatefulWidget {
  const NewCepPage({super.key});

  @override
  State<NewCepPage> createState() => _NewCepPageState();
}

class _NewCepPageState extends State<NewCepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController localidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  Back4appCepRepository back4appCepRepository = Back4appCepRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo CEP'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('CEP'),
                  TextField(
                    controller: cepController,
                  ),
                  const Text('Logradouro'),
                  TextField(
                    controller: logradouroController,
                  ),
                  const Text('Bairro'),
                  TextField(
                    controller: bairroController,
                  ),
                  const Text('Localidade'),
                  TextField(
                    controller: localidadeController,
                  ),
                  const Text('UF'),
                  TextField(
                    controller: ufController,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await back4appCepRepository.criar(
                          CepBack4appModel.criar(
                              cepController.text,
                              logradouroController.text,
                              localidadeController.text,
                              bairroController.text,
                              ufController.text),
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CepListPage()));
                      },
                      child: const Text('Cadastrar'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
