import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;

class HdlanRx extends StatefulWidget {
  //Constructor
  String rxLabel ;
  String rxId ;

  HdlanRx({
    required String this.rxLabel,
    required String this.rxId,

  });


  @override
  State<HdlanRx> createState() => _HdlanRx();
}

class _HdlanRx extends State<HdlanRx> {
  @override
  Widget build(BuildContext context) {


    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Text(Provider.of<HdlanRxStatus>(context,listen: true).RxChSelect[int.parse(widget.rxId)+9]! ,style: TextStyle(color:Colors.white,fontSize: 12),),

            SizedBox(
              width: 100,
              height: 50,
              child: TextButton.icon(
                  icon: Icon(
                    Icons.tv,
                    color: Colors.lightBlue,
                  ),
                  label: Text(
                    widget.rxLabel,
                    style: TextStyle(
                        color: Colors.lightBlue
                    ),

                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color:Colors.lightBlue)
                      ),
                    ),

                  ),
                  onPressed: () {
                     Provider.of<PageSelect>(context,listen: false).selectPage(4);
                     Provider.of<SwitchHdlanRx>(context,listen: false).selectRx(widget.rxId);
                    // print('172.31.3.1/cgi-bin/query.cgi?cmd=rxswitch:00${widget.chId}');
                    // http.get(Uri.parse('http://172.31.3.1/cgi-bin/query.cgi?cmd=rxswitch:00${widget.chId}'));


                  }
              ),
            ),
          ]
      ),
    );
  }
}