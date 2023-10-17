import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screens/login.dart';

import '../utils/dims/dims.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -pageHeight * 0.02,
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
                      "assets/images/register_logo.png",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: pageHeight * 0.3,
              child: SizedBox(
                width: pageWidth,
                height: pageHeight * 0.7,
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
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(pageWidth * 0.022),
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          // setState(() {
                          //   _isKeyboard = true;
                          // });
                          // print(MediaQuery.of(context).viewInsets.bottom);
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
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(pageWidth * 0.022),
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onTap: () {
                          // setState(() {
                          //   _isKeyboard = true;
                          // });
                          // print(MediaQuery.of(context).viewInsets.bottom);
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
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          suffixIconColor:
                              Theme.of(context).colorScheme.onBackground,
                          suffixIcon: true //!_isVisible
                              ? IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _isVisible = !_isVisible;
                                    // });
                                  },
                                  icon: Icon(Icons.visibility))
                              : IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _isVisible = !_isVisible;
                                    // });
                                  },
                                  icon: Icon(Icons.visibility_off)),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(pageWidth * 0.022),
                            ),
                          ),
                        ),
                        obscureText: true,
                        onTap: () {
                          // setState(() {
                          //   _isKeyboard = true;
                          // });
                        },
                        onFieldSubmitted: (val) {
                          // setState(() {
                          //   _isKeyboard = false;
                          // });
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
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                          suffixIconColor:
                              Theme.of(context).colorScheme.onBackground,
                          suffixIcon: true //!_isVisible
                              ? IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _isVisible = !_isVisible;
                                    // });
                                  },
                                  icon: Icon(Icons.visibility))
                              : IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   _isVisible = !_isVisible;
                                    // });
                                  },
                                  icon: Icon(Icons.visibility_off)),
                          filled: true,
                          fillColor:
                              Theme.of(context).colorScheme.secondaryContainer,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(pageWidth * 0.022),
                            ),
                          ),
                        ),
                        obscureText: true,
                        onTap: () {
                          // setState(() {
                          //   _isKeyboard = true;
                          // });
                        },
                        onFieldSubmitted: (val) {
                          // setState(() {
                          //   _isKeyboard = false;
                          // });
                        },
                      ),
                    ),
                    verticalSpacing(pageHeight * 0.04),
                    ElevatedButton(
                      onPressed: () {},
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
    );
  }
}
