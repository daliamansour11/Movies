import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/views/Login/Login.dart';

import '../Homepage/HomeScreen.dart';




class WelcomeScreen extends StatefulWidget{


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
//
    return Scaffold(
        body:  Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("WELCOME To MoviesApp",

                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ,fontSize: 20),
                ),
SizedBox(height: 100,),
                  CircleAvatar(

                    backgroundImage: AssetImage('images/movies4.jpg'),
                    radius: 120,
                  ),
                  Container(
                    width: size.width ,
                    padding: EdgeInsets.only(
                        left: 60, top: 2, right: 10, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),



                  ),



                ])
    ));
  }
//   }


  @override
  void initState() {
    checkSignedIn(context);
  }
}

  void checkSignedIn(BuildContext context) {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if (user != null) {
      Timer(const Duration(seconds: 3),
          () =>  Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()))

      );
      }else{
        Timer(const Duration(seconds: 3),
        () =>  Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Login())));

      }
    }

    //extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery
//         .of(context)
//         .size;
//
//
//
// //           // child:Column(
// //           //   mainAxisAlignment: MainAxisAlignment.center,
// //           //   children: <Widget>[
// //           //     Container(
// //           //       alignment:Alignment .centerLeft,
// //           //       padding: EdgeInsets.symmetric(horizontal: 40)
// //           //       ,
// //           //
// //           //
// //           //   ],
// //           // )
//

