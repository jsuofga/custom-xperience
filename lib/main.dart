import 'dart:async';
import 'dart:html' as html;
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/views/hdlan_room.dart';
import 'package:xperience_flutter/views/hdlan_input_selects.dart';
import 'package:xperience_flutter/views/zone_select.dart';
import 'package:xperience_flutter/views/prodsx_room.dart';
import 'package:xperience_flutter/views/prodsx_input_selects.dart';
import 'package:xperience_flutter/views/admin_access.dart';
import 'package:xperience_flutter/views/ip_address_enter.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:xperience_flutter/views/upload_file.dart';


void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (context) => PageSelect()),
          ChangeNotifierProvider( create: (context) => SwitchProDsxRX()),
          ChangeNotifierProvider( create: (context) => SwitchHdlanRx()),
          ChangeNotifierProvider( create: (context) => HdlanRxStatus()),
          ChangeNotifierProvider( create: (context) => ActionSelected()),
          ChangeNotifierProvider( create: (context) => RxStatus()),

      ],
          child:  MaterialApp(
            title:'Xperience V1.0',
            debugShowCheckedModeBanner: false,
            home:  HomePage()
          ),
    ));


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Defined variables

  final List _pageList = [Zoneselect(),ProDsxRoom(),ProDsxInputSelects(),HdlanRoom(),HdlanInputSelects(),AdminAccess(),IpAddressForm(),Uploadfile()];


  @override

  initState() {
    //
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Provider.of<RxStatus>(context,listen: false).getFeedback();
      Provider.of<HdlanRxStatus>(context,listen: false).getSnmpStatus();
    });
    print("initState Called");
  }

  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 100,),
            Text('Design By',style: TextStyle(
              color: Colors.black ,
              fontSize: 10
            ),),
            Image.asset('assets/andmt_logo.png', width: 80, height: 80,),
         ],

        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 5,20),
            child: Text('V1.0', style: TextStyle(color: Colors.black),),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Provider.of<PageSelect>(context,listen: false).selectPage(5); // Show Admin Access Page
                  Provider.of<ActionSelected>(context,listen: false).chooseUploadOrIPform('upload_form');
                },
                child: Icon(
                    Icons.upload_outlined,
                    color: Colors.black,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Provider.of<ActionSelected>(context,listen: false).chooseUploadOrIPform('ip_form');
                  Provider.of<PageSelect>(context,listen: false).selectPage(5); // Show Admin Access Page

                },
                child: Icon(
                  Icons.settings_ethernet,
                  color: Colors.black,
                ),
              )
          ),
        ],
      ),
      backgroundColor: Colors.grey[800],
      body:   _pageList[Provider.of<PageSelect>(context,listen: true).page],
      bottomNavigationBar: Container(
          height: 60,
          color:Colors.black26 ,
          child:Center(
              child: IconButton(icon: Icon(Icons.workspaces_filled, size:36,color: Colors.white,),
              onPressed: () {
                Provider.of<PageSelect>(context,listen: false).selectPage(0);
                },
              ))
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


