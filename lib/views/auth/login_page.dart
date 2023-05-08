import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginPage';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = context.watch();
    final emailController = TextEditingController();
    final passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン'),
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passController,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                        icon: Icon(authViewModel.obscureText ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => authViewModel.togglePasswordVisibility(),
                        ),
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
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authViewModel.startLoading();
                          try {
                            await authViewModel.signIn(
                                emailController.text, passController.text);
                            context.go('/shift_page');
                          } catch (e) {
                            authViewModel.setErrorMessage(
                                'メールアドレスまたはパスワードが間違っています。');
                          } finally {
                            authViewModel.endLoading();
                          }
                        }
                      },
                      child: const Text('ログイン'),
                    ),
                    if (authViewModel.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          authViewModel.errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    TextButton(
                      onPressed: () {
                        context.go("/signup");
                      },
                      child: const Text('新規登録の方はこちら'),
                    ),
                  ],
                ),
              ),
            ),
            if (authViewModel.isLoading)
              Container(
                color: Colors.black54,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
