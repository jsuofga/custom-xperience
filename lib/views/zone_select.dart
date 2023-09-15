import 'package:flutter/material.dart';
import 'package:xperience_flutter/models/zone_button.dart';

class Zoneselect extends StatefulWidget {
  const Zoneselect({Key? key}) : super(key: key);

  @override
  _ZoneselectState createState() => _ZoneselectState();
}

class _ZoneselectState extends State<Zoneselect> {

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/x_logo.png'),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ZoneButton(zoneLabel: 'Small Room', zone: 1,pageIndexWhenSelected: 3,),ZoneButton(zoneLabel: 'Big Room', zone: 2,pageIndexWhenSelected: 1,)

                    ],
                  ),
                ],
              )
            );


  }
}