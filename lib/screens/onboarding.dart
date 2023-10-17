import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/register.dart';
import 'package:login_app/utils/dims/dims.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: pageWidth * 0.02, vertical: pageHeight * 0.05),
                child: Image.asset("assets/images/logo.png"),
              ),
              verticalSpacing(pageHeight * 0.02),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    "Bonjour!",
                    speed: const Duration(milliseconds: 80),
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(
                            fontFamily: 'Fertigo',
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: pageWidth * 0.15),
                  ),
                ],
                repeatForever: true,
              ),
              verticalSpacing(pageHeight * 0.02),
              Text(
                "Welcome to the App!\nPlease select any one of the option.",
                style: GoogleFonts.roboto(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: pageWidth * 0.04),
                textAlign: TextAlign.center,
              ),
              verticalSpacing(pageHeight * 0.15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primaryContainer),
                  minimumSize: MaterialStatePropertyAll(
                    Size(pageWidth * 0.5, pageHeight * 0.05),
                  ),
                ),
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
              verticalSpacing(pageHeight * 0.03),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>RegisterScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primaryContainer),
                  minimumSize: MaterialStatePropertyAll(
                    Size(pageWidth * 0.5, pageHeight * 0.05),
                  ),
                ),
                child: Text(
                  "Register",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            ],
          ),
        ));
  }
}