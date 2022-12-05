import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/views/Login/Login.dart';



class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        body:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("WELCOME To MoviesApp",

                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple ,fontSize: 20),
                ),

                  Image.asset("images/movie_svg.webp",
                      height: size.height * 0.2),
                  Container(
                    width: size.width * 0.8,
                    padding: EdgeInsets.only(
                        left: 60, top: 2, right: 10, bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),

                      // borderRedius:BorderRadius.circular(29),
                      child: ElevatedButton(

                        child: Text(
                          "LOGIN", style: TextStyle(color: Colors.white),),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          backgroundColor: Colors.purple
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)  => Login()));
                        },

                      ),

                    ),



                ])
    );
  }
//   }
//           // child:Column(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: <Widget>[
//           //     Container(
//           //       alignment:Alignment .centerLeft,
//           //       padding: EdgeInsets.symmetric(horizontal: 40)
//           //       ,
//           //
//           //
//           //   ],
//           // )

}
