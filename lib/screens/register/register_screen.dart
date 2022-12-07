import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../models/user_model.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/my_button.dart';
import '../login/login_screen.dart';
import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  var _user = User();
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
              child: FormBuilder(
                key: _formKey,
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
                    MyTextField(
                      'name',
                      hint: 'Name',
                      preffixIcon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MyTextField(
                      'email',
                      hint: 'Email',
                      preffixIcon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MyTextField(
                      'handphone',
                      keyboardType: TextInputType.phone,
                      hint: 'Phone',
                      preffixIcon: Icon(Icons.smartphone),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlocSelector<RegisterBloc, RegisterState, bool>(
                      selector: (state) => state.isHidePassword,
                      builder: (context, state) {
                        return MyTextField(
                          'password',
                          isObscureText: state,
                          hint: 'Password',
                          preffixIcon: Icon(Icons.key),
                          suffixIcon: IconButton(
                            onPressed: () => context
                                .read<RegisterBloc>()
                                .add(ShowPasswordEvent(!state)),
                            icon: Icon(state
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return MyTextField(
                          'confirm password',
                          isObscureText: state.isHideConfirmPassword,
                          hint: 'Confirm Password',
                          preffixIcon: Icon(Icons.key),
                          suffixIcon: IconButton(
                            onPressed: () => context.read<RegisterBloc>().add(
                                ShowConfirmPasswordEvent(
                                    !state.isHideConfirmPassword)),
                            icon: Icon(state.isHideConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        );
                      },
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text('Sign In'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _onRegisterClick(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final name = _formKey.currentState?.value['name'];
      final email = _formKey.currentState?.value['email'];
      final handphone = _formKey.currentState?.value['handphone'];
      final password = _formKey.currentState?.value['password'];
      _user = User(
        name: name,
        email: email,
        handphone: handphone,
        password: password,
      );
    }
    context.read<RegisterBloc>().add(RegisterUserEvent(_user));
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
