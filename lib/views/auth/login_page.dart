import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/LoginPage';

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = context.read();
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
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(), // 外枠付きデザイン
                      filled: true, // fillColorで指定した色で塗り潰し
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      // _formKey.currentState.validate()でコールされる
                      if (value!.isEmpty) {
                        return 'Please enter some text'; // エラー表示のメッセージを返す
                      }
                      return null; // 問題ない場合はnullを返す
                    },
                    onSaved: (value) => () {
                      // this._formKey.currentState.save()でコールされる
                      print('$value');
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: passController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.key),
                      border: OutlineInputBorder(), // 外枠付きデザイン
                      filled: true, // fillColorで指定した色で塗り潰し
                      hintText: 'パスワード',
                    ),
                    validator: (value) {
                      // _formKey.currentState.validate()でコールされる
                      if (value!.isEmpty) {
                        return 'Please enter some text'; // エラー表示のメッセージを返す
                      }
                      return null; // 問題ない場合はnullを返す
                    },
                    onSaved: (value) => () {
                      // this._formKey.currentState.save()でコールされる
                      print('$value');
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      authViewModel.startLoading();
                      // 追加の処理
                      try {
                        await authViewModel.signIn(
                            emailController.text, passController.text);
                        context.go('/shift_page');
                      } catch (e) {
                        //TODO
                      } finally {
                        authViewModel.endLoading();
                      }
                    },
                    child: const Text('ログイン'),
                  ),
                  TextButton(
                    onPressed: () {
                      // 画面遷移
                      context.go("/signup");
                    },
                    child: const Text('新規登録の方はこちら'),
                  ),
                ],
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