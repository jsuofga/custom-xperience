import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/models/hdlan_tx.dart';
import 'package:xperience_flutter/models/hdlan_tx_with_preview.dart';

import '../provider.dart';

class HdlanInputSelects  extends StatefulWidget {
  const HdlanInputSelects ({Key? key}) : super(key: key);

  @override
  _HdlanInputSelects createState() => _HdlanInputSelects();
}

class _HdlanInputSelects extends State<HdlanInputSelects> {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  GestureDetector(
      //Wrapping container with GestureDetector makes page clickable.
      onTap: (){
        // switch back to room if user taps outside of buttons
        Provider.of<PageSelect>(context,listen: false).selectPage(3);
      },
      child: Container(
        color: Colors.transparent,
        child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children:[Text('Video Sources',style:TextStyle(color: Colors.white,fontSize: 20),)]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HdlanTx(txLabel: 'Cable1', chId: "1",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0, color: Colors.white,)),
                    HdlanTx(txLabel: 'Cable2',chId: "2",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    HdlanTx(txLabel: 'AppleTV',chId: "3",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    HdlanTxWithPreview(txLabel: 'Multi-In16Main',chId: "4",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),

                  ],

                ),

              ],
            )
        ),
      ),
    );


  }
}