import 'package:flutter/material.dart';
import 'package:self_report_application/emergency_contact_abroad.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';

//Living Abroad cont. Page
class LivingAbroadDataContinuePage extends StatelessWidget {
  const LivingAbroadDataContinuePage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.gender});
  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String gender;
  final String addressAbroad;
  final String country;
  final String postalCode;

  @override
  Widget build(BuildContext context) {
    return LivingAbroadDataContinueForm(
      name: name,
      idNumber: idNumber,
      dob: dob,
      passport: passport,
      gender: gender,
      addressAbroad: addressAbroad,
      country: country,
      postalCode: postalCode,
    );
  }
}

class LivingAbroadDataContinueForm extends StatefulWidget {
  const LivingAbroadDataContinueForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.gender});

  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String gender;
  final String addressAbroad;
  final String country;
  final String postalCode;

  @override
  _LivingAbroadDataContinueFormState createState() => _LivingAbroadDataContinueFormState();
}

class _LivingAbroadDataContinueFormState extends State<LivingAbroadDataContinueForm> {
  final livingAbroadDataContinueKey = GlobalKey<FormState>();
  final TextEditingController _visaNumber = TextEditingController();
  final TextEditingController _visaStartDate = TextEditingController();
  final TextEditingController _visaEndDate = TextEditingController();

  String? provinceDropdownValue;
  String? cityDropdownValue;

  var provinces = [
    'Alberta',
    'British Columbia',
  ];

  var cities = [
    'Burnaby',
    'Coquitlam',
    'Surrey',
  ];

  @override
  void initState(){
    super.initState();
    _visaNumber.addListener(() {
      final String text = _visaNumber.text;
      _visaNumber.value = _visaNumber.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _visaStartDate.addListener(() {
      final String text = _visaStartDate.text;
      _visaStartDate.value = _visaStartDate.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _visaEndDate.addListener(() {
      final String text = _visaEndDate.text;
      _visaEndDate.value = _visaEndDate.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _visaNumber.dispose();
    _visaStartDate.dispose();
    _visaEndDate.dispose();
    super.dispose();
  }

  goBack(BuildContext context)=> Navigator.pop(context);

  getItemAndNavigate (BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmergencyContactAbroadPage(
          name: widget.name,
          passport: widget.passport,
          idNumber: widget.idNumber,
          dob: widget.dob, 
          gender: widget.gender,
          addressAbroad: widget.addressAbroad,
          country: widget.country,
          postalCode: widget.postalCode,
          visaNumber: _visaNumber.toString(),
          visaStartDate: _visaStartDate.toString(),
          visaEndDate: _visaEndDate.toString(),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          //TODO: Readjust margin and padding
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Form(
                key: livingAbroadDataContinueKey,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        BuildHeader(
                        pageName: 'Data di Luar negeri',
                        opacity1: 0.5,
                        opacity2: 1,
                        opacity3: 0.5,
                        opacity4: 0.5,
                        changeColor1: Colors.blue,
                        changeColor2: Colors.white,
                        changeColor3: Colors.blue,
                        changeColor4: Colors.blue,
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                        labels: 'Nomor Visa',
                        needsInfoButton: true,
                        isDataRequired: true,
                        hintContents: '',
                        buttonContent: 'Diisi dengan nomor yang ada di:\n\u2022Study Permit\n\u2022Work Permit\n\u2022Kartu PR',
                        valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                        controller: _visaNumber,                 
                        ),
                        //TODO: Create file picker
                        FormContainerWithTwoInputs(
                        labels: 'Masa Berlaku Visa',
                        needsInfoButton: false,
                        isDataRequired: true,
                        hintContents: '',
                        buttonContent: '',
                        valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                        controller: _visaStartDate,
                        controller2: _visaEndDate,                 
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              child: const Text('Back'),
                              onPressed: () => goBack(context),
                            ),
                            // TODO: Adjust button position
                            //TODO: Change source
                            ElevatedButton(
                              child: const Text('Next'),
                              onPressed: () {
                                // if(livingAbroadDataContinueKey.currentState!.validate()){
                                  getItemAndNavigate(context);
                                // }
                              }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ),
          )
        );
      },
    );
  }
}