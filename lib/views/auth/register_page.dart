import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/register_view_model.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final RegisterViewModel registerViewModel = context.read();
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (_) => IconButton(
            onPressed: () {
              context.go("/");
            }, 
            icon: Icon(Icons.arrow_back)
          )
        ),
        title: Text("新規登録"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
              SizedBox(
                height: 10.0,
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
                  registerViewModel.startLoading();
                  try {
                    await registerViewModel.signUp(emailController.text, passController.text);
                    context.go("/");
                  } catch (e) {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(e.toString()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } finally {
                    registerViewModel.endLoading();
                  }
                }, 
                child: const Text("新規登録"),
              )
            ]
          ),
        ),
      ),
    );
  }
}