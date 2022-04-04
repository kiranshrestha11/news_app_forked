import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LottieBuilder.asset(
            Config.loginAnimation,
            height: 200,
          ),
          Form(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: 'Enter your name',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, border: Border.all()),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: FaIcon(
                          FontAwesomeIcons.envelope,
                          color: Colors.green,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, border: Border.all()),
                    child: TextFormField(
                      obscureText: _obscure,
                      obscuringCharacter: '%',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                            icon: Icon(_obscure
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, border: Border.all()),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your phone number',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
