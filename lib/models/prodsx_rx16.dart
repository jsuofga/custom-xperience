import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;

class ProDsxRx16 extends StatefulWidget {
  //Constructor
  String rxLabel ;
  String rxId ;

  ProDsxRx16({
    required String this.rxLabel,
    required String this.rxId,

  });


  @override
  State<ProDsxRx16> createState() => _ProDsxRx16();
}

class _ProDsxRx16 extends State<ProDsxRx16> {
  @override
  Widget build(BuildContext context) {


    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Text(Provider.of<RxStatus>(context,listen: true).chSelects[int.parse(widget.rxId)-1]! ,style: TextStyle(color:Colors.white,fontSize: 12),),
            SizedBox(
              width: 120,
              height: 50,
              child: TextButton.icon(
                  icon: Icon(
                    Icons.settings_input_hdmi_sharp,
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