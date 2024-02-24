import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

//This class is strictly for styling purposes only. Created for reusability.

//Text styles (Including headers)
class TextStyling {
  //Main Header
  static const TextStyle firstHeaderTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  //Sub Header
  static const TextStyle secondHeaderTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 23,
    fontWeight: FontWeight.bold
  );

  //Third Header
  static const TextStyle thirdHeaderTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  //Regular Text
  static const TextStyle regularTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 16,
  );

  //Regular Bold Text
  static const TextStyle regularBoldTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  //Page Title Text/ Caption Text
  static const TextStyle captionTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(118, 144, 235, 1),
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
  final String assetName = 'images/info-button.svg';

//TODO: Replace placeholders
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(contents),
        )),
      icon: SvgPicture.asset(
        assetName,
        height: 30,
        width: 30,
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

  PlatformFile? pickedFile;

// Future<String> saveFiles() async{
//   if(pickedFile!.path != null && pickedFile!.path!.isNotEmpty)
//   FileImage(File(pickedFile!.path));
// }


  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result== null) return;

    setState(() {
      pickedFile = result.files.first;    
    });

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
        if(pickedFile!.name != '')...[
          SizedBox(
            width: 200,
            child: Text(pickedFile!.name),
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
                  labelText: pickedFile!.path,
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