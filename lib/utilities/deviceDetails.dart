import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vspot/utilities/users.dart';
//import 'package:vspot/utilities/users.dart';
//import 'package:vspot/screens/homepage.dart';
final _firestore = Firestore.instance;

Future<bool> EmailAlready(String mail) async
{
  final QuerySnapshot result = await _firestore.collection('users').where('email',isEqualTo: mail).getDocuments();
  final List<DocumentSnapshot> documents = result.documents;

  return documents.length>0;
}

void addDetails(String name,String email,String lat,String long,String w1,String w2,String w3,String r) async
{
//  print("xyz");
  if(await EmailAlready(email) == false)
    {
      _firestore.collection('users').document('$email').setData({
        'Name': name,
        'email': email,
        'latitude':lat,
        'longitude':long,
        'WifiBSSID':w1,
        'wifiIP':w2,
        'wifiName':w3,
        'RingStatus':r,
        'Image':imageURL,
        'last_seen':FieldValue.serverTimestamp(),
      });
    }
  else
    {
      updateData(name, email, lat, long, w1, w2, w3, r);
    }
}

void updateData(String name,String email,String lat,String long,String w1,String w2,String w3,String r)async
{
//  final QuerySnapshot result = await _firestore.collection('users').where('email',isEqualTo: email).getDocuments();
//  final List<DocumentSnapshot> documents = result.documents;
  Map<String,dynamic>data = {};
  var firebaseUser = await FirebaseAuth.instance.currentUser();
//  DocumentSnapshot _currentDocument  = firebaseUser.uid;
  data.addAll({
    'Name': name,
    'email': email,
    'latitude':lat,
    'longitude':long,
    'WifiBSSID':w1,
    'wifiIP':w2,
    'wifiName':w3,
    'RingStatus':r,
    'Image':imageURL,
    'last_seen':FieldValue.serverTimestamp(),
  });

//  _currentDocument.documentID
  _firestore.collection('users').document('$email').updateData(data);
}