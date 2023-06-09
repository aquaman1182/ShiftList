import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/view_models/user_view_model.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
        //右側にTextButtonで編集画面へ遷移されるボタンを追加する
        actions: [
          TextButton(
            onPressed: () {
              //GoRouterを使って画面遷移する
              context.go("/my_page/edit");
            },
            child: Text(
              '編集',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: userViewModel.fetchUserProfile('dummyUserId'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            UserClassData? user = userViewModel.userProfile;
            if (user != null) {
              return ListView(
                children: [
                  ListTile(
                    title: Text('ユーザー名'),
                    subtitle: Text(user.userName),
                  ),
                  ListTile(
                    title: Text('プロフィール画像'),
                    subtitle: Image.network(user.profileImageUrl),
                  ),
                  ListTile(
                    title: Text('メールアドレス'),
                    subtitle: Text(user.email),
                  ),
                  ListTile(
                    title: Text('電話番号'),
                    subtitle: Text(user.phoneNumber),
                  ),
                ],
              );
            } else {
              return Center(child: Text('ユーザーデータがありません'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
