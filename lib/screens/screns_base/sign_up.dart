import 'package:flutter/material.dart';
import 'package:new_store/models/user.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserLogged _userLogged = UserLogged();

  final TextEditingController _nome =
      TextEditingController(text: 'Renato Firmino');
  final TextEditingController _email =
      TextEditingController(text: 'renatofss16@gmail.com');

  final TextEditingController _password1 =
      TextEditingController(text: '123456');
  final TextEditingController _password2 =
      TextEditingController(text: '123456');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        title: const Text('cadastro'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _nome,
                    decoration: const InputDecoration(label: Text('nome')),
                    keyboardType: TextInputType.emailAddress,
                    validator: (nome) {
                      if (nome == null || nome.isEmpty) {
                        return 'Este campo nao pode ficar vazio';
                      }
                      return null;
                    },
                    onSaved: (nome) => _userLogged.name = nome!,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(label: Text('Email')),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email == null || !email.contains('@gmail.com')) {
                        return 'email ivalido';
                      }
                      return null;
                    },
                    onSaved: (email) => _userLogged.email = email!,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _password1,
                    decoration: const InputDecoration(label: Text('senha')),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (password) {
                      if (password != null) {
                        if (password.isEmpty || password.length < 6) {
                          return 'senha ivalida';
                        }
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: _password2,
                    decoration: const InputDecoration(label: Text('senha')),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (password) {
                      String firstPassword = _password1.text;

                      if (firstPassword != password) {
                        return 'as senhas percisa ser iguais';
                      }
                      _userLogged.password = firstPassword;
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Cor do botão
                      foregroundColor: Colors.black, // Cor do texto
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //user manager
                        context
                            .read<UserManager>()
                            .signUp(_userLogged, _snackBarError, () {debugPrint('sucesso');});
                      }
                    },
                    child: const Text(
                      'Cadastra',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _snackBarError() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Erro ao criar usuario'),
      duration: Duration(seconds: 3),
    ));
  }
}
