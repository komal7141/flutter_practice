import 'package:flutter/material.dart';

class data extends StatelessWidget {
  final id;
  const data({Key?key,this.id}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
    );
  }
}
