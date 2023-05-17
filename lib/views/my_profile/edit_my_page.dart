import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shift_app/view_models/edit_my_view_model.dart';

class EditProfilePage extends StatelessWidget {
  static const routeName = '/EditProfilePage';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final editProfileViewModel = context.read<EditProfileViewModel>();
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール編集'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.text_decrease),
                    border: OutlineInputBorder(),
                    filled: true,
                    hintText: "名前",
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "名前を入れて下さい";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isUpdated = await editProfileViewModel.updateProfile(nameController.text);
                      if (isUpdated) {
                        // Navigate to my_page
                        context.go('/my_page');
                      } else {
                        // Show some error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('プロフィールの更新に失敗しました。'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('更新する'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
