import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phone_form_field/phone_form_field.dart';

// Main Labels
class LabelingWidget extends StatelessWidget {
  const LabelingWidget({
    super.key, 
    required this.labelName,
    required this.buttonInfo,
    required this.needsInfo,
    required this.style,
  });

  final String labelName;
  final bool needsInfo;
  final String buttonInfo;
  final TextStyle style;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          labelName,
          style: style,
        ),
        if(!needsInfo) ... [
        ] else ... [
          InfoButton(contents: buttonInfo)
        ]
        
      ],
    );
  }
}

//Overview Label
class OverviewLabelWidget extends StatelessWidget{
  const OverviewLabelWidget({
    super.key,
    required this.labelName,
    required this.content,
  });

  final String content;
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelName,
          style: TextStyling.overviewTextStyle,
        ),
        SizedBox(height: 10,),
        Text(
          content,
          style: TextStyling.regularTextStyle,
        ),
      ],
    );
  }
}

//Overview Combined StringLabel
class OverviewLabelCombinedStringWidget extends StatelessWidget{
  const OverviewLabelCombinedStringWidget({
    super.key,
    required this.labelName,
    required this.content1,
    required this.content2,
  });

  final String content1;
  final String content2;
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelName,
          style: TextStyling.overviewTextStyle,
        ),
        SizedBox(height: 10,),
        Text(
          content1 + content2,
          style: TextStyling.regularTextStyle,
        ),
      ],
    );
  }
}

//Overview Label with Header
class OverviewCombinedLabelWidget extends StatelessWidget{
  const OverviewCombinedLabelWidget({
    super.key,
    required this.labelName1,
    required this.labelName2,
    required this.content1,
    required this.content2,
  });

  final String labelName1;
  final String labelName2;
  final String content1;
  final String content2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OverviewLabelWidget(
                labelName: labelName1,
                content: content1,
              ),
              SizedBox(
                width: 30,
              ),
              OverviewLabelWidget(
                labelName: labelName2,
                content: content2,
              )
            ]
          ) 
        )
      ],
    );
  }
}

//Main Overview Header
class OverviewHeaderWidget extends StatelessWidget{
  const OverviewHeaderWidget({
    super.key,
    required this.headerLabelName,
  });

  final String headerLabelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          headerLabelName,
          style: TextStyling.overviewHeaderTextStyle,
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}

//Overview Label with Header
class OverviewHeaderLabelWidget extends StatelessWidget{
  const OverviewHeaderLabelWidget({
    super.key,
    required this.headerLabelName,
    required this.labelName1,
    required this.labelName2,
    required this.content1,
    required this.content2,
  });

  final String headerLabelName;
  final String labelName1;
  final String labelName2;
  final String content1;
  final String content2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          headerLabelName,
          style: TextStyling.overviewHeaderTextStyle,
        ),
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OverviewLabelWidget(
                labelName: labelName1,
                content: content1,
              ),
              SizedBox(
                width: 30,
              ),
              OverviewLabelWidget(
                labelName: labelName2,
                content: content2,
              )
            ]
          ) 
        )
      ],
    );
  }
}

//TODO: DELETE. Disabled text form for phone number
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
    required this.manualErrorText,
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
  final String manualErrorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
          style: TextStyling.regularTextStyle,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 50,
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
                width: 220,
                child: TextsForm(
                  controller: controller,
                  labels: labels,
                  requiredDataChecker: requiredDataChecker,
                  requiredData: isDataRequired,
                  valueConstraints: valueConstraints, 
                  hintContent: hintContents,
                  manualErrorText: manualErrorText,
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO: DELETE. Phone number container for enabled area code
class FormContainerWithTwoEnabledText extends StatelessWidget {
  const FormContainerWithTwoEnabledText({
    super.key,
    required this.labels,
    required this.valueConstraints,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.controller,
    required this.controller2,
    required this.requiredDataChecker,
    required this.manualErrorText,
  });

  //Constraints and Arguments
  final String labels;
  final String hintContents;
  final String buttonContent;
  final String valueConstraints;
  final bool requiredDataChecker;
  final AutovalidateMode isDataRequired;
  final bool needsInfoButton;
  final TextEditingController controller;
  final TextEditingController controller2;
  final String manualErrorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
          style: TextStyling.regularTextStyle,
        ),
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 50,
                child: TextsForm(
                  controller: controller,
                  labels: labels,
                  requiredDataChecker: requiredDataChecker,
                  requiredData: isDataRequired,
                  valueConstraints: valueConstraints, 
                  hintContent: hintContents,
                  manualErrorText: manualErrorText,
                  ),
              ),
              SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 220,
                child: TextsForm(
                  controller: controller2,
                  labels: labels,
                  requiredDataChecker: requiredDataChecker,
                  requiredData: isDataRequired,
                  valueConstraints: valueConstraints, 
                  hintContent: hintContents,
                  manualErrorText: manualErrorText,
                  ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Phone Number Container
class PhoneFormFields extends StatelessWidget{
  const PhoneFormFields({
    required this.controller,
  });

  final PhoneController controller;

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      controller: controller,
      validator:  PhoneValidator.compose(
        [PhoneValidator.required(errorText: "Tolong periksa ulang nomor telepon"),PhoneValidator.validMobile()]
      ),
      countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
      enabled: true,
      isCountrySelectionEnabled: true,
      isCountryChipPersistent: false,
    );
  }

}

// Two inputs with date time
class FormContainerWithTwoInputs extends StatelessWidget {
  const FormContainerWithTwoInputs({
    super.key,
    required this.mainLabel,
    required this.labels1,
    required this.labels2,
    required this.isDataRequired,
    required this.hintContents,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.controller,
    required this.controller2,
    required this.firstDates,
    required this.lastDates,
    required this.firstDates2,
    required this.lastDates2,
    required this.text1,
    required this.text2,
    required this.textStyle,
  });

  //Constraints and Arguments
  final String mainLabel;
  final String labels1;
  final String labels2;
  final String hintContents;
  final String buttonContent;
  final String text1;
  final String text2;
  final AutovalidateMode isDataRequired;
  final bool needsInfoButton;
  final DateTime firstDates;
  final DateTime lastDates;

  final String textStyle;

  final DateTime firstDates2;
  final DateTime lastDates2;  
  final TextEditingController controller;
  final TextEditingController controller2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        if(textStyle == "header")...[
          LabelingWidget(
          labelName: mainLabel,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
          style: TextStyling.regularBoldTextStyle,
          ),
        ] else...[
          LabelingWidget(
          labelName: mainLabel,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
          style: TextStyling.regularTextStyle,
          ),
        ],
        
        SizedBox(height: 5,),
        Text(
          text1,
          style: TextStyling.regularTextStyle,
        ),
        SizedBox(height: 8,),
        DatePicker(
          controller: controller,
          labels: labels1,
          requiredData: isDataRequired,
          firstDates: firstDates,
          lastDates: lastDates,
          hintContent: hintContents,
        ),
        SizedBox(height: 8,),
        Text(text2, style: TextStyling.regularTextStyle,),
        SizedBox(height: 8,),
        DatePicker(
          controller: controller2,
          labels: labels2,
          requiredData: isDataRequired,
          firstDates: firstDates2,
          lastDates: lastDates2,
          hintContent: hintContents,
        ),
      ],
    );
  }
}

// Disabled Base form container
class DisabledFormContainer extends StatefulWidget {
  const DisabledFormContainer({
    super.key,
    required this.labels,
    required this.needsInfoButton, 
    required this.buttonContent,
    required this.controller,
  });

  //Constraints and Arguments
  final String labels;
  final String buttonContent;
  final bool needsInfoButton;
  final TextEditingController controller;

  @override
  State<DisabledFormContainer> createState() => _DisabledFormContainerState();
}

class _DisabledFormContainerState extends State<DisabledFormContainer> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        LabelingWidget(
          labelName: widget.labels,
          needsInfo: widget.needsInfoButton,
          buttonInfo: widget.buttonContent,
          style: TextStyling.regularTextStyle,
        ),
        TextFormField(
          enabled: false,
          controller: widget.controller,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0.5,
                color: Colors.black
              )
            ),
          ),
        ),
      ]
    );
  }
}

//Base form container
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
    required this.manualErrorText,
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
  final String manualErrorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
          style: TextStyling.regularTextStyle,
        ),
        SizedBox(height: 10,),
        TextsForm(
          controller: controller,
          labels: labels,
          requiredData: isDataRequired,
          requiredDataChecker: requiredDataChecker,
          valueConstraints: valueConstraints, 
          hintContent: hintContents,
          manualErrorText: manualErrorText,
        ),
      ]
    );
  }
}

// Dropdown container
// ignore: must_be_immutable
class DropdownContainer extends StatelessWidget {
  DropdownContainer({
    super.key,
    //Labels
    required this.labels,
    required this.needsInfoButton, 
    required this.buttonContent,

    //Dropdown
    required this.dropdownName,
    required this.validatorWarning,
    required this.hintContents,
    required this.dropdownValue,
    required this.dropdownContents,
    required this.dropdownKey,
    
  });

  //Constraints and Arguments
  final String labels;
  final String buttonContent;
  final bool needsInfoButton;
  final String hintContents;
  final String dropdownName;
  final String dropdownKey;
  final String validatorWarning;
  String? dropdownValue;
  List<String> dropdownContents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        LabelingWidget(
          labelName: labels,
          needsInfo: needsInfoButton,
          buttonInfo: buttonContent,
          style: TextStyling.regularTextStyle,
        ),
        if(needsInfoButton == false)...[
          SizedBox(height: 10,),
          DropdownForm(
            dropdownContents: dropdownContents,
            dropdownValue: dropdownValue,
            dropdownName: dropdownName,
            validatorWarning: validatorWarning,
            hintContents: hintContents,
            dropdownKey: dropdownKey,
          ),
        ] else...[
          DropdownForm(
            dropdownContents: dropdownContents,
            dropdownValue: dropdownValue,
            dropdownName: dropdownName,
            validatorWarning: validatorWarning,
            hintContents: hintContents,
            dropdownKey: dropdownKey,
          ),
        ],
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
          style: TextStyling.regularTextStyle,
        ),
        if(needsInfoButton == false)...[
          SizedBox(height: 10,),
          DatePicker(
            controller: controller,
            labels: labels,
            requiredData: isDataRequired,
            firstDates: firstDates,
            lastDates: lastDates,
            hintContent: hintContents,
          ),
        ] else...[
          DatePicker(
            controller: controller,
            labels: labels,
            requiredData: isDataRequired,
            firstDates: firstDates,
            lastDates: lastDates,
            hintContent: hintContents,
          ),
        ],
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
// ignore: must_be_immutable
class DropdownForm extends StatefulWidget {
  DropdownForm({
    super.key,
    required this.dropdownContents,
    required this.dropdownValue,
    required this.dropdownName,
    required this.validatorWarning,
    required this.hintContents,
    required this.dropdownKey,
    }
  );

  String? dropdownValue;
  final String dropdownName;
  final String validatorWarning;
  final String hintContents;
  final String dropdownKey;
  // ignore: prefer_typing_uninitialized_variables
  List<String> dropdownContents;


  @override
  State<DropdownForm> createState() => DropdownFormState();
}

class DropdownFormState extends State<DropdownForm> {
  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.dropdownKey, widget.dropdownValue.toString());
  }
  
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: widget.dropdownName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose([
        (value){
          if(value ==null || value =='' || value.isEmpty){
            return widget.validatorWarning;
          }
          widget.dropdownValue = value;
          saveData();
          return null;
        }
      ]),
      onChanged: (String? newValue){
        setState((){
          widget.dropdownValue = newValue!;
          }
        );
      },
      decoration: InputDecoration(
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
        hintStyle: TextStyling.hintTextStyle,
        hintText: widget.hintContents,
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
        prefix: const Padding(
          padding: EdgeInsets.only(left: 15),
        ),
        focusColor: Color.fromRGBO(74, 74, 74, 1),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Color.fromRGBO(74, 74, 74, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Color.fromRGBO(179, 179, 179, 1),
          )
        )
      ),
      items: widget.dropdownContents
      .map((obj) => DropdownMenuItem<String>(
        value: obj,
        child: Text(obj),
        )).toList()
    );
  }
}


// Base Form
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
    required this.manualErrorText,
    });

  //Constraints
  final String labels;
  final String hintContent;
  final String valueConstraints;
  final bool requiredDataChecker;
  final AutovalidateMode requiredData;
  final TextEditingController controller;
  final String manualErrorText;

  late String labelName;
  late String valueContent;

  
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: labels,
      autovalidateMode: requiredData,
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
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
      ),
      validator: FormBuilderValidators.compose([
        (value){
          if(!requiredDataChecker){
            return null;
          } else {
            RegExp regExp = RegExp(valueConstraints, caseSensitive: false);
            if(value == '' || value!.isEmpty || !regExp.hasMatch(value)){
              return manualErrorText; //TODO: Change Prompt Later.
              
            } else {
              // FormBuilderValidators.match(valueConstraints, errorText: 'Invalid input on $labels');
            }
            return null;
          }
        },
      ]),
    );
  }
}

