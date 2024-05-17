import 'package:flutter/material.dart';
import 'package:kabrgy/services/services.dart';
import 'package:kabrgy/themes/themes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _LoginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _LoginKey,
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppTheme().appTheme.colorScheme.background,
          child: Column(children: <Widget>[
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text('Login:',
                        style: AppTheme().appTheme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: passwordController,
                    style: const TextStyle(fontSize: 16),
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                        onPressed: () {
                          Services().login(email: emailController.text, password: passwordController.text, context: context);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              AppTheme().appTheme.colorScheme.primary),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Divider(),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        style: const ButtonStyle(
                            alignment: Alignment.centerLeft,
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don’t have an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme()
                                      .appTheme
                                      .colorScheme
                                      .onSecondary,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Click me to Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      AppTheme().appTheme.colorScheme.primary,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
