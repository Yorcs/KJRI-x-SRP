import 'package:flutter/material.dart';
import 'package:self_report_application/emergency_contact_indo.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';

//Emergency Contact Abroad Page
class EmergencyContactAbroadPage extends StatelessWidget {
  const EmergencyContactAbroadPage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.visaNumber, required this.visaStartDate, required this.visaEndDate, required this.gender});
  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String gender;
  final String addressAbroad;
  final String country;
  final String postalCode;
  final String visaNumber;
  final String visaStartDate;
  final String visaEndDate;

  @override
  Widget build(BuildContext context) {
    return EmergencyContactAbroadForm(
      name: name,
      idNumber: idNumber,
      dob: dob,
      passport: passport,
      gender: gender,
      addressAbroad: addressAbroad,
      country: country,
      postalCode: postalCode,
      visaNumber: visaNumber,
      visaStartDate: visaStartDate,
      visaEndDate: visaEndDate,
    );
  }
}

class EmergencyContactAbroadForm extends StatefulWidget {
  const EmergencyContactAbroadForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.visaNumber, required this.visaStartDate, required this.visaEndDate, required this.gender});

  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String gender;
  final String addressAbroad;
  final String country;
  final String postalCode;
  final String visaNumber;
  final String visaStartDate;
  final String visaEndDate;
  
  @override
  _EmergencyContactAbroadFormState createState() => _EmergencyContactAbroadFormState();
}

class _EmergencyContactAbroadFormState extends State<EmergencyContactAbroadForm> {
  final emergencyContactAbroadKey = GlobalKey<FormState>();
  final TextEditingController _emergencyContactAbroadName = TextEditingController();
  final TextEditingController _emergencyContactAbroadEmail = TextEditingController();
  final TextEditingController _emergencyContactAbroadPhone = TextEditingController();

  String? relationshipDropdownValue;
  String? cityDropdownValue;

  var relationship = [
    'Keluarga',
    'Rekan Kerja',
    'Istri/Suami',
    'Orang Tua',
    'Teman',
  ];

  @override
  void initState(){
    super.initState();
    _emergencyContactAbroadName.addListener(() {
      final String text = _emergencyContactAbroadName.text;
      _emergencyContactAbroadName.value = _emergencyContactAbroadName.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _emergencyContactAbroadEmail.addListener(() {
      final String text = _emergencyContactAbroadEmail.text;
      _emergencyContactAbroadEmail.value = _emergencyContactAbroadEmail.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _emergencyContactAbroadPhone.addListener(() {
      final String text = _emergencyContactAbroadPhone.text;
      _emergencyContactAbroadPhone.value = _emergencyContactAbroadPhone.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _emergencyContactAbroadName.dispose();
    _emergencyContactAbroadEmail.dispose();
    _emergencyContactAbroadPhone.dispose();
    super.dispose();
  }

  goBack(BuildContext context)=> Navigator.pop(context);

  getItemAndNavigate (BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmergencyContactIndoPage(
          name: widget.name,
          passport: widget.passport,
          idNumber: widget.idNumber,
          dob: widget.dob, 
          gender: widget.gender,
          addressAbroad: widget.addressAbroad,
          country: widget.country,
          postalCode: widget.postalCode,
          visaNumber: widget.visaNumber,
          visaStartDate: widget.visaStartDate,
          visaEndDate: widget.visaEndDate,
          emergencyContactAbroadName: _emergencyContactAbroadName.toString(),
          emergencyContactAbroadEmail: _emergencyContactAbroadEmail.toString(),
          emergencyContactAbroadPhone: _emergencyContactAbroadPhone.toString(),  
          emergencyContactAbroadRelationship: relationshipDropdownValue.toString(),
          emergencyContactAbroadCity: cityDropdownValue.toString(),   
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
                key: emergencyContactAbroadKey,
                child:ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildHeader(
                        pageName: 'Kontak Darurat',
                        opacity1: 0.5,
                        opacity2: 0.5,
                        opacity3: 0.5,
                        opacity4: 1,
                        changeColor1: Colors.blue,
                        changeColor2: Colors.blue,
                        changeColor3: Colors.blue,
                        changeColor4: Colors.white,
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Di Luar Negeri',
                          style: TextStyling.regularBoldTextStyle,
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                        labels: 'Nama',
                        needsInfoButton: false,
                        isDataRequired: AutovalidateMode.always,
                        hintContents: '',
                        buttonContent: '',
                        requiredDataChecker: true,
                        valueConstraints: RegExp(r'^[a-z A-Z]+$'),
                        controller: _emergencyContactAbroadName,                    
                        ),
                        SizedBox(height: 30,),
                        Text('Hubungan'),
                        DropdownButton(
                          value: relationshipDropdownValue,
                          hint: Text('Pilih Hubungan'),
                          items: relationship.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              relationshipDropdownValue = newValue!;
                            });
                          },
                        ),
                        SizedBox(height: 30,),
                        //TODO: Change RegExp
                        FormContainer(
                          labels: 'Email',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.always,
                          hintContents: '',
                          buttonContent: '',
                          requiredDataChecker: true,
                          valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),
                          controller: _emergencyContactAbroadEmail,                  
                        ),
                        SizedBox(height: 30,),
                        //TODO: Change RegExp
                        FormContainerWithDisabledText(
                          labels: 'Telepon',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.always,
                          hintContents: '',
                          buttonContent: '',
                          requiredDataChecker: true,
                          valueConstraints: RegExp(r'^[0-9]+$'),
                          areaCode: '+1',
                          controller: _emergencyContactAbroadPhone,                  
                        ),
                        //TODO: Adjust button position
                        Row(
                          children: [
                            ElevatedButton(
                              child: const Text('Back'),
                              onPressed: () => goBack(context)
                            ),
                            // TODO: Adjust button position
                            ElevatedButton(
                              child: const Text('Next'),
                              onPressed: () {
                                // if(emergencyContactAbroadKey.currentState!.validate()){
                                  getItemAndNavigate(context);
                                // }
                              }
                            ),
                          ],
                        )                  
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        );
      },
    );
  }
}
