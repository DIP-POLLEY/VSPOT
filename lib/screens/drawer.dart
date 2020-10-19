import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vspot/screens/welcome.dart';
import 'package:vspot/utilities/users.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.red,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(imageURL),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(name,style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),),
                  Text(email,style: TextStyle(
                    color: Colors.white,
                  ),)
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Logout',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.of(context).pop();
              signOutGoogle();
              Navigator.pushReplacementNamed((context),WelcomeScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
