import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screens/main_screen.dart';
import 'package:login_app/screens/register.dart';
import 'package:login_app/services/auth_service.dart';
import 'package:login_app/utils/dims/dims.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final GlobalKey<FormState> _authForm = GlobalKey<FormState>();
  bool _isKeyboard = false;
  bool _isVisible = false;


  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;
    UserCredential userCred;

    void submit(
      String email,
      String pass,
    ) async {
      try {
        userCred = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
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
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.expand,
            children: [
              !_isKeyboard
                  ? Positioned(
                      left: -pageWidth * 0.172,
                      child: Container(
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
                              "assets/images/logo2.png",
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                top: !_isKeyboard ? pageHeight * 0.32 : 0,
                child: SizedBox(
                  width: pageWidth,
                  height: pageHeight * 0.65,
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                              fontFamily: 'Fertigo',
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      verticalSpacing(pageHeight * 0.02),
                      Text(
                        "Please login to your account!",
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: pageWidth * 0.035,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpacing(pageHeight * 0.03),
                      Form(
                          key: _authForm,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: pageWidth * 0.1,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    label: Text("E-mail",
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
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.')) {
                                      return 'Please enter a valid email!';
                                    }
                                    return null;
                                  },
                                  controller: email,
                                  textInputAction: TextInputAction.next,
                                  onTap: () {
                                    setState(() {
                                      _isKeyboard = true;
                                    });
                                    // print(MediaQuery.of(context).viewInsets.bottom);
                                  },
                                ),
                              ),
                              Padding(
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
                                  obscureText: !_isVisible,
                                  controller: pass,
                                  onTap: () {
                                    setState(() {
                                      _isKeyboard = true;
                                    });
                                  },
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      _isKeyboard = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )),
                      verticalSpacing(pageHeight * 0.034),
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
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                        ),
                      ),
                      verticalSpacing(pageHeight * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: pageWidth * 0.007,
                              indent: pageWidth * 0.097,
                              endIndent: pageWidth * 0.05,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          Text(
                            "OR",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Expanded(
                            child: Divider(
                              thickness: pageWidth * 0.007,
                              indent: pageWidth * 0.05,
                              endIndent: pageWidth * 0.097,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ],
                      ),
                      verticalSpacing(pageHeight * 0.025),
                      SizedBox(
                        width: pageWidth * 0.35,
                        child: loginButton(
                            pageHeight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: pageWidth * 0.04),
                                  child: Text(
                                    "Google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondaryContainer,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ), () async {
                          try {
                            await AuthService().signInWithGoogle();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const MainScreen()));
                          } on PlatformException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.message!,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onErrorContainer),
                                ),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .errorContainer,
                              ),
                            );
                          }
                        }, context),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => const RegisterScreen(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory),
                        child: const Text("Not a member yet? Register Now"),
                      ),
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

Widget loginButton(
  double pageHeight,
  Widget buttonIcon,
  void Function() onPressed,
  BuildContext context,
) {
  return IconButton.filled(
    iconSize: pageHeight * 0.04,
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.secondaryContainer,
      ),
    ),
    onPressed: onPressed,
    icon: buttonIcon,
  );
}
