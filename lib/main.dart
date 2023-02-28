import 'package:flutter/material.dart';
import 'package:video_call/my_login.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "login": (context) => const Mylogin(),
    },
    initialRoute: "login",
  ));
}
