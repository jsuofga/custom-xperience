import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;

class HdlanTx extends StatefulWidget {
  //Constructor
  String txLabel ;
  String chId;
  Widget child;

  HdlanTx ({
    required String this.txLabel,
    required String this.chId,
    required this.child
  });


  @override
  State<HdlanTx > createState() => _HdlanTx ();
}

class _HdlanTx  extends State<HdlanTx > {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
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
    );
  }
}