import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

//This class is strictly for styling purposes only. Created for reusability.

//Styling for box form

class FormStyling {
  InputDecoration formDecoration(String? hintContent){
    return InputDecoration(
      errorStyle: TextStyle(
      fontFamily: 'Source Sans Pro',
      color: Color.fromRGBO(255, 5, 5, 1),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 0.5,
          color: Color.fromRGBO(255, 5, 5, 1),
        )
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 0.5,
          color: Color.fromRGBO(255, 5, 5, 1),
        )
      ),
      focusColor: Color.fromRGBO(74, 74, 74, 1),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: Color.fromRGBO(74, 74, 74, 1),
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
      prefix: const Padding(
        padding: EdgeInsets.only(left: 15),
      ),
      hintText: hintContent,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 0.5,
          color: Color.fromRGBO(179, 179, 179, 1),
        )
      ),
    );
  }
}

//Dropdown Decoration for Goal of Styling
InputDecoration noHintFormDecoration = 
InputDecoration(
  errorStyle: TextStyle(
    fontFamily: 'Source Sans Pro',
    color: Color.fromRGBO(255, 5, 5, 1),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: Color.fromRGBO(255, 5, 5, 1),
    )
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: Color.fromRGBO(255, 5, 5, 1),
    )
  ),
  focusColor: Color.fromRGBO(74, 74, 74, 1),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: Color.fromRGBO(74, 74, 74, 1),
    ),
  ),
  contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
  prefix: Padding(
    padding: EdgeInsets.only(left: 15),
  ),
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.5,
      color: Color.fromRGBO(179, 179, 179, 1),
    )
  ),
);

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
        foregroundColor: WidgetStateProperty.all<Color>(Colors.grey)
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
    required this.enableButton,
  });

  final VoidCallback? onPressed;
  final bool enableButton;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          backgroundColor: WidgetStateProperty.all<Color>(Color.fromRGBO(85, 119, 238, 1)),
          shadowColor: WidgetStateProperty.all<Color>(Color.fromRGBO(0, 0, 0, 0)),
          overlayColor: WidgetStateProperty.all<Color>(Color.fromRGBO(73, 105, 221, 1)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
          padding:WidgetStateProperty.all(EdgeInsets.all(18)),
        ),
        onPressed: enableButton ? onPressed : null,
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
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          backgroundColor: WidgetStateProperty.all<Color>(Color.fromRGBO(136, 205, 255, 1)),
          shadowColor: WidgetStateProperty.all<Color>(Color.fromRGBO(0, 0, 0, 0)),
          overlayColor: WidgetStateProperty.all<Color>(Color.fromRGBO(117, 185, 234, 1)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
          padding:WidgetStateProperty.all(EdgeInsets.all(16)),
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
// ignore: must_be_immutable
class FilePickerButton extends StatefulWidget {
  FilePickerButton({super.key, required this.fileController, required this.fileName});

  final TextEditingController fileController;
  final TextEditingController fileName;

    @override
  State<FilePickerButton> createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePickerButton> {

  String? fileName;
  String? mobileFileName;
  String? fileBytesEncoded;
  Uint8List? fileBytes;
  double _sizekbs = 0;
  File? file;
  final int maxSizeKbs = 1024 * 5; //1024 kb = 1 mb

  Future<void> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, withData: true, allowedExtensions: ['png', 'jpeg', 'jpg'],);

    
    if (result!= null && result.files.isNotEmpty){
      if(kIsWeb){
        final size = result.files.first.size;
        _sizekbs = size / 1024;
        if(_sizekbs < maxSizeKbs){
          fileBytes = result.files.first.bytes;
          fileName = result.files.first.name;
        } else {
          return;
        }

      } else {
        file = File(result.files.first.path!);
        int sizeInBytes = file!.lengthSync();
        double sizeInMb = sizeInBytes / (1024 * 1024);
        if(sizeInMb <= 5){
          fileName = file!.path;
          fileBytes = file!.readAsBytesSync();
          mobileFileName = result.files.first.name;
        }
        else {
          return;
        }
      }
    } else {
      return;
    }

    setState(() {
      fileBytesEncoded = base64Encode(fileBytes!);
      widget.fileController.text = fileBytesEncoded!;
      widget.fileName.text =fileName!;
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
              if(kIsWeb)...[
                SizedBox(
                  width: 180,
                  child: Text(fileName!),
                ),
              ] else ...[
                SizedBox(
                  width: 180,
                  child: Text(mobileFileName!),
                ),
              ],
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
              SizedBox(
                width: 0,
                child: Visibility(
                  visible: false,
                  child: TextFormField(
                    controller: widget.fileController,
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
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