import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final RegExp valueConstraints;
  final bool isDataRequired;
  final bool needsInfoButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada). Contoh: Arena Sri Viktoria',
        ),
        TextsForm(
          labels: labels,
          requiredData: isDataRequired,
          valueConstraints: RegExp(r'^[a-z A-Z]+$'), 
          hintContent: hintContents,
          ),
      ],
    );
  }
}

class LabelingWidget extends StatelessWidget {
  const LabelingWidget({
    super.key, 
    required this.labelName,
    required this.buttonInfo,
    required this.needsInfo,
  });

  final String labelName;
  final bool needsInfo;
  final String buttonInfo;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(labelName),
        if(!needsInfo) ... [
        ] else ... [
          InfoButton(contents: buttonInfo)
        ]
        
      ],
    );
  }
}