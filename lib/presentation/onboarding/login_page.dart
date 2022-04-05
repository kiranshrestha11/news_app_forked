import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/config.dart';
import 'package:news_app/data/models/login_model.dart';
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
  bool _obscure = true;

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
                decoration: BoxDecoration(color: Colors.white),
                child: LottieBuilder.asset(
                  Config.loginAnimation,
                  height: 200,
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CustomField(
                        controller: nameController,
                        hintText: 'Enter your name',
                        prefixIconData: Icons.person,
                      ),
                      CustomField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        prefixIconData: Icons.email,
                      ),
                      CustomField(
                        controller: passwordController,
                        hintText: 'Enter your password',
                        prefixIconData: Icons.security,
                        obscure: true,
                        textInputAction: TextInputAction.done,
                      ),
                      InkWell(
                        onTap: () {
                          LoginModel loginModel = LoginModel(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          log(loginModel.toJson().toString());
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
