import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:self_report_application/styling.dart';

// File Picker Containers
class FilePickerLabelingWidget extends StatelessWidget {
  const FilePickerLabelingWidget({
    super.key, 
    required this.labelName,
    required this.buttonInfo,
  });

  final String labelName;
  final String buttonInfo;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          labelName,
          style: TextStyling.regularTextStyle,
        ),
        InfoButton(contents: buttonInfo)        
      ],
    );
  }
}

class FilePickerContainer extends StatelessWidget {
  const FilePickerContainer({
    super.key,
    required this.labels,
    required this.buttonContent,
    required this.fileController,
    required this.fileName,
  });

  //Constraints and Arguments
  final String labels;
  final String buttonContent;
  final TextEditingController fileController;
  final TextEditingController fileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        FilePickerLabelingWidget(
          labelName: labels,
          buttonInfo: buttonContent,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FilePickerButton(
            fileController: fileController,
            fileName: fileName,
          ),
        ), 
      ]
    );
  }
}
