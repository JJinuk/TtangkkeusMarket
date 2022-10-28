import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ttangkkeusmarket/app/core/cloud_functions/auth_control.dart';
import 'package:ttangkkeusmarket/app/core/widgets/custom_appbar.dart';
import 'package:ttangkkeusmarket/app/src/modules/my_page/my_page_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isRegisterScreen = true;

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    // final _formKey = GlobalKey<FormState>();
    // final authService = Provider.of<AuthService>(context);s
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: '로그인',
        leading: IconButton(
          icon: const Icon(LineIcons.times),
          iconSize: 32.0,
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextFormField(
              controller: authController.loginEmailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your Email");
                }
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Please Enter a valid email");
                }
                return null;
              },
              onSaved: (value) {
                authController.loginEmailController.text = value!;
              },

              //loginEmailController.text,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFA2A7B9), width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  hintText: "아이디를 입력해주세요."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextFormField(
              controller: authController.loginPasswordContorller,
              obscureText: true,
              validator: (value) {
                RegExp regex = RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password is required for login");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 6 Character");
                }
                return null;
              },
              onSaved: (value) {
                authController.loginPasswordContorller.text = value!;
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFFA2A7B9), width: 1.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  hintText: "비밀번호를 입력해주세요."),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: Form(
              child: SizedBox(
                width: currentWidth - 15,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    authController.LoginUSER();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPageView()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFFF6C544,
                    ),
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            children: [
              TextButton(
                onPressed: () {
                  // forgot id screen
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.transparent,
                ),
                child: const Text(
                  '아이디 찾기',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // forgot password screen
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.transparent,
                ),
                child: const Text(
                  '비밀번호 찾기',
                  style: TextStyle(
                    color: Color(
                      0xFF000000,
                    ),
                    fontFamily: 'SF',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
            child: SizedBox(
              width: currentWidth - 15,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isRegisterScreen = false;
                  });
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(
                      0xFFF6C544,
                    ),
                    width: 1.0,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color(
                      0xFFF6C544,
                    ),
                    fontFamily: 'SF',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
