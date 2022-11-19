import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../widgets/my_button.dart';
import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        body: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RegisterStatusState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
              log(state.data.toString());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Create A New Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
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
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.smartphone),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocSelector<RegisterBloc, RegisterState, bool>(
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
                                .read<RegisterBloc>()
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
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: MyButton(
                      'Sign Up',
                      onClick: () => _onRegisterClick(context),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have An Account?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Sign In'),
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

  _onRegisterClick(BuildContext context) {
    final email = emailController.text;
    final password = passwordController.text;
    final user = User(email: email, password: password);
    context.read<RegisterBloc>().add(RegisterUserEvent(user));
  }
}
