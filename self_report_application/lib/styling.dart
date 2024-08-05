import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';

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

  static const TextStyle errorTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 12,
    color: Color.fromRGBO(255, 5, 5, 1),
  );

  static const TextStyle hintTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    color: Color.fromRGBO(179, 179, 179, 1),
    fontSize: 16,
  );

  //Page Title Text/ Caption Text
  static const TextStyle captionTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(118, 144, 235, 1),
  );
  
  static const TextStyle overviewTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    color: Color.fromRGBO(163, 163, 163, 1),
    fontSize: 12,
  );

  static const TextStyle overviewHeaderTextStyle = TextStyle(
    fontFamily: 'Source Sans Pro',
    color: Color.fromRGBO(110, 119, 129, 1),
    fontSize: 12,
  );
}

// Back Button Style
class BackButtons extends StatelessWidget{
  const BackButtons({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      ),
      onPressed: onPressed,
      child: const Text('Kembali'),
    );
  } 
}

// Forward Button Style
class ForwardButtons extends StatelessWidget{
  const ForwardButtons({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(85, 119, 238, 1)),
          shadowColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 0, 0, 0)),
          overlayColor: MaterialStateProperty.all<Color>(Color.fromRGBO(73, 105, 221, 1)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
          padding:MaterialStateProperty.all(EdgeInsets.all(18)),
        ),
        onPressed: onPressed,
        child: const Text('Lanjut'),
      ),
    );
  } 
}

// File Button Style
class FileButtonsStyle extends StatelessWidget{
  const FileButtonsStyle({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(136, 205, 255, 1)),
          shadowColor: MaterialStateProperty.all<Color>(Color.fromRGBO(0, 0, 0, 0)),
          overlayColor: MaterialStateProperty.all<Color>(Color.fromRGBO(117, 185, 234, 1)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
          padding:MaterialStateProperty.all(EdgeInsets.all(16)),
        ),
        onPressed: onPressed,
        child: const Text('Unggah File'),
      ),
    );
  } 
}


//Pop up dialog button
class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.contents,
  });

  final String contents;
  final String assetName = 'images/info-button.svg';

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
        height: 20,
        width: 20,
      ),
      );
  }
}

//File Picker
class FilePickerButton extends StatefulWidget {
  FilePickerButton({super.key, required this.fileController, required this.fileName, required this.fileType});

  final TextEditingController fileController;
  final TextEditingController fileName;
  PlatformFile? fileType;

    @override
  State<FilePickerButton> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePickerButton> {

  String? fileName;
  String? fileBytesEncoded;
  Uint8List? fileBytes;
  double _sizekbs = 0;
  final int maxSizeKbs = 1024 * 5; //1024 kb = 1 mb

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['png', 'jpeg', 'jpg']);

    
    if (result!= null && result.files.isNotEmpty){
      final size = result.files.first.size;
      _sizekbs = size / 1024;
      if(_sizekbs < maxSizeKbs){
        fileBytes = result.files.first.bytes;
        fileName = result.files.first.name;
      }
      else{
        return;
      }
    } else {
      return;
    }

    // final tempDir = await getTemporaryDirectory();
    // File file = await File('${tempDir.path}$fileName').create();

    setState(() {
      fileName = result.files.first.name;
      widget.fileType = result.files.first;
      // fileBytesDecoded = fileBytes.toString();
      // fileBytesEncoded = base64Encode(fileBytes!);
      // debugPrint(fileBytesEncoded);
      // widget.fileController.text = fileBytesEncoded!;
      widget.fileName.text = result.files.first.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 150,
              child: FileButtonsStyle(
                onPressed: () {
                  pickFiles();
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            if(fileName != null)...[
              SizedBox(
                width: 180,
                child: Text(fileName!),
              ),
              SizedBox(
                width: 0,
                child: Visibility(
                  visible: false,
                  child: TextFormField(
                    controller: widget.fileName,
                    enabled: false,
                    textAlign: TextAlign.center,
                  )),
              ),
            //Extracting file name
              // SizedBox(
              //   width: 0,
              //   child: Visibility(
              //     visible: false,
              //     child: TextFormField(
              //       controller: widget.fileController,
              //       enabled: false,
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // )
            ] else ...[
              
            ]
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 400,
          child: Text(
            "File harus dibawah 5MB atau file harus di dalam format JPG, JPEG, atau PNG",
            style: TextStyling.errorTextStyle,
          ),
        ),
      ],
    );
  }
}