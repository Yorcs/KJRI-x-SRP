import 'package:flutter/material.dart';
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
    required this.controller,
  });

  //Constraints and Arguments
  final String labels;
  final String buttonContent;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        FilePickerLabelingWidget(
          labelName: labels,
          buttonInfo: buttonContent,
        ),
        FilePickerButton(
          controller: controller,
        ), 
      ]
    );
  }
}
