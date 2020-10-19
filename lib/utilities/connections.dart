import 'package:connectivity/connectivity.dart';
class Connections
{
  var w1,w2,w3;
  void getConnectDetails()async
  {
    try{
      w1 = await (Connectivity().getWifiBSSID());
      w2 = await (Connectivity().getWifiIP());
      w3 = await (Connectivity().getWifiName());
    }
    catch(e)
    {
      print(e);
    }
  }
}