import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;

class ProDsxTx extends StatefulWidget {
  //Constructor
  String txLabel ;
  String chId;
  Widget child;

  ProDsxTx({
    required String this.txLabel,
    required String this.chId,
    required this.child
  });


  @override
  State<ProDsxTx> createState() => _ProDsxTx();


}

class _ProDsxTx extends State<ProDsxTx> {
  @override
  Image captureImg = Image.asset('');

  updateImg() {
    setState(() {
      imageCache.clear();
      imageCache.clearLiveImages();
      captureImg = Image.network('http://172.31.2.${widget.chId.substring(2)}/images/capture.jpg?t=${DateTime.now().millisecond}');

    });
  }
  initState() {
    // to Aspeed to get jpg format
    http.get(Uri.parse("http://172.31.2.${widget.chId.substring(2)}/cgi-bin/query.cgi?cmd=cd /www/images%3Becho jpg 60 1 > /dev/videoip%3Bsleep 1%3Bcat /dev/videoip > capture.jpg"));
    updateImg();  //Get initial capture.jpg asap
    //Get capture jpg every 3 seconds thereafter
    Timer.periodic(const Duration(seconds: 3), (timer) {
      http.get(Uri.parse("http://172.31.2.${widget.chId.substring(2)}/cgi-bin/query.cgi?cmd=cd /www/images%3Becho jpg 60 1 > /dev/videoip%3Bsleep 1%3Bcat /dev/videoip > capture.jpg"));
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
                icon: Align(alignment:Alignment.bottomCenter,child: widget.child),
                label: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    widget.txLabel,
                    style: TextStyle(
                        backgroundColor: Colors.grey[800],
                        color: Colors.white
                    ),

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
                Provider.of<SwitchProDsxRX>(context,listen: false).switchRx(widget.chId);

              }
          ),
        ),
      ),]
    );
  }
}