import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';

class FormContainerWithDisabledText extends StatelessWidget {
  const FormContainerWithDisabledText({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.areaCode,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final String areaCode;
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
          buttonInfo: buttonContent,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 80,
              child: TextField(
                enabled: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: areaCode
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 200,
              child: TextsForm(
                labels: labels,
                requiredData: isDataRequired,
                valueConstraints: valueConstraints, 
                hintContent: hintContents,
                ),
            ),
          ],
        ),
      ],
    );
  }
}

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
          buttonInfo: buttonContent,
        ),
        TextsForm(
          labels: labels,
          requiredData: isDataRequired,
          valueConstraints: valueConstraints, 
          hintContent: hintContents,
          ),
      ],
    );
  }
}

//Form
//TODO: Needs refactoring to reduce redundancy
//TODO: change RegExp String according to what we need
//TODO: Find a way to save the data
class TextsForm extends StatelessWidget {
  const TextsForm({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.requiredData,
    required this.hintContent,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContent;
  final RegExp valueConstraints;
  final bool requiredData;

  // //Saved data string
  // late String savedLabel;
  // late String savedData;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintContent,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.black
            )
          ),
      ),
      // onSaved: (value){
      //   if(!requiredData || !valueConstraints.hasMatch(value!)){
          
      //   } else {
      //     savedLabel: labels;
      //     savedData: value;
      //   }
      // },
      validator:(value){
        if(!requiredData || !valueConstraints.hasMatch(value!)){
          return "Invalid input"; //TODO: Please change prompt
        } else{
          return null;
        }
      },
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