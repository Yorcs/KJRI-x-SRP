import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';

// Forms
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
        Text(
          labelName,
          style: TextStyling.regularTextStyle,
        ),
        if(!needsInfo) ... [
        ] else ... [
          InfoButton(contents: buttonInfo)
        ]
        
      ],
    );
  }
}


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
    required this.controller,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final String areaCode;
  final RegExp valueConstraints;
  final bool isDataRequired;
  final bool needsInfoButton;
  final TextEditingController controller;

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
                controller: controller,
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

class FormContainerWithTwoInputs extends StatelessWidget {
  const FormContainerWithTwoInputs({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.controller,
    required this.controller2,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final RegExp valueConstraints;
  final bool isDataRequired;
  final bool needsInfoButton;
  final TextEditingController controller;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
          LabelingWidget(
            labelName: labels,
            needsInfo: needsInfoButton,
            buttonInfo: buttonContent,
          ),
        SizedBox(height: 10,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            SizedBox(
              width: 100,
              child: TextsForm(
                controller: controller,
                labels: labels,
                requiredData: isDataRequired,
                valueConstraints: valueConstraints, 
                hintContent: hintContents,
                ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                'Sampai',
                textAlign: TextAlign.center,
                ),
              ),
            SizedBox(
              width: 100,
              child: TextsForm(
                controller: controller2,
                labels: labels,
                requiredData: isDataRequired,
                valueConstraints: valueConstraints, 
                hintContent: hintContents,
              ),
            ),
          ]
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
    required this.controller,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final RegExp valueConstraints;
  final bool isDataRequired;
  final bool needsInfoButton;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
        ),
        TextsForm(
          controller: controller,
          labels: labels,
          requiredData: isDataRequired,
          valueConstraints: valueConstraints, 
          hintContent: hintContents,
        ), 
      ]
    );
  }
}

// Base Form
//TODO: Needs refactoring to reduce redundancy
//TODO: change RegExp String according to what we need
// ignore: must_be_immutable
class TextsForm extends StatelessWidget {
  TextsForm({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.requiredData,
    required this.hintContent,
    required this.controller,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContent;
  final RegExp valueConstraints;
  final bool requiredData;
  final TextEditingController controller;

  late String labelName;
  late String valueContent;

  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintContent,
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black
            )
          ),
      ),
      onSaved: (value){
      },
      validator:(value){
        if(!requiredData){
          return null; 
        } else {
          if(value!.isEmpty || !valueConstraints.hasMatch(value)){
            return "Invalid input on $labels"; //TODO: Change Prompt Later.
          }else{
              return null;
          }
        }
      },
    );
  }
}

