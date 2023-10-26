import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

// Labels
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

// Disabled text form
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
    required this.requiredDataChecker,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final String areaCode;
  final String valueConstraints;
  final bool requiredDataChecker;
  final AutovalidateMode isDataRequired;
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
                requiredDataChecker: requiredDataChecker,
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

// Two inputs with date time
class FormContainerWithTwoInputs extends StatelessWidget {
  const FormContainerWithTwoInputs({
    super.key,
    required this.labels,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.controller,
    required this.controller2,required this.firstDates, required this.lastDates, required this.firstDates2, required this.lastDates2,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final AutovalidateMode isDataRequired;
  final bool needsInfoButton;
  final DateTime firstDates;
  final DateTime lastDates;

  final DateTime firstDates2;
  final DateTime lastDates2;  
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
              child: DatePicker(
                controller: controller,
                labels: labels,
                requiredData: isDataRequired,
                firstDates: firstDates,
                lastDates: lastDates,
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
              child: DatePicker(
                controller: controller2,
                labels: 'Masa Berakhir Visa',
                requiredData: isDataRequired,
                firstDates: firstDates2,
                lastDates: lastDates2,
                hintContent: hintContents,
              ),
            ),
          ]
        ),
      ],
    );
  }
}


// Base form container
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
    required this.requiredDataChecker,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final String valueConstraints;
  final AutovalidateMode isDataRequired;
  final bool requiredDataChecker;
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
          requiredDataChecker: requiredDataChecker,
          valueConstraints: valueConstraints, 
          hintContent: hintContents,
        ),
      ]
    );
  }
}


// Date Picker with Labels
class DateFormContainer extends StatelessWidget {
  const DateFormContainer({
    super.key,
    required this.labels,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.controller, required this.firstDates, required this.lastDates,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final AutovalidateMode isDataRequired;
  final bool needsInfoButton;
  final TextEditingController controller;
  final DateTime firstDates;
  final DateTime lastDates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
        ),
        DatePicker(
          controller: controller,
          labels: labels,
          requiredData: isDataRequired,
          firstDates: firstDates,
          lastDates: lastDates,
          hintContent: hintContents,
        ),
      ]
    );
  }
}



// Date Picker
class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key, required this.labels, required this.controller, required this.firstDates, required this.lastDates, required this.requiredData, required this.hintContent,
  });

  // Constraints 
  final String labels;
  final TextEditingController controller;
  final AutovalidateMode requiredData;
  final DateTime firstDates;
  final DateTime lastDates;
  final String hintContent;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: labels,
      autovalidateMode: requiredData,
      controller: controller,
      inputType: InputType.date,
      initialDate: DateTime.now(),
      firstDate: firstDates,
      lastDate: lastDates,
      format: DateFormat('yyyy-MM-dd'),
      decoration: InputDecoration(
        hintText: hintContent,
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.black
            )
          ),
      ),
      validator: (value){
        if (value == null){
          return 'Please select a date';
        }
        return null;
      }
    );
  }
}

//Dropdown Container
//TODO: Change into a reusable.

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
    required this.requiredDataChecker,
    });

  //Constraints
  final String labels;
  final String hintContent;
  final String valueConstraints;
  final bool requiredDataChecker;
  final AutovalidateMode requiredData;
  final TextEditingController controller;

  late String labelName;
  late String valueContent;

  
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: labels,
      autovalidateMode: requiredData,
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
      validator: FormBuilderValidators.compose([
        (value){
          if(!requiredDataChecker){
            return null;
          } else {
          if(value == '' || value!.isEmpty){
            return 'Invalid input on $labels'; //TODO: Change Prompt Later.
          } else {
            FormBuilderValidators.match(valueConstraints, errorText: 'Invalid input on $labels');
          }
          return null;
          }
        },
      ]),
    );
  }
}

