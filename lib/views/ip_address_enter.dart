import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:xperience_flutter/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class IpAddressForm extends StatefulWidget {
  const IpAddressForm({Key? key}) : super(key: key);
  @override
  _IpAddressForm createState() => _IpAddressForm();
}

class _IpAddressForm extends State<IpAddressForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController textController_mdf = TextEditingController();

  String _ip_mdf = ''; // MDF switch ip address

  bool needToChangeIP = false;

  @override
  void initState() {
    super.initState();
    _readIPAddress();
  }
  //Read from storage
  void _readIPAddress() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _ip_mdf = prefs.getString('ip_mdf') ?? '';
      textController_mdf.text = _ip_mdf;

    });
  }
  //Save to storage
  void _saveIPaddress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip_mdf', _ip_mdf);
  }

  @override
  Widget build(BuildContext context) {

    return Form(
        key: _formKey,

        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:40.0),
              Text('IP Address of Cisco SG350 Switch is: ${Provider.of<HdlanRxStatus>(context,listen: true).switchIPAddress}',style: TextStyle(color: Colors.white),),
              Container(
                width:600,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextFormField(

                   controller: textController_mdf,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        // icon:Icon(Icons.person),
                        hintText: 'Enter IP Address of Cisco Switch for the SG350 Switch (black)',
                        labelText: _ip_mdf
                    ),
                    onChanged: (val){
                      setState(() {
                        needToChangeIP = true;
                      });
                    },
                    validator: (val) {
                      //Regular Expression check of IP address
                      if(!RegExp(r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$").hasMatch(val!) ){
                        return 'Enter IP address of MDF Switch (switch1)';
                      }else{
                        setState(() {
                          print(val);
                          _ip_mdf = val;
                        });
                        return null;
                      }
                    }
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width:600,
                  child: Visibility(
                    visible: needToChangeIP,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                            icon: Icon(Icons.close),
                            label: Text('Cancel'),
                            style: ElevatedButton.styleFrom(
                              primary:Colors.red,
                            ),
                            onPressed: () {
                              Provider.of<PageSelect>(context,listen: false).selectPage(0);
                            }
                        ),
                        ElevatedButton.icon(
                            icon: Icon(Icons.check),
                            label: Text('Submit'),
                            style: ElevatedButton.styleFrom(
                              primary:Colors.green,
                            ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid,do the following:
                                // Save IP address to Pi UserSwitchConfig
                                print('http://${html.window.location.hostname.toString()}:3000/write/UserSwitchConfig/{"ip":"${_ip_mdf}","TXports":10,"RXports":38 }');
                                http.get(Uri.parse('http://${html.window.location.hostname.toString()}:3000/write/UserSwitchConfig/{"ip":"${_ip_mdf}","model":"SG350-52","TXports":10,"RXports":38}'));
                                Provider.of<PageSelect>(context,listen: false).selectPage(0);
                              }
                            }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !needToChangeIP,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                      icon: Icon(Icons.close),
                      label: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        primary:Colors.red,
                      ),
                      onPressed: () {
                        Provider.of<PageSelect>(context,listen: false).selectPage(0);
                      }
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }
}
