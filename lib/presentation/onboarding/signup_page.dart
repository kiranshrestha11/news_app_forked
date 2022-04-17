import 'package:flutter/material.dart';
import 'package:news_app/data/api/core_api_client.dart';
import 'package:news_app/presentation/home/home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController contactController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    contactController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Enter name'),
              controller: nameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter contact'),
              controller: contactController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter address'),
              controller: addressController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter email'),
              controller: emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter password'),
              controller: passwordController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Confirm password'),
              controller: confirmPasswordController,
            ),
            ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> signUpData = {
                    'name': nameController.text,
                    'profile': 'profile',
                    'contact': contactController.text,
                    'address': addressController.text,
                    'email': emailController.text,
                    'password': passwordController.text,
                    'password_confirmation': confirmPasswordController.text,
                    "status": "verified",
                    "role": "user"
                  };

                  final result =
                      await CoreApiClient().postData(data: signUpData);
                  if (result['message'] == 'success') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Succesfully Registered')));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result['data'].toString())));
                  }
                },
                child: const Text('Sign up'))
          ],
        ),
      ),
    );
  }
}
