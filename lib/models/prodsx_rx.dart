import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;

class ProDsxRx extends StatefulWidget {
  //Constructor
  String rxLabel ;
  String rxId ;

  ProDsxRx({
    required String this.rxLabel,
    required String this.rxId,

  });


  @override
  State<ProDsxRx> createState() => _ProDsxRx();
}

class _ProDsxRx extends State<ProDsxRx> {
  @override
  Widget build(BuildContext context) {


    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Text(Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(widget.rxId)-1]! ,style: TextStyle(color:Colors.white,fontSize: 12),),
          SizedBox(
            width: 100,
            height: 50,
            child: TextButton.icon(
                icon: Icon(
                  Icons.tv,
                  color: Colors.lightGreenAccent,
                ),
                label: Text(
                  widget.rxLabel,
                  style: TextStyle(
                      color: Colors.lightGreenAccent
                  ),

                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color:Colors.lightGreenAccent)
                    ),
                  ),

                ),
                onPressed: () {
                  Provider.of<PageSelect>(context,listen: false).selectPage(2);
                  Provider.of<SwitchProDsxRX>(context,listen: false).selectRx(widget.rxId);
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