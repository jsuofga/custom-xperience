import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class ProdsxFloatingMenuButton extends StatefulWidget {
  //Constructor

  @override
  State<ProdsxFloatingMenuButton> createState() => _ProdsxFloatingMenuButton();
}

class _ProdsxFloatingMenuButton extends State<ProdsxFloatingMenuButton> {
  @override
  Widget build(BuildContext context) {

    return  Positioned(
      bottom: 20,
      right:20,
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed:(){},
        child:
        SpeedDial(
          backgroundColor: Colors.lightGreen, //background color of button
          foregroundColor: Colors.white, //font color, icon color in button
          icon: Icons.menu, //icon on Floating action button
          children: [
            SpeedDialChild( //speed dial child
              child:  Text('+14'),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: 'Merge TV 1-14',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () =>{
                Provider.of<PageSelect>(context,listen: false).selectPage(2),
                Provider.of<SwitchProDsxRX>(context,listen: false).mergeRx(14, 1, 14),

              } ,
            ),
            SpeedDialChild( //speed dial child
              child:  Text('-14'),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'Un-merge TV 1-14',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () =>{
                Provider.of<SwitchProDsxRX>(context,listen: false).unmergeAll(),
              } ,
            ),
            SpeedDialChild( //speed dial child
              child:  Icon(Icons.pause,color:Colors.white),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              label: 'Blackout video',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () =>{
                Provider.of<SwitchProDsxRX>(context,listen: false).blackout_resume_video('2'),
              }
            ),
            SpeedDialChild( //speed dial child
              child:  Icon(Icons.play_arrow,color: Colors.black,),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              label: 'Resume Video',
              labelStyle: TextStyle(fontSize: 18.0),
                onTap: () =>{
                  Provider.of<SwitchProDsxRX>(context,listen: false).blackout_resume_video('0'),
                }
            ),
          ],),),
    );
  }
}