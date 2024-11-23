import 'package:flutter/material.dart';
import 'package:new_store/models/user.dart';
import 'package:new_store/models/user_manager.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _email =
      TextEditingController(text: 'renatofss16@gmail.com');

  final TextEditingController _password = TextEditingController(text: '123456');
  UserManager userManager = UserManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 125, 141),
        title: const Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context,'signup');

          }, child: const Text('Criar conta',style: TextStyle(color: Colors.black,fontSize: 18)))
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 26),
          child: Form(
            key: _formKey,
            child: Consumer<UserManager>(builder: (_, userManager, __) {
              return ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(label: Text('Email')),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || !email.contains('@gmail.com')) {
                          return 'senha ivalida';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: _password,
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
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'esqueci minha senha',
                          style: TextStyle(color: Colors.black),
                        )),
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
                          String email = _email.text;
                          String password = _password.text;
                          UserLogged user =
                              UserLogged.login(email: email, password: password);
                          userManager.signIn(
                              userLogged: user,
                              onFail: (erro) {
                                setState(() {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(erro),
                                    duration: const Duration(seconds: 3),
                                  ));
                                });
                              });
                        }
                      },
                      child: userManager.loading
                          ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),)
                          : const Text(
                              'Entrar',
                            ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
