import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';


class ZoneButton extends StatefulWidget {
  //Constructor
  String zoneLabel ;
  int zone ;  //1 for zone 1, 2 for zone 2
  int pageIndexWhenSelected ;
  
  ZoneButton({
    required String this.zoneLabel,
    required int this.zone,
    required int this.pageIndexWhenSelected
  });

  @override
  State<ZoneButton> createState() => _ZoneButtonState();
}

class _ZoneButtonState extends State<ZoneButton> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
          height:200,width: 200,
          child:ElevatedButton(
            onPressed: (){
              Provider.of<PageSelect>(context,listen: false).selectPage(widget.pageIndexWhenSelected);
            },
            child: Text(widget.zoneLabel,style: TextStyle(color: Colors.white, fontSize: 30),),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                    side: BorderSide(color:Colors.white,width:1)
                  //border radius equal to or more than 50% of width
                )
            ),
          )
      ),
    );
  }
}