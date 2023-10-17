import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/main_screen.dart';

import '../utils/dims/dims.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isKeyboard = false;
  bool _isVisible = false;
  bool _isVisible_conf = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confPass = TextEditingController();
  final GlobalKey<FormState> _authForm = GlobalKey<FormState>();
  RegExp r1 = RegExp(r'(?=.*?[0-9]).{6,}$');

  void _onTap() {
    setState(() {
      _isKeyboard = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;
    UserCredential userCred;

    void submit(
      String email,
      String pass,
      String name,
    ) async {
      try {
        userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        userCred.user!.updateDisplayName(name);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const MainScreen()));
      } on FirebaseAuthException catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message!,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer),
            ),
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
          ),
        );
      }
    }

    void formValidate() {
      final valid = _authForm.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (valid) {
        submit(
          email.text.trim(),
          pass.text.trim(),
          name.text.trim(),
        );
      } else {
        return;
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _isKeyboard = false;
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -pageHeight * 0.02,
                left: -pageWidth * 0.172,
                child: !_isKeyboard
                    ? Container(
                        height: pageHeight * 0.3,
                        width: pageWidth * 1.35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(pageWidth),
                            bottomRight: Radius.circular(pageWidth),
                          ),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        clipBehavior: Clip.hardEdge,
                        // height: 100,
                        // width: 100,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                            height: pageHeight * 0.24,
                            width: pageWidth * 0.68,
                            child: Image.asset(
                              "assets/images/register_logo.png",
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
              Positioned(
                top: !_isKeyboard ? pageHeight * 0.3 : 0,
                child: SizedBox(
                  width: pageWidth,
                  height: !_isKeyboard ? pageHeight * 0.7 : pageHeight,
                  child: Column(
                    children: [
                      Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                              fontFamily: 'Fertigo',
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: pageHeight * 0.01),
                        child: Text(
                          "Join us and have fun!",
                          style: GoogleFonts.roboto(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: pageWidth * 0.03,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      verticalSpacing(pageHeight * 0.02),
                      Form(
                          key: _authForm,
                          child: Column(
                            children: [
                              Container(
                                height: pageHeight * 0.08,
                                padding: EdgeInsets.only(
                                  top: pageHeight * 0.015,
                                  left: pageWidth * 0.1,
                                  right: pageWidth * 0.1,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    label: Text("Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            )),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(pageWidth * 0.022),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Name cannot be empty";
                                    } else if (!RegExp(r'^[a-zA-Z]+$')
                                        .hasMatch(value)) {
                                      return "Name can contain only letters.";
                                    }
                                    return null;
                                  },
                                  controller: name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  onTap: _onTap,
                                ),
                              ),
                              Container(
                                height: pageHeight * 0.08,
                                padding: EdgeInsets.only(
                                  top: pageHeight * 0.015,
                                  left: pageWidth * 0.1,
                                  right: pageWidth * 0.1,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    label: Text("Email",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            )),
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(pageWidth * 0.022),
                                      ),
                                    ),
                                  ),
                                  controller: email,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Please enter a valid email!';
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  onTap: _onTap,
                                ),
                              ),
                              Container(
                                height: pageHeight * 0.08,
                                padding: EdgeInsets.only(
                                  top: pageHeight * 0.015,
                                  left: pageWidth * 0.1,
                                  right: pageWidth * 0.1,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    label: Text("Password",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            )),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    suffixIconColor: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    suffixIcon: !_isVisible
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isVisible = !_isVisible;
                                              });
                                            },
                                            icon: const Icon(Icons.visibility))
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isVisible = !_isVisible;
                                              });
                                            },
                                            icon: const Icon(
                                                Icons.visibility_off)),
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(pageWidth * 0.022),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter a password!";
                                    } else if (!r1.hasMatch(value)) {
                                      return "Please enter at least 1 number and 6 or more characters!";
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: !_isVisible,
                                  controller: pass,
                                  onTap: _onTap,
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      _isKeyboard = false;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                height: pageHeight * 0.08,
                                padding: EdgeInsets.only(
                                  top: pageHeight * 0.015,
                                  left: pageWidth * 0.1,
                                  right: pageWidth * 0.1,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    label: Text("Confirm Password",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            )),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    suffixIconColor: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    suffixIcon: !_isVisible_conf
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isVisible_conf =
                                                    !_isVisible_conf;
                                              });
                                            },
                                            icon: const Icon(Icons.visibility))
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _isVisible_conf =
                                                    !_isVisible_conf;
                                              });
                                            },
                                            icon: const Icon(
                                                Icons.visibility_off)),
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(pageWidth * 0.022),
                                      ),
                                    ),
                                  ),
                                  obscureText: !_isVisible_conf,
                                  onTap: _onTap,
                                  controller: confPass,
                                  validator: (value) {
                                    if (value != pass.text) {
                                      return "Passwords do not match!";
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      _isKeyboard = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )),
                      verticalSpacing(pageHeight * 0.04),
                      ElevatedButton(
                        onPressed: formValidate,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primaryContainer),
                          minimumSize: MaterialStatePropertyAll(
                            Size(pageWidth * 0.3, pageHeight * 0.05),
                          ),
                        ),
                        child: Text(
                          "Register",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => LoginScreen(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory),
                        child: Text("Already with us? Login Here"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
