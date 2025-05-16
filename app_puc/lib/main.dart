import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/home': (context) => HomeScreen(),
    },
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_emailController.text == 'admin@admin.com' &&
        _passwordController.text == '12345') {
      Navigator.of(context).pushReplacementNamed('/home', arguments: _nameController.text);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Dados inválidos'),
          content: Text('Usuário e/ou senha incorreto(a)'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Nome')),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Senha'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Entrar'))
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nome = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Bem vindo(a), \$nome')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item \$index'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Alerta'),
                  content: Text('Você clicou no item \$index'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Sim')),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Não')),
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
