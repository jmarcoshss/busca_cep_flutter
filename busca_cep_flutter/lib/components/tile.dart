import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile(
      {super.key, required this.cep,
      required this.lograouro,
      required this.bairro,
      required this.localidade,
      required this.uf});

  String cep = '';
  String lograouro = '';
  String bairro = '';
  String localidade = '';
  String uf = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CEP: $cep'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Logradouro: $lograouro'), Text('uf: $uf')],
            ),
            Text('Bairro: $bairro'),
            Text('Localidade: $localidade')
          ],
        ),
      ),
    );
  }
}
