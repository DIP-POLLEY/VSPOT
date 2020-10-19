import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  Button({this.clr,this.ttl,this.onpres});
  final Color clr;
  final String ttl;
  final Function onpres;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: clr,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onpres,
        minWidth: 200.0,
        height: 42,
        child: Text(
          ttl,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}