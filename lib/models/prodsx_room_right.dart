import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:xperience_flutter/models/prodsx_rx.dart';
import 'package:xperience_flutter/models/prodsx_rx16.dart';
import 'package:xperience_flutter/models/merge_button.dart';


class ProDsxRoomRight extends StatefulWidget {
  //Constructor

  @override
  State<ProDsxRoomRight> createState() => _ProDsxRoomRight();
}

class _ProDsxRoomRight extends State<ProDsxRoomRight> {
  @override
  Widget build(BuildContext context) {

    return  //Right Wall
      Expanded(
          flex:2,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.start , children: [ ProDsxRx(rxLabel: 'Exit Proj', rxId: '15'),ProDsxRx16(rxLabel: 'Input16 for Small', rxId: '16'),],),
                Container(
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children:[
                      Positioned(
                        right:-0,
                        bottom: -20,
                        child: MergeTVButton(mycolor: Colors.orange,  merge2or3:2,startRx: 10,endRx: 11,quarterTurn: 0,),
                      ),
                      Positioned(
                        right:55,
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
                          quarterTurns:1,
                          child: ProDsxRx(rxLabel: 'RX10', rxId: '10')),

                    ],),
                ),

                RotatedBox(
                    quarterTurns:1,
                    child: ProDsxRx(rxLabel: 'RX11', rxId: '11')),
                Container(
                  width: 200,
                  child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children:[
                        RotatedBox(
                            quarterTurns:1,
                            child: ProDsxRx(rxLabel: 'RX12', rxId: '12')),
                        Positioned(
                          left:0,
                          child: MergeTVButton( mycolor: Colors.purpleAccent,  merge2or3:3,startRx: 11,endRx: 13,quarterTurn: 0,),
                        ),
                        Positioned(
                          left:50,
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
                    quarterTurns:1,
                    child: ProDsxRx(rxLabel: 'RX13', rxId: '13')),
                Container(
                  width: 200,
                  child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children:[
                        Positioned(
                          right:0,
                          top: -20,
                          child: MergeTVButton(mycolor: Colors.orange,merge2or3:2,startRx: 13,endRx: 14,quarterTurn: 0,),
                        ),
                        Positioned(
                          right:55,
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
                            quarterTurns:1,
                            child: ProDsxRx(rxLabel: 'RX14', rxId: '14')),
                      ]
                  ),
                ),

              ],

            ),
          )

      );
  }
}