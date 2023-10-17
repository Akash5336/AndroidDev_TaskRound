import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screens/onboarding.dart';
import 'package:login_app/screens/register.dart';
import 'package:login_app/utils/dims/dims.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isKeyboard = false;
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _isKeyboard = false;
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
                  : SizedBox(),
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
                              color: Theme.of(context).colorScheme.onBackground,
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
                          textInputAction: TextInputAction.next,
                          onTap: () {
                            setState(() {
                              _isKeyboard = true;
                            });
                            print(MediaQuery.of(context).viewInsets.bottom);
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
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            suffixIconColor:
                                Theme.of(context).colorScheme.onBackground,
                            suffixIcon: !_isVisible
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(Icons.visibility))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isVisible = !_isVisible;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off)),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: pageWidth * 0.1,
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: (){},
                            style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
                            child: Text("Forgot Password?"),
                          ),
                        ),
                      ),
                      verticalSpacing(pageHeight * 0.015),
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
                      verticalSpacing(pageHeight * 0.02),
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
                      verticalSpacing(pageHeight * 0.02),
                      SizedBox(
                        width: pageWidth * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            loginButton(
                                pageHeight,
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                                () {},
                                context),
                            loginButton(
                                pageHeight,
                                FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                                () {},
                                context),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => RegisterScreen(),
                            ),
                          );
                        },
                        style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
                        child: Text("Not a member yet? Register Now"),
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
