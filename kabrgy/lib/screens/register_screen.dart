import 'package:flutter/material.dart';
import 'package:kabrgy/auth_gate.dart';
import 'package:kabrgy/services/services.dart';
import 'package:kabrgy/themes/themes.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _RegisterKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String brgyController = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _RegisterKey,
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: AppTheme().appTheme.colorScheme.surface,
          child: Column(children: <Widget>[
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: Text('Register your barangay!',
                        style: AppTheme().appTheme.textTheme.titleMedium),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
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
                  Column(children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownMenu<String>(
                            expandedInsets: EdgeInsets.zero,
                            hintText: "Barangay",
                            textStyle: const TextStyle(fontSize: 16),
                            onSelected: (String? value) {
                              brgyController = value!;
                            },
                            dropdownMenuEntries: brgyList
                                .map<DropdownMenuEntry<String>>(
                                    (String value) {
                              return DropdownMenuEntry<String>(
                                value: value,
                                label: value,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ]),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                        onPressed: () {
                          Services().register(
                            email: emailController.text, 
                            password: passwordController.text,
                            barangay: brgyController,
                            context: context);
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
                          "Register",
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
                          Navigator.of(context).pushNamed('/login');
                        },
                        style: const ButtonStyle(
                            alignment: Alignment.centerLeft,
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Have an account?',
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
                                'Click me to Login',
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
