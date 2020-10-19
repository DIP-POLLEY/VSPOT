import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vspot/utilities/users.dart';

class card extends StatefulWidget {

  card({this.nam,this.rng,this.wi1,this.wi2,this.wi3,this.em,this.l1,this.l2,this.lst,this.img});
  final String nam,rng,wi1,wi2,wi3,em,l1,l2,lst,img;
  @override
  _cardState createState() => _cardState();
}

class _cardState extends State<card> {

  String _nam,_img,_wi1,_wi2,_wi3,_em,_l1,_l2;

  @override

  void initState(){
    super.initState();
    _nam = widget.nam;
    _img = widget.img;
    _wi1 = widget.wi1;
    _wi2 = widget.wi2;
    _wi3 = widget.wi3;
    _em = widget.em;
    _l1 = widget.l1;
    _l2 = widget.l2;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.3),
      child: GestureDetector(
        onTap: (){
          Alert(
            closeFunction: () {},
            context: context,
            type: AlertType.info,
            title: _nam,
            content: Column(
                children: <Widget>[
                  Image.network(_img),
                  Text(_em,style: TextStyle(
                    fontSize: 14,
                  ),),
                  Text('latitude:$_l1',style: TextStyle(fontSize: 14, ),),
                  Text('longitude:$_l2',style: TextStyle(fontSize: 14, ),),
                  Text(_wi1,style: TextStyle(fontSize: 14, ),),
                  Text(_wi2,style: TextStyle(fontSize: 14, ),),
                  Text(_wi3,style: TextStyle(fontSize: 14, ),),
                ],
            ),
            buttons: [
              DialogButton(
                child: Text(
                  "DONE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Colors.redAccent,
                radius: BorderRadius.circular(10.0),
              ),
            ],
          ).show();
        },
        child: Container(
          color: Colors.white,
          height: 75,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal:30),
                  child: Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(_img),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(_nam,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

