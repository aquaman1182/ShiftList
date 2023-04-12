import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/login_view_model.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = context.read();
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: "email",
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "テキストを入力して下さい。";
                  }
                  return null;
                },
                onSaved: (value) => () {
                  print("$value");
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: 'パスワード',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => () {
                  print('$value');
                },
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async{
                  loginViewModel.startLoading();
                  try {
                    await loginViewModel.login(
                      emailController.text, passController.text);
                      GoRouter.of(context).go('/shift_list');
                  } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(e.toString()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } finally {
                      loginViewModel.endLoading();
                  }

                },
                child: const Text("ログイン")
              ),
              ElevatedButton(
                onPressed: () {
                  context.go("/register");
                }, 
                child: const Text("新規登録")
              )
            ]
          ),
        ),
      ),
    );
  }
}