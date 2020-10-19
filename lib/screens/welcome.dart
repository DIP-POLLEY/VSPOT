import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vspot/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vspot/utilities/users.dart';
import 'package:vspot/widgets/button.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';


//final _firestore = Firestore.instance;

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  void checklogin() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email');
    name = preferences.getString('name');
    imageURL = preferences.getString('image');
    if(email!=null)
    {
      Navigator.pushReplacementNamed(context, Home_screen.id);
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('VSPOT',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              ttl: 'google',
              clr: Colors.redAccent,
              onpres: (){
              signInWithGoogle().then((onValue){
                Navigator.pushReplacementNamed(context, Home_screen.id);
              }).catchError((e){
                print(e);
              });


              },
            ),
//            SizedBox(
//              height: 20,
//            ),
//            Button(
//              ttl: 'Login',
//              clr: Colors.blue,
//            ),
          ],
        ),
      ),
    );
  }
}



//    .then((onValue) {
//
//_firestore.collection('users').document('auth').collection(
//'googleusers').
//add({
//'email': email, 'image': imageURL, 'name': name,});
//
//}
//).catchError((e){
//print("ERROR HERE!!!!$e");
//})