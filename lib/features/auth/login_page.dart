import 'package:chatapp/common/constrants.dart';
import 'package:chatapp/common/custom_navigator.dart';
import 'package:chatapp/features/auth/signup_page.dart';
import 'package:chatapp/features/ui/forgot_pass_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/features/ui/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


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
                              'Welcome Back!',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 44),
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
                            const SizedBox(height: 44),
                            TextFormField(
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
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () =>
                                    customNavigator(context, const ForgotPassPage()),
                                child: const Text('Forgot Password?',
                                    style: TextStyle(color: Colors.amber)),
                              ),
                            ),
                            const SizedBox(height: 44),

                              ElevatedButton(
                                  onPressed: () {
                                    customNavigator(
                                        context, const HomePage());

                                  }, child: const Text('Login')),
                            const SizedBox(height: 44),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                text: 'Register?',
                                children: [
                                  TextSpan(
                                    style: const TextStyle(color: Colors.blue),
                                    text: 'Sign Up',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        customNavigator(
                                            context, const SignUpPage());
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))))));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
