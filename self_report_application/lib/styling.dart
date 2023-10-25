import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';



//creating custom text style
class TextStyling {
  //needs readjust
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  //needs readjust
  static const TextStyle subHeaderTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  //needs readjust
  static const TextStyle blueregularBoldTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  //needs readjust
  static const TextStyle regularTextStyle = TextStyle(
    fontSize: 16,
  );

  //needs readjust
  static const TextStyle regularBoldTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );
}

//Pop up dialog button
//TODO: Change icon
class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.contents,
  });

  final String contents;

//TODO: Replace placeholders
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(contents),
        )),
      icon: const ImageIcon(
        AssetImage('images/info-button.png'),
      ),
      );
  }
}

//File Picker
//TODO: Work on it more
class FilePickerButton extends StatefulWidget {
  const FilePickerButton({super.key, required this.controller});

  final TextEditingController controller;
    @override
  State<FilePickerButton> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePickerButton> {

  String _fileName ='';
  String _filePath ='';
  late ByteData trueBytes;

  // String getStringFromBytes(ByteData data){
  //   final buffer = data.buffer;
  //   var list = buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
  //   return utf8.decode(list);
  // }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result!= null && result.files.isNotEmpty){
      _fileName = result.files.first.name;
      _filePath = result.files.first.path ?? '';
      // Uint8List? fileBytes = result.files.first.bytes;
      // trueBytes = fileBytes!.buffer.asByteData();
      
      setState(() {
        
      });
    } else {
      return;
    }

// TODO: DEBUG PURPOSES DELETE LATER
    print(result.files.first.name);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 150,
          child: ElevatedButton(
            child: const Text('Unggah File'),
            onPressed: () {
              pickFiles();
            },
          ),
        ),
        SizedBox(
          width: 30,
        ),
        if(_fileName != '')...[
          SizedBox(
            width: 200,
            child: Text(_fileName),
          ),
          // Extracting file name
          SizedBox(
            width: 0,
            child: Visibility(
              visible: false,
              child: TextField(
                controller: widget.controller,
                enabled: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: _filePath,
                ),
              ),
            ),
          )
        ] else ...[
        ]
      ],
    );
  }
}