import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_berry_assignment/screens/support_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email, password;
  late bool _passwordVisible, _isLoading;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.only(top: 65.0),
                child: Center(
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 19,
                bottom: 24,
                right: MediaQuery.of(context).size.width * .15,
                left: MediaQuery.of(context).size.width * .15,
              ),
              child: Center(
                child: Text(
                  "Welcome back!",
                  style: GoogleFonts.sourceCodePro(
                    fontSize: MediaQuery.of(context).size.width * .089,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .15,
                right: MediaQuery.of(context).size.width * .15,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(
                      20,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 28,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 18,
                          ),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.sourceCodePro(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 6,
                            right: 6,
                          ),
                          child: TextFormField(
                            controller: usernameController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  fontSize: 16),
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 6,
                            right: 6,
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  child: Icon(!_passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  fontSize: 16),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                              right: 6,
                            ),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: _isLoading
                                    ? const SpinKitDoubleBounce(
                                        color: Colors.blue)
                                    : const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.blue,
                                      ),
                              ),
                            ),
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              if (usernameController.text.isNotEmpty) {
                                bool emailValid = RegExp(
                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(usernameController.text);

                                if (usernameController.text.length < 4 ||
                                    !emailValid) {
                                  const snackBar = SnackBar(
                                    content: Text(
                                      "Please Enter correct email",
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  return;
                                }
                              }
                              if (passwordController.text.isNotEmpty) {
                                if (passwordController.text.length < 6) {
                                  const snackBar = SnackBar(
                                    content: Text(
                                      "Password should be 6 character or long",
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  return;
                                }
                              }
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: usernameController.text
                                                .toString(),
                                            password: passwordController.text
                                                .toString());
                                const snackBar = SnackBar(
                                    content: Text('Loggin in successful'));
                                if (mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                                setState(() {
                                  email = userCredential.user!.email;
                                });
                                if (mounted) {
                                  Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                      builder: (_) => const SupportScreen(),
                                    )),
                                  );
                                }
                              } on FirebaseAuthException catch (e) {
                                final snackBar =
                                    SnackBar(content: Text('${e.message}'));
                                if (mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                                setState(() {
                                  _isLoading = false;
                                });
                              } catch (e) {
                                return;
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
