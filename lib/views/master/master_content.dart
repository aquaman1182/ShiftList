import 'package:flutter/material.dart';

class MasterPageContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('マスター'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('マスター'),
          ),
        ],
      ),
    );
  }
}