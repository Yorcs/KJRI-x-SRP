import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';



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
class FilePickerButton extends StatelessWidget {
  const FilePickerButton({
    super.key,
  });

  void pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Unggah File'),
      onPressed: () {
        pickFiles();
      },
    );
  }
}