import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:vspot/screens/drawer.dart';
import 'package:vspot/utilities/connections.dart';
import 'package:vspot/utilities/deviceDetails.dart';
import 'package:vspot/utilities/informationbrain.dart';
import 'package:vspot/utilities/location.dart';
import 'package:vspot/utilities/users.dart';
import 'package:vspot/widgets/commonAppbar.dart';
import 'package:workmanager/workmanager.dart';
import 'package:vspot/widgets/card.dart';

String lat,long;
String w1,w2,w3,ring;
bool go=false;
const ftch = "fetchBackground";
void callbackDispatcher(){
  Workmanager.executeTask((taskName, inputData) async {
    switch(taskName)
    {
      case ftch:
        Location obj = new Location();
        await obj.locate();
        Connections cnt = new Connections();
        await cnt.getConnectDetails();
//        print("ff");
//        addDetails(name, email, obj.lat.toString(), obj.long.toString(), cnt.w1.toString(),  cnt.w2.toString(),  cnt.w3.toString(), "ring");
        addDetails("8","8","8","8","8","8","8","8");
//        print("here");
//        print(obj.lat);
        break;
    }

    return Future.value(true);
  });
}

class Home_screen extends StatefulWidget {
  static const String id = 'home';
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {

  int d1,d2;
  var wifiBSSID,wifiIP,wifiName;
  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    Workmanager.initialize(callbackDispatcher, isInDebugMode: true);
    Workmanager.registerPeriodicTask("1", "fetchBackground",frequency: Duration(minutes: 15));
    d1=d2=0;
    lat = long = "Getting locatoion";
    w1=w2=w3=ring="getting details";
    getdata();
    conect();
  }
  void  getdata() async
  {
    String k = await SoundMode.ringerModeStatus;
    var geolocator = Geolocator();
    var locopts = LocationOptions(accuracy: LocationAccuracy.high,distanceFilter: 10);
    geolocator.getPositionStream(locopts).listen((Position position)async {
      if(position!=null)
      {
        //        Navigator.pushReplacementNamed(context, Home_screen.id);
        wifiBSSID = await (Connectivity().getWifiBSSID());
        wifiIP = await (Connectivity().getWifiIP());
        wifiName = await (Connectivity().getWifiName());
        if(w1!="getting details"&&w1!=wifiBSSID)
          {
            setState(() {
              w1 = wifiBSSID;
              w2 = wifiIP;
              w3 = wifiName;
              updte();
            });

          }
        setState(() {
          lat = position.latitude.toString();
          long = position.longitude.toString();
          ring = k;
          d1=1;
          updte();
        });
      }
      else
      {
        ring = k;
        lat = "Getting location check you gps";
        long = "Getting location check your gps";

        updte();
      }


    });

  }

  void conect()async
  {
    String k = await SoundMode.ringerModeStatus;
    wifiBSSID = await (Connectivity().getWifiBSSID());
    wifiIP = await (Connectivity().getWifiIP());
    wifiName = await (Connectivity().getWifiName());
    Connectivity().onConnectivityChanged.listen((ConnectivityResult conres) {

      if(conres == ConnectivityResult.mobile)
      {
        setState(() {
          w1 = w2 = w3 = "Mobile network";
          ring = k;
          d2=1;
          updte();

        });
      }
      else
      {
        ring =k;
        d2=1;
        w1 = wifiBSSID.toString();
        w3 = wifiName.toString();
        w2 = wifiIP.toString();
        updte();
      }

    });
  }

  void updte()
  {
//    print(lat);
//    print(w1);
    if(d1>0&&d2>0)
    addDetails(name, email, lat, long, w1, w2, w3, ring);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CommonAppBar(),
      ),
      drawer: MainDrawer(),
      body: ListView(

        children: <Widget>[
          cardstreamer(),


        ],
      ),
    );
  }
}



//onpres: (){
//signOutGoogle();
//Navigator.pop(context);
//
//},