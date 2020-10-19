import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vspot/widgets/card.dart';
import 'package:vspot/widgets/commonAppbar.dart';

final _firestore = Firestore.instance;

class cardstreamer extends StatefulWidget {
  @override
  _cardstreamerState createState() => _cardstreamerState();
}

class _cardstreamerState extends State<cardstreamer> {
  @override
//  void initState()
//  {
//    super.initState();
//    filtered = cardkeeper;
//  }
  int x=0;
  bool issearch = false;
  Widget build(BuildContext context) {
     return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final details = snapshot.data.documents;
        List<card> cardkeeper = [];

        for(var detl in details)
        {
          final name = detl.data['Name'];
          final Ring = detl.data['RingStatus'];
          final wifi1 = detl.data['WifiBSSID'];
          final eml = detl.data['email'];
          final lstsn = detl.data['last_seen'];
          final lat1 = detl.data['latitude'];
          final long1 = detl.data['longitude'];
          final wifi2 = detl.data['wifiIP'];
          final wifi3 = detl.data['wifiName'];
          final img = detl.data['Image'];
          final wiget = card(
            nam: name,
            rng: Ring,
            wi1: wifi1,
            wi2: wifi2,
            wi3: wifi3,
            em: eml,
            l1: lat1,
            l2: long1,
            lst: lstsn.toString(),
            img: img,
          );
//            print(eml);
          cardkeeper.add(wiget);




        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cardkeeper,

        );
      },
    );
  }
}
