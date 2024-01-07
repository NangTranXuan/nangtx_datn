import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/components/components.dart';
import 'package:datn_test/components/under_part.dart';
import 'package:datn_test/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:datn_test/globals.dart' as globals;

import '../../constants/route.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> validateAndSubmit(
      String email, String password, BuildContext context) async {
    var response = await http.post(Uri.parse(urlLogin),
        body: {'email': email, 'password': password});
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      globals.accessToken = jsonResponse["access_token"];
      globals.tokenType = jsonResponse["type_token"];
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigatorPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'Invalid email or password',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.red,
          ),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/icons/login.png",
                ),
                const PageTitleBar(title: 'Login to your account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: emailController,
                              ),
                              RoundedPasswordField(
                                controller: passwordController,
                              ),
                              RoundedButton(
                                text: 'LOGIN',
                                press: () {
                                  validateAndSubmit(
                                    emailController.text,
                                    passwordController.text,
                                    context,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      RoundedIcon(imageUrl: "assets/icons/facebook.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/icons/google.jpg"),
    ],
  );
}
