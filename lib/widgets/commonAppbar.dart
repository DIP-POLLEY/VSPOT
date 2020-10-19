import 'package:flutter/material.dart';
import 'package:vspot/utilities/informationbrain.dart';
import 'package:vspot/widgets/card.dart';


class CommonAppBar extends StatefulWidget {
  @override
  _CommonAppBarState createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  bool issearch = false;
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title:Text('VSPOT'),
      centerTitle: true,
      actions: <Widget>[

      ],
    );
  }
}


