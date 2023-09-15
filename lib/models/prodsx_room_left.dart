import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:xperience_flutter/models/prodsx_rx.dart';
import 'package:xperience_flutter/models/merge_button.dart';


class ProDsxRoomLeft extends StatefulWidget {
  //Constructor

  @override
  State<ProDsxRoomLeft> createState() => _ProDsxRoomLeft();
}

class _ProDsxRoomLeft extends State<ProDsxRoomLeft> {
  @override
  Widget build(BuildContext context) {

    return  //Left Wall
      Expanded(
          flex:2,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.start , children: [Container(width:120,height:60,)],),
                Container(
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children:[
                      Positioned(
                        left:-0,
                        bottom: -20,
                        child: MergeTVButton(mycolor: Colors.orange,  merge2or3:2,startRx: 6,endRx: 7,quarterTurn: 0,),
                      ),
                      Positioned(
                        left:55,
                        bottom: -100,
                        child: SizedBox(
                          height: 200,
                          width: 2,
                          child: ColoredBox(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      RotatedBox(
                          quarterTurns:3,
                          child: ProDsxRx(rxLabel: 'RX7', rxId: '7')),

                    ],),
                ),

                RotatedBox(
                    quarterTurns:3,
                    child: ProDsxRx(rxLabel: 'RX6', rxId: '6')),
                Container(
                  width: 200,
                  child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children:[
                        RotatedBox(
                            quarterTurns:3,
                            child: ProDsxRx(rxLabel: 'RX5', rxId: '5')),
                        Positioned(
                          right:0,
                          child: MergeTVButton( mycolor: Colors.purpleAccent,  merge2or3:3,startRx: 4,endRx: 6,quarterTurn: 0,),
                        ),
                        Positioned(
                          right:50,
                          child: SizedBox(
                            height: 300,
                            width: 2,
                            child: ColoredBox(
                              color: Colors.purpleAccent  ,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                RotatedBox(
                    quarterTurns:3,
                    child: ProDsxRx(rxLabel: 'RX4', rxId: '4')),
                Container(
                  width: 200,
                  child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children:[
                        Positioned(
                          left:0,
                          top: -20,
                          child: MergeTVButton(mycolor: Colors.orange,merge2or3:2,startRx: 3,endRx: 4,quarterTurn: 0,),
                        ),
                        Positioned(
                          left:55,
                          bottom: 10,
                          child: SizedBox(
                            height: 200,
                            width: 2,
                            child: ColoredBox(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        RotatedBox(
                            quarterTurns:3,
                            child: ProDsxRx(rxLabel: 'RX3', rxId: '3')),
                      ]
                  ),
                ),
              ],
            ),
          )
      );
  }
}