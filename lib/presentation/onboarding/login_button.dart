import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/data/models/login_model.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 128),
      decoration: BoxDecoration(color: Colors.white),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
