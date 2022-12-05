import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ResetPassword extends StatefulWidget{

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController userEmailController = new TextEditingController();
  late String email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
        Container(
        alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
            decoration: BoxDecoration(
                color: Colors.grey[200],
// border: Border.all( color: Colors.purpleAccent,width: 3.0,),
                borderRadius: BorderRadius.circular(30.0)
            ),
// color: Colors.blue,

            child: const Text("Reset Password",
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

                hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                //hint text style
                labelStyle: TextStyle(
                    fontSize: 13, color: Colors.redAccent), //label style
              ),


            )


        ),
        SizedBox(height: size.height * 0.03,),


              Container(

                width: 200,
                height: 70,
                alignment: Alignment.center,
                margin:EdgeInsets.only(left: 10,right: 30,top: 10,bottom: 0) ,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.grey[200],
                    elevation: 5,
                    padding:  EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () async {

                    resetPassword(context, email);
                      Fluttertoast.showToast(
                        msg: "A reset email has been sent to you",  // message
                        toastLength: Toast.LENGTH_LONG, // length
                        gravity: ToastGravity.CENTER, // location

                        timeInSecForIosWeb: 2,
                      );
                      Navigator.of(context).pop();
                    },





                  child: Text(
                      "Done",
                      style: TextStyle(color: Colors.purple,fontSize: 18)
                  ),
                ),
              ),


              SizedBox(height: size.height* 0.04,),
        ],
    ),

    );
  }

  void resetPassword(BuildContext context, String email) {}


}