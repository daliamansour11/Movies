import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/views/Homepage/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SignUp extends StatefulWidget{
  @override
  State<SignUp> createState() => _SignUpState();

  static void signup(BuildContext context,String email, String password ) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
        email: email, password: password)
        .then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(title: " Your Movies")));
    });

  }
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = new TextEditingController();

  TextEditingController userEmailController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  TextEditingController confirmpassController = new TextEditingController();

  TextEditingController userPhoneController = new TextEditingController();
   final content="email and password are required";

  late String _email, _password;

  // const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple[40],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  // border: Border.all( color: Colors.purpleAccent,width: 3.0,),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              // color: Colors.blue,

              child: const Text("Sign UP",
                style: TextStyle(fontSize: 30,
                    color: Colors.purple),
              )
            // padding: EdgeInsets.symmetric(horizontal: 40),
          ),
          SizedBox(height: size.height* 0.03,),
          Container(

              alignment: Alignment.center,
              margin:EdgeInsets.symmetric(horizontal: 40) ,
              child: TextField(
                controller: userNameController,
                  decoration: InputDecoration(
                    // labelText: "UserEmail", //babel text
                    hintText: " UserName ", //hint text
                    prefixIcon: Icon(Icons.person), //prefix iocn
                    hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w200), //hint text style
                    // labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent), //label style
                  )
              )
              ),


          SizedBox(height: size.height* 0.03,),
          Container(
              alignment: Alignment.center,
              margin:EdgeInsets.symmetric(horizontal: 40) ,
              child: TextField(
                controller: userEmailController,
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    // labelText: "UserEmail", //babel text
                    hintText: "Enter your email", //hint text
                    prefixIcon: Icon(Icons.email), //prefix iocn
                    hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w200), //hint text style
                    labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent), //label style
                  )

              )
          ),
            SizedBox(height: size.height* 0.03,),
      Container(
          alignment: Alignment.center,
          margin:EdgeInsets.symmetric(horizontal: 40) ,
          child: TextField(
            controller: userPhoneController,
              decoration: InputDecoration(
                // labelText: "UserEmail", //babel text
                hintText: " PhoneNumber", //hint text
                prefixIcon: Icon(Icons.phone), //prefix iocn
                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w200), //hint text style
                // labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent), //label style

              )

          )

      ),


          SizedBox(height: size.height* 0.03,),

          Container(
              alignment: Alignment.center,
              margin:EdgeInsets.symmetric(horizontal: 40) ,
              child: TextField(
                controller: passwordController,
                  obscureText: true,
                  onChanged: (value) {
                  setState(() {
                  _password = value.trim();
                  });
                  },
                  decoration: InputDecoration(
                    // labelText: "password", //babel text
                    hintText: "Enter your password", //hint text
                    prefixIcon: Icon(Icons.password), //prefix iocn
                    hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w200), //hint text style
                    labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent), //label style
                  )




          ),
          ),
          SizedBox(height: size.height* 0.03,),

          Container(
              alignment: Alignment.centerRight,
              margin:EdgeInsets.symmetric(horizontal: 40) ,
              child: TextField(
                controller: confirmpassController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Comfirm Password", //babel text
                    prefixIcon: Icon(Icons.password), //prefix iocn
                    hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w200), //hint text style//
                    // labelStyle: TextStyle(fontSize: 13, color: Colors.redAccent), //label style
                  )

              )


          ),
          SizedBox(height: size.height* 0.03,),

          Container(
            width: 200,
            height: 70,
            alignment: Alignment.center,
            margin:EdgeInsets.symmetric(horizontal: 40,vertical: 10) ,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[200],
                elevation: 5,
                padding: const EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: ()  async {
                final SharedPreferences sharedPrefs  = await SharedPreferences.getInstance();
                sharedPrefs.setString("email",userEmailController.text );
                sharedPrefs.setString("password", passwordController.text);
                sharedPrefs.setString("username", userNameController.text);
                sharedPrefs.setString("phone", userPhoneController.text);
                sharedPrefs.setString("comfirmedpassword",passwordController.text);
                if(userEmailController.text .isEmpty||userEmailController.text==null && passwordController.text .isEmpty||passwordController.text==null){
                  showSnackBar(context,content);
                }else{
                  signup(context,_email = userEmailController.text,_password= passwordController.text);

                }

                },
              child: Text(
                "Sign UP",
                style: TextStyle( fontSize: 18,color: Colors.purple ,),
              ),
            ),
          ),

          ],
      ),
      );
    //   backgroundColor: Colors.lightBlue[50],
    // );

  }

  void checkSignUn(  BuildContext context ){
    final _userEmail = userEmailController.text;
    final _paasword = passwordController.text;
    final _confirmpaasword = confirmpassController.text;

    if( _confirmpaasword== _paasword ){

      print("useremail and password match");

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(title: " Your Movies")));

    }

    else{
      final _errorMessage = "password doesnot match";
       print(_errorMessage);
    }

  }
  static void signup(BuildContext context,String email, String password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(title: '')));
    });
  }

  void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  //    Future singUpToFireBase(context, name, email, password, phone) async {
  //
  //    await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: userEmailController.text, password: password.toString())
  //       .then((value) {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(title: " Your Movies")));
  //
  //     SharedPreferences sharedPreferences = SharedPreferences.getInstance() as SharedPreferences;
  //     sharedPreferences.setString( 'uId',  value.user!.uid);
  //         print(value.user!.uid);
  //
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  //  }
}


