import 'package:chatapp/common/constrants.dart';
import 'package:chatapp/common/custom_navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: background),
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                        key: _globalKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Create Account!',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 44),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _nameTEController,
                              decoration:
                              const InputDecoration(hintText: 'Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field cannot be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailTEController,
                              decoration:
                              const InputDecoration(hintText: 'Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field cannot be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            TextFormField(
                              //keyboardType: TextInputType.emailAddress,
                              controller: _passwordTEController,
                              obscureText: true,
                              decoration:
                              const InputDecoration(hintText: 'password'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field cannot be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 44),
                            if (_isLoading)
                              const CircularProgressIndicator()
                            else
                              ElevatedButton(
                                  onPressed: () {}, child: const Text('Sign Up')),
                            const SizedBox(height: 44),
                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    text: 'Have account?',
                                    children: [
                                      TextSpan(
                                          style:
                                          const TextStyle(color: Colors.blue),
                                          text: 'login',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                            customNavigator(context, LoginPage());
                                            })
                                    ]))
                          ],
                        ))))));
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
