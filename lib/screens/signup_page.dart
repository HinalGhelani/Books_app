import 'package:firebase_books_app/Helper/books_helper.dart';
import 'package:firebase_books_app/screens/custom_paint.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEye = false;

  String? name;
  String? email;
  String? password;

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
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
              key: signUpFormKey,
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Text(
                    "Create An Account",
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
                                    "Sign Up Successful with Google",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Color(0xff39425F),
                                ),
                              );
                              Navigator.of(context).pushReplacementNamed('/',arguments: res['user']);
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
                          "Or Sign Up With",
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
                            controller: nameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "please enter this name";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                name = nameController.text;
                              });
                            },
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Full Name",
                              prefixIcon: Icon(Icons.person_2_outlined),
                              labelText: "Full Name",
                            ),
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
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            if (signUpFormKey.currentState!.validate()) {
                              signUpFormKey.currentState!.save();

                              Map<String, dynamic> res =
                                  await FirebaseAuthHelper.firebaseAuthHelper
                                      .signUp(
                                email: email!,
                                password: password!,
                              );
                              if (res['user'] != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Sign up successful...."),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Color(0xff39425F),
                                  ),
                                );
                                Navigator.of(context).pushReplacementNamed('/',arguments: res['user']);
                              } else if (res['user'] != null) {
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
                                    content: Text("Sign up Failed..."),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Color(0xff39425F),
                                  ),
                                );
                              }
                            }
                            setState(() {
                              emailController.clear();
                              passwordController.clear();
                              nameController.clear();
                              email = null;
                              password = null;
                              name = null;
                            });
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
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an Account? ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('login_page');
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
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
