import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState(){
    super.initState();
    isLogin();
  }

  void isLogin()async{
    
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false ;

    Timer(const Duration(seconds: 2), () {
      if(isLoggedIn){
        Navigator.pushNamed(
              context,
              '/roothome',
            );
      }else{
        Navigator.pushNamed(
              context,
              '/login',
            );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: Text("Welcome", textAlign: TextAlign.center,style: TextStyle(color: Colors.purple, fontSize: 30),),),
    );
  }
}