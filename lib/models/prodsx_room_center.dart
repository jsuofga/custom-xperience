import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:xperience_flutter/models/prodsx_rx.dart';
import 'package:xperience_flutter/models/merge_button.dart';


class ProDsxRoomCenter extends StatefulWidget {
  //Constructor

  @override
  State<ProDsxRoomCenter> createState() => _ProDsxRoomCenter();
}

class _ProDsxRoomCenter extends State<ProDsxRoomCenter> {
  @override
  Widget build(BuildContext context) {

    return  //Center
      Expanded(
          flex:2,
          child: Container(color: Colors.transparent,
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            bottom:0,
                            child: MergeTVButton(mycolor: Colors.orange,merge2or3: 2, startRx: 8, endRx: 9, quarterTurn: 1)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProDsxRx(rxLabel: 'RX8', rxId: '8'),
                            ProDsxRx(rxLabel: 'RX9', rxId: '9'),
                          ],),]
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  height: 150,
                  width: 300,
                  child:Center(child: Chip(
                    avatar: Icon(Icons.wine_bar_sharp,color: Colors.white,size: 30,),
                    label: const Text('BAR',style: TextStyle(color: Colors.white,fontSize: 30),),
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.fromLTRB(50,30,50,30),
                  )),

                ),
                Container(
                  height: 150,
                  child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children:[
                        Positioned(
                            top:0,
                            child: MergeTVButton(mycolor: Colors.orange, merge2or3: 2, startRx: 1, endRx: 2, quarterTurn: 1))
                        ,Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ProDsxRx(rxLabel: 'RX2', rxId: '2'),
                            ProDsxRx(rxLabel: 'RX1', rxId: '1'),
                          ],),]
                  ),
                ),

              ],),
          )
      );

  }
}