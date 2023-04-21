import 'package:flutter/material.dart';

class MyProfilePageContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('マイページ'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('マイページ'),
          ),
        ],
      ),
    );
  }
}