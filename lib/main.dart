import 'package:flutter/material.dart';

void main() {
  runApp(const AppBanco());
}

class AppBanco extends StatelessWidget {
  const AppBanco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Banco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _chave = GlobalKey<FormState>();
  final List<String> _transactions = [];

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _transacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _chave,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome da conta'),
              ),
              TextFormField(
                controller: _numeroController,
                decoration: const InputDecoration(labelText: 'Número da conta'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _transacaoController,
                decoration: const InputDecoration(labelText: 'Transação'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("Adicionado");
                },
                child: const Text('Adicionar transição'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_transactions[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
