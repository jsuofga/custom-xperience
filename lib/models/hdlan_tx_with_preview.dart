import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;

class HdlanTxWithPreview extends StatefulWidget {
  //Constructor
  String txLabel ;
  String chId;
  Widget child;

  HdlanTxWithPreview ({
    required String this.txLabel,
    required String this.chId,
    required this.child
  });
  @override
  State<HdlanTxWithPreview > createState() => _HdlanTxWithPreview ();
}

class _HdlanTxWithPreview  extends State<HdlanTxWithPreview > {

  @override
  Image captureImg = Image.asset('');

  updateImg() {
    setState(() {
      imageCache.clear();
      imageCache.clearLiveImages();
      captureImg = Image.network('http://172.31.3.16/images/capture.jpg?t=${DateTime.now().millisecond}');

    });
  }
  initState() {
    // to Aspeed to get jpg format
    http.get(Uri.parse("http://172.31.3.16/cgi-bin/query.cgi?cmd=cd /www/images%3Becho jpg 60 1 > /dev/videoip%3Bsleep 1%3Bcat /dev/videoip > capture.jpg"));
    updateImg();  //Get initial capture.jpg asap
    //Get capture jpg every 3 seconds thereafter
    Timer.periodic(const Duration(seconds: 3), (timer) {
      http.get(Uri.parse("http://172.31.3.16/cgi-bin/query.cgi?cmd=cd /www/images%3Becho jpg 60 1 > /dev/videoip%3Bsleep 1%3Bcat /dev/videoip > capture.jpg"));
      updateImg();
    });

  }


  Widget build(BuildContext context) {

    return Stack(
        alignment: Alignment.center,
        children:[
        // capture.jpg from TX
          Container(
            height: 148,
            width: 148,
            child: ClipRRect(borderRadius:BorderRadius.circular(16), child: captureImg,)
          ),

          Container(
            height: 180,
            width:180,
            child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton.icon(
              icon: widget.child,
              label: Text(
                widget.txLabel,
                style: TextStyle(
                    color: Colors.white
                ),

                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color:Colors.white)
                   ),
                  ),

                ),
                onPressed: () {
                  Provider.of<SwitchHdlanRx>(context,listen: false).switchRx(widget.chId);

                }
              ),
          ),
          ),
        ]
    );
  }
}