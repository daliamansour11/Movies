
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/views/Homepage/HomeScreen.dart';
import 'package:movies/views/Login/ResetPassword.dart';
import 'package:movies/views/SignUp/SignUp.dart';
import 'package:movies/views/WelcomePage/WelCome.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();



  static void signin(BuildContext context, String email, String password) {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password).then((_) {

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen(title: ''))
        );
    }
    );
  }
}
class _LoginState extends State<Login> {

  @override
  void initState() {
 // checkSignedIn(context);
  }

  TextEditingController userEmailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  bool ischecked = false;

  late String? email;

  late String? password;


  // const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  // border: Border.all( color: Colors.purpleAccent,width: 3.0,),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              // color: Colors.blue,

              child: const Text("LOGIN",
                style: TextStyle(fontSize: 30,
                    color: Colors.purple),
              )
            // padding: EdgeInsets.symmetric(horizontal: 40),
          ),


          SizedBox(height: size.height * 0.03,),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: userEmailController,
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    email = value.trim();
                  });
                },
                decoration: InputDecoration(
                  // labelText: "UserEmail", //babel text
                  hintText: "Enter Email",
                  //hint text

                  prefixIcon: Icon(Icons.email),
                  //prefix iocn

                  hintStyle: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w200),
                  //hint text style
                  labelStyle: TextStyle(
                      fontSize: 13, color: Colors.redAccent), //label style
                ),

              )


          ),
          SizedBox(height: size.height * 0.03,),

          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value.trim();
                  });
                },
                decoration: InputDecoration(
                  // labelText: "password", //babel text
                  hintText: "Enter your password",
                  //hint text
                  prefixIcon: Icon(Icons.password),
                  //prefix iocn
                  hintStyle: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w200),
                  //hint text style
                  labelStyle: TextStyle(
                      fontSize: 13, color: Colors.redAccent), //label style

                ),


              )


          ),
          SizedBox(height: size.height * 0.03,),

          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResetPassword()));
                },
                child: Text(
                  "Forget yourPassword",
                  //babel text
                )
            ),
          ),
          SizedBox(width: size.width * 0.07,),

          Container(

            width: 200,
            height: 70,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.grey[200],
                elevation: 5,
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onPressed: () async {

                if(userEmailController.text .isEmpty||userEmailController.text==null && passwordController.text .isEmpty||passwordController.text==null){
                  showAboutDialog(context: context);
                }else{
                  Login.signin(context,email = userEmailController.text,password= passwordController.text);

                }
                // Login.signin(context,
                //     email = userEmailController.text,
                //     password = passwordController.text);
              },

              child: Text(
                  "LogIn",
                  style: TextStyle(color: Colors.purple, fontSize: 18)
              ),
            ),
          ),


          SizedBox(height: size.height * 0.04,),

          Container(

              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(left: 70, right: 10, top: 0, bottom: 2),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text(""
                    "Don't Have an account? Sign Up",
                  style: TextStyle(fontSize: 12,

                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),),
              )

          )

        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String content) {
    content="email and password are required";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
  //

  //
}