import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';
import 'package:file_picker/file_picker.dart';

//Living Abroad cont. Page
class LivingAbroadDataContinuePage extends StatelessWidget {
  const LivingAbroadDataContinuePage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode});
  final String name;
  final String idNumber;
  final String dob;
  final String passport;
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
      addressAbroad: addressAbroad,
      country: country,
      postalCode: postalCode,
    );
  }
}

class LivingAbroadDataContinueForm extends StatefulWidget {
  const LivingAbroadDataContinueForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode});

  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String addressAbroad;
  final String country;
  final String postalCode;

  @override
  _LivingAbroadDataContinueFormState createState() => _LivingAbroadDataContinueFormState();
}

class _LivingAbroadDataContinueFormState extends State<LivingAbroadDataContinueForm> {
  final livingAbroadDataContinueKey = GlobalKey<FormState>();

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

  goBack(BuildContext context)=> Navigator.pop(context);

  getItemAndNavigate (BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivingAbroadDataContinuePage(
          name: widget.name,
          passport: widget.passport,
          idNumber: widget.idNumber,
          dob: widget.dob, 
          addressAbroad: widget.addressAbroad,
          country: widget.country,
          postalCode: widget.postalCode,      
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
              child: Form(
                key: livingAbroadDataContinueKey,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        //TODO: Create file picker
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
                                if(livingAbroadDataContinueKey.currentState!.validate()){
                                  getItemAndNavigate(context);
                                }
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