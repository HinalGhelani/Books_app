import 'package:flutter/material.dart';

import '../Helper/books_helper.dart';
import 'custom_paint.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isEye = false;

  String? email;
  String? password;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomPaint(
            painter: CurvePainter2(),
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              minimum: const EdgeInsets.only(top: 290),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.8),
            child: Form(
              key: loginFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Map<String, dynamic> res = (await FirebaseAuthHelper
                                .firebaseAuthHelper
                                .signInWithGoogle());

                            if (res['user'] != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Log In Successful with Google",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Color(0xff39425F),
                                ),
                              );
                              Navigator.of(context).pushReplacementNamed('/');
                            } else if (res['error'] != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    res['error'],
                                    style: const TextStyle(
                                      color: Color(0xff39425F),
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.white,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Login failed with Google...",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Color(0xff03111C),
                                ),
                              );
                            }
                          },
                          child: Ink(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xffE9E7E8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xff39425F),
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Sign Up With Google",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff39425F),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            Map<String, dynamic> res = await FirebaseAuthHelper
                                .firebaseAuthHelper
                                .logInWithAnonymously();

                            if (res['user'] != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Login with Anonymously Successful...",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Color(0xff39425F),
                                ),
                              );
                              Navigator.of(context).pushReplacementNamed('/',
                                  arguments: res['user']);
                            } else if (res['error'] != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(res['error']),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: const Color(0xff39425F),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Login Failed",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Color(0xff39425F),
                                ),
                              );
                            }
                          },
                          child: Ink(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xffE9E7E8),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xff39425F),
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/3282/3282224.png",
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Sign Up Anonymously",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff39425F),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Or Log In With",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: emailController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "please enter this email";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                email = emailController.text;
                              });
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Email",
                                prefixIcon: Icon(Icons.mail_outline),
                                labelText: "Email"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: passwordController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "please enter this password";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                password = passwordController.text;
                              });
                            },
                            textInputAction: TextInputAction.done,
                            obscureText: (isEye == false) ? true : false,
                            decoration: InputDecoration(
                              suffixIcon: (isEye == false)
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isEye = !isEye;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isEye = !isEye;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye_outlined,
                                      ),
                                    ),
                              border: const OutlineInputBorder(),
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock_outline),
                              labelText: "Password",
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            if (loginFormKey.currentState!.validate()) {
                              loginFormKey.currentState!.save();

                              Map<String, dynamic> res =
                                  await FirebaseAuthHelper.firebaseAuthHelper
                                      .signIn(
                                email: email!,
                                password: password!,
                              );
                              if (res['user'] != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Login Successfully....",
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Color(0xff39425F),
                                  ),
                                );
                                Navigator.of(context).pushReplacementNamed('/',
                                    arguments: res['user']);
                              } else if (res['error'] != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(res['error']),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: const Color(0xff39425F),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Signin in failed..."),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Color(0xff39425F),
                                  ),
                                );
                              }
                            }
                          },
                          child: Ink(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff39425F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an Account? ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('signup_page');
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 65),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "By SignUp in you are agree with ",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Terms of Service ",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const Text(
                              "&",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
