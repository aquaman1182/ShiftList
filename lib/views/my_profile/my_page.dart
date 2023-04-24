import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('マイページ'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("マイページ", style: TextStyle(fontSize: 30),),
            ),
          ),
        ],
      ),
    );
  }
}