import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 128),
      decoration: const BoxDecoration(color: Colors.white),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
