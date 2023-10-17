import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app/screens/onboarding.dart';
import 'package:login_app/utils/dims/dims.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String provider = "";
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser!;
    for (final i in user.providerData) {
      provider = i.providerId;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Hello You have successfully Logged in!!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,),
        verticalSpacing(50),
        ElevatedButton(onPressed: (){
          if (provider == "google.com") {
            GoogleSignIn().signOut();
            FirebaseAuth.instance.signOut().then((value) {
            });
          } else {
            FirebaseAuth.instance.signOut().then((value) {
            });
          }
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const OnboardingScreen()));
        }, child: Text("Logout")),
      ],
    );
  }
}
