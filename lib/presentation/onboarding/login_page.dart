import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/config.dart';
import 'package:news_app/data/models/login_model.dart';
import 'package:news_app/presentation/home/home_screen.dart';
import 'package:news_app/presentation/onboarding/custom_field.dart';
import 'package:news_app/presentation/onboarding/login_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bool _obscure = true;
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://timesofindia.indiatimes.com/thumb/msid-90619435,width-1200,height-900,resizemode-4/90619435.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: const BoxDecoration(color: Colors.white),
                child: LottieBuilder.asset(
                  Config.loginAnimation,
                  height: 200,
                ),
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomField(
                        formkey: _key,
                        validationFunction: (data) {
                          if (data!.isEmpty || data.length < 4) {
                            return 'Invalid name';
                          } else {
                            return null;
                          }
                        },
                        controller: nameController,
                        hintText: 'Enter your name',
                        prefixIconData: Icons.person,
                      ),
                      CustomField(
                        formkey: _key,
                        validationFunction: (data) {
                          if (data!.isEmpty || !data.contains('@')) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        hintText: 'Enter your email',
                        prefixIconData: Icons.email,
                      ),
                      CustomField(
                        formkey: _key,
                        validationFunction: (data) {
                          if (data!.isEmpty) {
                            return 'Invalid password';
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        hintText: 'Enter your password',
                        prefixIconData: Icons.security,
                        obscure: true,
                        textInputAction: TextInputAction.done,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_key.currentState!.validate()) {
                            LoginModel loginModel = LoginModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            log(loginModel.toJson().toString());
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();
                            _prefs.setBool('loggedin', true);
                            _prefs.setString(
                                'userData', jsonEncode(loginModel.toJson()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(
                                  milliseconds: 600,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                                content: Text('Hello ${loginModel.name}'),
                              ),
                            );
                            Future.delayed(const Duration(seconds: 3), () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(
                                  milliseconds: 600,
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                content: Text('Invalid Form Data'),
                              ),
                            );
                          }
                        },
                        child: const LoginButton(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
