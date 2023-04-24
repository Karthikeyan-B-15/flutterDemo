import 'package:flutter/material.dart';
import 'package:flutter_demo/functions/authFunction.dart';
import 'package:flutter_demo/widgets/signUpPage.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome FlutterDev',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'learn once write anywhere',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              formField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget formField() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              key: ValueKey('email'),
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter email address',
                  filled: true,
                  fillColor: Color(0x1FA3A3A3)),
              validator: (value) {
                if (!(value.toString().contains('@'))) {
                  return 'Invalid Email';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  email = value!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey('password'),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none,
                  hintText: 'Enter password',
                  filled: true,
                  fillColor: Color(0x1FA3A3A3)),
              validator: (value) {
                if (value.toString().length < 6) {
                  return 'Password is so small';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                setState(() {
                  password = value!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        signIn(email, password, context);
                      }
                    },
                    child: const Text(
                      'SignIn',
                      style: TextStyle(fontSize: 16),
                    ))),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
              },
              child: const Text('Create an Account',
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
            )
          ],
        ));
  }
}
