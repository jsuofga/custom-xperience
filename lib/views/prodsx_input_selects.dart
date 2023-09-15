import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/models/prodsx_tx.dart';

import '../provider.dart';

class ProDsxInputSelects  extends StatefulWidget {
  const ProDsxInputSelects  ({Key? key}) : super(key: key);

  @override
  _ProDsxInputSelects  createState() => _ProDsxInputSelects  ();
}

class _ProDsxInputSelects extends State<ProDsxInputSelects> {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  GestureDetector(
      onTap: (){
        Provider.of<PageSelect>(context,listen: false).selectPage(1);
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
                    ProDsxTx(txLabel: 'Cable1', chId: "001",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0, color: Colors.white,)),
                    ProDsxTx(txLabel: 'Cable2',chId: "002",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'Cable3',chId: "003",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'AppleTV',chId: "004",child: Icon(Icons.settings_input_hdmi_sharp, size: 20.0,color: Colors.white,))
                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProDsxTx(txLabel: 'PlayStation', chId: "005",child: Icon(Icons.videogame_asset, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'DJ Boot PC',chId: "006",child: Icon(Icons.spatial_audio, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'IT Monitor 1',chId: "007",child: Icon(Icons.monitor, size: 20.0,color: Colors.white,)),
                    ProDsxTx(txLabel: 'IT Monitor 2',chId: "008",child: Icon(Icons.monitor, size: 20.0,color: Colors.white,))
                  ],

                ),
              ],
            )
        ),
      ),
    );


  }
}