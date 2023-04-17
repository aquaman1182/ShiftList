import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/login_view_model.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新規登録"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: "メールアドレス"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "メールアドレスを入れて下さい";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0,),
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  border:  OutlineInputBorder(),
                  filled: true,
                  hintText: "パスワード"
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "パスワードを入れて下さい";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0,),
              ElevatedButton(
                onPressed: () {

                }, 
                child: const Text("新規登録")
              )
            ]
          ),
        ),
      ),
    );
  }
  Future<void> signUp(BuildContext context) async{
    final AuthViewModel authViewModel = context.read();
    await authViewModel.signUp(emailController.text, passController.text);
    context.go("/");
  }
}