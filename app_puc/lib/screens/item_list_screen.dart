import 'package:flutter/material.dart';

class ItemListScreen extends StatelessWidget {
  final String nome;
  const ItemListScreen({ required this.nome });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem vindo(a), $nome')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Alerta'),
                  content: Text('Você clicou no item $index'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text('Sim')),
                    TextButton(onPressed: () => Navigator.pop(context), child: Text('Não')),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
