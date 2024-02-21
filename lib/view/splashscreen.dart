import 'package:flutter/material.dart';
import 'package:news_snack/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          SizedBox(height: 300,),
          Image.network("https://i.pinimg.com/originals/d6/3f/91/d63f91e1f9001c75ba9d7d75d5ac3164.gif"),
          Spacer(),
          Text("Developed By\nNeel Patel" ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
        ],
      )),
    );
  }
}