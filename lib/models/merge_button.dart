import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';

class MergeTVButton extends StatefulWidget {
  //Constructor
  Color mycolor;
  int merge2or3 ;
  int startRx ;
  int endRx ;
  int quarterTurn;

  MergeTVButton({
    required Color this.mycolor,
    required int this.merge2or3,
    required int this.startRx,
    required int this.endRx,
    required int this.quarterTurn,

  });

  @override
  State<MergeTVButton> createState() => _MergeTVButton();
}

class _MergeTVButton extends State<MergeTVButton> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Provider.of<PageSelect>(context,listen: false).selectPage(2);
          Provider.of<SwitchProDsxRX>(context,listen: false).mergeRx(widget.merge2or3, widget.startRx, widget.endRx);

        },
        child: RotatedBox(
          quarterTurns: widget.quarterTurn,
          child: Icon( //<-- SEE HERE
            Icons.expand,
            color: Colors.white,
            size: 26,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), //<-- SEE HERE
          padding: EdgeInsets.all(2),
          backgroundColor: widget.mycolor
        ),
      ),

    );
  }
}