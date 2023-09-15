import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:xperience_flutter/models/hdlan_rx.dart';
import 'dart:math' as math;


class HdlanRoom extends StatefulWidget {
  const HdlanRoom ({Key? key}) : super(key: key);

  @override

  _HdlanRoom  createState() => _HdlanRoom ();

}

class _HdlanRoom  extends State<HdlanRoom > {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // HdlanRx(rxLabel: 'TV4', rxId: '4')
    return Padding(

      padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(

              children: [
                HdlanRx(rxLabel: 'RX5', rxId: '25'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        RotatedBox(quarterTurns: 3,  child: HdlanRx(rxLabel: 'RX4', rxId: '24')),
                        RotatedBox(quarterTurns: 3,  child: HdlanRx(rxLabel: 'RX3', rxId: '23')),
                        RotatedBox(quarterTurns: 3,  child: HdlanRx(rxLabel: 'RX2', rxId: '22')),
                        RotatedBox(quarterTurns: 3,  child: HdlanRx(rxLabel: 'RX1', rxId: '21')),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Chip(
                              avatar: Icon(Icons.wine_bar_sharp,color: Colors.white,size: 30,),
                              label: const Text('BAR',style: TextStyle(color: Colors.white,fontSize: 30),),
                              backgroundColor: Colors.orangeAccent,
                              padding: EdgeInsets.fromLTRB(120,30,120,30),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [HdlanRx(rxLabel: 'RX7', rxId: '27')],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
            children: [HdlanRx(rxLabel: 'RX6', rxId: '26')
            ],
            ),
          )
        ],
      ),
    );
  }
}



