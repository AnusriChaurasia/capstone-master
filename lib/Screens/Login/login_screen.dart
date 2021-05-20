import 'package:capstone/Screens/Signup/signup_screen.dart';
import 'package:capstone/Shared/constants.dart';
import 'package:capstone/Shared/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: kPrimaryLightColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.30,
            ),
            SizedBox(height: 88,),
            textItem("Email....", _emailController, false),
            SizedBox(height: 15,),
            textItem("Password...", _pwdController, true),
            SizedBox(height: 40,),
            colorButton(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("If you don't have an Account? ",style: TextStyle(color: kPrimaryColorPurple,fontSize: 16,),),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (builder) => SignUpPage()),(route) => false);},
                    child: Text("SignUp",
                      style: TextStyle(color: kPrimaryColorPurple,fontSize: 16,fontWeight: FontWeight.w600,decoration: TextDecoration.underline,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
            ],),),),);
  }

  Widget colorButton() { 
    return InkWell(
      onTap: () async {
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.signInWithEmailAndPassword(
                  email: _emailController.text, password: _pwdController.text);
          print(userCredential.user.email);
          setState(() {circular = false;});
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (builder) => Nav()),(route) => false);
        } 
        catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {circular = false;});
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: kPrimaryColorPink,),
        child: Center(child: circular? CircularProgressIndicator(): Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20,),),),
      ),
    );
  }

  Widget buttonItem(String imagepath, String buttonName, double size) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Card(
        color: Colors.black,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagepath,
              height: size,
              width: size,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textItem(
    String labeltext, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: kPrimaryColorPurple,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(
            fontSize: 17,
            color: kPrimaryColorPurple,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.5,
              color: kPrimaryColorPurple,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: kPrimaryColorPink,
            ),
          ),
        ),
      ),
    );
  }
}