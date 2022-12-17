import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseUrl = "http://localhost:8000/api/";

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}