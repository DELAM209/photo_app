import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoViewDetail extends StatelessWidget {
  final String title;

  PhotoViewDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(title),
    );
  }
}
