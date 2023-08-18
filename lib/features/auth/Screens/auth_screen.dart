import 'package:amazon/Constants/global_variable.dart';
import 'package:amazon/common/custome_button.dart';
import 'package:amazon/common/custome_textfield.dart';
import 'package:amazon/features/auth/Services/auth_services.dart';
import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  //no need for context since we are in stateful widget

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signinUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Golobal_variable.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? Colors.white
                    : Golobal_variable.backgroundColor,
                leading: Radio(
                  activeColor: Golobal_variable.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
                title: Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTexField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTexField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTexField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: "Sign Up",
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? Colors.white
                    : Golobal_variable.backgroundColor,
                leading: Radio(
                  activeColor: Golobal_variable.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
                title: Text(
                  "Sign-in ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTexField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTexField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTexField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: "Sign In",
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signinUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
