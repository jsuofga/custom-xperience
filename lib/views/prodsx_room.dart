import 'package:flutter/material.dart';
import 'package:xperience_flutter/models/prodsx_rx.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'dart:math' as math;
import 'package:xperience_flutter/models/merge_button.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:xperience_flutter/models/menu_floating_action_prodsx.dart';
import 'package:xperience_flutter/models/prodsx_room_left.dart';
import 'package:xperience_flutter/models/prodsx_room_center.dart';
import 'package:xperience_flutter/models/prodsx_room_right.dart';

class ProDsxRoom extends StatefulWidget {
  const ProDsxRoom ({Key? key}) : super(key: key);

  @override

  _ProDsxRoom  createState() => _ProDsxRoom ();

  }

class _ProDsxRoom  extends State<ProDsxRoom > {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      children:[
        Row(
            children:
            [
              // Left Wall
              ProDsxRoomLeft(),
              //Center
              ProDsxRoomCenter(),
              // Right Wall
              ProDsxRoomRight(),
            ],
      ),

      // Floating Action Menu Button
      ProdsxFloatingMenuButton()

      ]
    );
  }
}



