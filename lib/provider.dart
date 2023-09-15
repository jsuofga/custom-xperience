import 'dart:convert';
import 'dart:html';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ActionSelected extends ChangeNotifier{
  String showUploadOrIPform = "";

  chooseUploadOrIPform(_param){
    showUploadOrIPform = _param;
    print(showUploadOrIPform);
  }

}

class PageSelect extends ChangeNotifier{
  int page = 0;  //Home page

  selectPage(_page){
    page = _page;
    print('page:${page}');
    notifyListeners();
  }
}
class SwitchProDsxRX extends ChangeNotifier {
  String chID = '001'; //
  String rxID = '1';
  int vwType = 1;
  int startRX = 0;
  int endRX = 0;
  List chSelects = [];


  selectRx(_rxID) async {
    print('selectRx:${_rxID}');

    // Save selected rxID
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rxID', _rxID);
    await prefs.setInt('vwType', 1);
  }

  switchRx(_chID) async {

    chID = _chID;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rxID = await prefs.getString('rxID') ?? '';
    vwType = await prefs.getInt('vwType')?? 0 ;
    startRX = await prefs.getInt('startRX')?? 0 ;
    endRX = await prefs.getInt('endRX')?? 0;

    if( vwType == 1){
      http.get(Uri.parse('http://172.31.3.${rxID}/cgi-bin/query.cgi?cmd=vw:off'));
      http.get(Uri.parse('http://172.31.3.${rxID}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));
    }else if( vwType == 2){
       for(int i = 0; i<=1;i++){
         http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${i}%3Be%20e_vw_moninfo_200_200_100_100'));
         http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));
       }

    }else if( vwType == 3){
      for(int i = 0; i<= 2;i++) {
        http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${i}%3Be%20e_vw_moninfo_200_200_100_100'));
        http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));
      }
    }else if( vwType == 14){ // merge TV 1-14
      for(int i = 0; i<= 13;i++) {
        http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=e%20e_vw_enable_0_${vwType-1}_0_${i}%3Be%20e_vw_moninfo_200_200_100_100'));
        http.get(Uri.parse('http://172.31.3.${startRX+i}/cgi-bin/query.cgi?cmd=rxswitch:${chID}'));
      }
    }

  }

  mergeRx(int _vwType, int _startRX, int _endRX,) async {
     int vwType = _vwType;
     int startRX = _startRX;
     int endRX = _endRX;

     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setInt('vwType', vwType);
     await prefs.setInt('startRX', startRX);
     await prefs.setInt('endRX', endRX);

     print(vwType);

  }

  unmergeAll(){
    for(int i = 0; i<= 13;i++) {
      http.get(Uri.parse('http://172.31.3.${i+1}/cgi-bin/query.cgi?cmd=vw:off'));
    }
  }

  blackout_resume_video(String _param){
    String param = _param;  //'2' = black out, '0' = resume video
    for(int i = 0; i<= 13;i++) {
      print('http://172.31.3.${i+1}/cgi-bin/query.cgi?cmd=echo%20${param}%20>%20/sys/devices/platform/videoip/pause');
      http.get(Uri.parse('http://172.31.3.${i+1}/cgi-bin/query.cgi?cmd=echo%20${param}%20>%20/sys/devices/platform/videoip/pause'));
    }

  }


}

class SwitchHdlanRx extends ChangeNotifier{
  String chID = '1'; //
  String rxID = '1';
  List chSelects = [];

  selectRx(_hdlan_rxID) async {
    print('selectRx:${_hdlan_rxID}');

    // Save selected rxID
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('hdlan_rxID', _hdlan_rxID);
  }
  switchRx(_chID) async {

    chID = _chID;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rxID = await prefs.getString('hdlan_rxID') ?? '';

    print("http://${html.window.location.hostname.toString()}:1880/switchRX/${rxID}/vlan/${int.parse(chID)+1}");
    http.get(Uri.parse("http://${html.window.location.hostname.toString()}:1880/switchRX/${rxID}/vlan/${int.parse(chID)+1}"));

  }

}

// HDLAN RX Status
class HdlanRxStatus extends ChangeNotifier {
  List  RxSnmpStatus = List.filled(48, '1');
  List RxChSelect = List.filled(48, '2');
  List sourceList = ['Cable1','Cable2','AppleTV','In16Main'];

  String switchIPAddress = '';

  getSnmpStatus() async {
    String _jsonData = '';
    // print("http://${html.window.location.hostname.toString()}:1880/ciscoStat");
    http.get(Uri.parse("http://${html.window.location.hostname.toString()}:1880/ciscoStat")).
    then((response) =>
    {
      _jsonData = response.body, // get data as JSON string
      print(_jsonData),
      // print(jsonDecode(_jsonData)["PortVlanMembership"]), // convert JSON to Map
      switchIPAddress = jsonDecode(_jsonData)["SwitchIPAddress"],
      RxSnmpStatus = jsonDecode(_jsonData)["PortVlanMembership"] ,
      // print(RxSnmpStatus),
      print(switchIPAddress),

      RxSnmpStatus.asMap().forEach((index, item) => {
          RxChSelect[index] = sourceList[RxSnmpStatus[index]-2]
      }),

    });
      notifyListeners();
  }

}

// Prodsx Status
class RxStatus extends ChangeNotifier  {
  List rxIDs = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
  List sourceList = ['Cable1','Cable2','Cable3','AppleTV','PlayStation','DJ Booth','IT Monitor1','IT Monitor2'];
  List chSelects = List.filled(16, 'Detecting');

  getFeedback() async {
    rxIDs.asMap().forEach((index,item) async{
      try{
        var response = await http.get(Uri.parse('http://172.31.3.${item}/cgi-bin/query.cgi?cmd=astparam g ch_select'));
        chSelects[index] = sourceList[int.parse(response.body.substring(3)) -1];
        notifyListeners();

      }catch(error){
        chSelects[index] = 'Error'; //
        notifyListeners();
      }

    });

  }

}


