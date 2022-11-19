import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_login/screens/home/home_screen.dart';
import 'package:register_login/screens/register/register_screen.dart';
import 'package:register_login/widgets/my_button.dart';
import 'package:register_login/widgets/my_text_field.dart';

import '../../models/user_model.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoginStatusState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
              log(state.data.toString());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Login To Your Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocSelector<LoginBloc, LoginState, bool>(
                    selector: (state) => state.isHidePassword,
                    builder: (context, state) {
                      return TextFormField(
                        controller: passwordController,
                        obscureText: state,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: IconButton(
                            onPressed: () => context
                                .read<LoginBloc>()
                                .add(ShowPasswordEvent(!state)),
                            icon: Icon(state
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Click Here'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: MyButton(
                      'Sign In',
                      onClick: () => _onLoginClick(context),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t Have An Account?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _onLoginClick(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;
    final user = User(email: email, password: password);
    context.read<LoginBloc>().add(LoginUserEvent(user));
  }
}
