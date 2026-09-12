import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:async';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

import '../provider.dart';

class Uploadfile extends StatefulWidget {
  const Uploadfile({Key? key}) : super(key: key);

  @override
  _UploadfileState createState() => _UploadfileState();
}

class _UploadfileState extends State<Uploadfile> {
  bool showSelectDistTar = true;
  bool showUpload = false;
  bool uploading = false;
  bool uploadFinished= false;
  String userPrompt = 'Please load the dist.tar file provided';
  late List<int> _selectedFile;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  startFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _selectedFile = result.files.single.bytes!;
        showSelectDistTar = false;
        showUpload = true;
      });
    }
  }

  Future makeRequest() async {
    String host = Uri.base.host.isNotEmpty ? Uri.base.host : 'localhost';
    var url = Uri.parse("http://${host}:1880/update");
    var request = new http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromBytes(
        'file', _selectedFile,
        contentType: new MediaType('application', 'x-tar'),
        filename: "dist.tar"));

    request.send().then((response) {
      print("test");
      print(response.statusCode);
      if (response.statusCode == 200){
        print("Uploaded!");
        setState(() {
          showUpload = false;
          uploading = false;
          uploadFinished = true;
          Provider.of<PageSelect>(context,listen: false).selectPage(0);
        });
      }

    });

  }


  Widget build(BuildContext context) {

    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(visible: showSelectDistTar, child: Text('Select the dist.tar file provided',style: TextStyle(color: Colors.white, fontSize: 26),)),
              Visibility(visible: uploading, child: Text('Uploading',style: TextStyle(color: Colors.white, fontSize: 26),)),
              Visibility(visible: uploadFinished, child: Text('Done',style: TextStyle(color: Colors.white, fontSize: 26),)),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 28),
                  child: Container(
                      width: 350,
                      child: Column(
                          children: [
                            Visibility(
                              visible:!showUpload,
                              child: ElevatedButton( child: Text("Select File"),
                                onPressed: (){
                                  startFilePicker();
                                  setState(() {
                                    showSelectDistTar = false;
                                  });
                              },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Visibility(
                                visible: showUpload && !uploading,
                                child: ElevatedButton( child: Text("Upload File"),

                                  onPressed: (){
                                   setState(() {
                                     uploading = true;
                                   });
                                    makeRequest();
                                  },
                                ),
                              ),
                            ),


                          ]
                      )
                  ),
                ),
              )

            ],
          ),
        )

      );
 }
}
