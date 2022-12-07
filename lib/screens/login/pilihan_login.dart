import 'package:flutter/material.dart';
import 'package:register_login/screens/login/admin_login_screen.dart';
import 'package:register_login/screens/login/login_screen.dart';
import 'package:register_login/widgets/my_button.dart';

class PilihanLogin extends StatefulWidget {
  const PilihanLogin({super.key});

  @override
  State<PilihanLogin> createState() => _PilihanLoginState();
}

class _PilihanLoginState extends State<PilihanLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 44,
              child: MyButton(
                'User',
                onClick: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen())),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: MyButton(
                'Admin',
                onClick: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminLoginScreen())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
