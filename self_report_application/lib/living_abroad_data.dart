import 'package:flutter/material.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/container.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';
import 'package:self_report_application/styling.dart';

//Living Abroad First Page
class LivingAbroadDataPage extends StatelessWidget {
  const LivingAbroadDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LivingAbroadDataForm();
  }
}

class LivingAbroadDataForm extends StatefulWidget {
  @override
  _LivingAbroadDataFormState createState() => _LivingAbroadDataFormState();
}

class _LivingAbroadDataFormState extends State<LivingAbroadDataForm> {
  final livingAbroadDataKey = GlobalKey<FormState>();

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
                key: livingAbroadDataKey,
                child:ListView(
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
                        labels: 'Alamat Lengkap di Luar Negeri',
                        needsInfoButton: false,
                        isDataRequired: true,
                        hintContents: '',
                        buttonContent: '',
                        valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),                    
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                          labels: 'Negara',
                          needsInfoButton: false,
                          isDataRequired: true,
                          hintContents: 'Kanada',
                          buttonContent: '',
                          valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Propinsi',
                          style: TextStyling.regularTextStyle,
                        ),
                        DropdownButton(
                          value: provinceDropdownValue,
                          hint: Text('Pilih Propinsi'),
                          items: provinces.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              provinceDropdownValue = newValue!;
                            });
                          },
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Kota',
                          style: TextStyling.regularTextStyle,
                        ),
                        DropdownButton(
                          value: cityDropdownValue,
                          hint: Text('Pilih Kota'),
                          items: cities.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              cityDropdownValue = newValue!;
                            });
                          },
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                          labels: 'Kode Pos',
                          needsInfoButton: false,
                          isDataRequired: true,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),                    
                        ),
                        //TODO: Adjust button position
                        Row(
                          children: [
                            ElevatedButton(
                              child: const Text('Back'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const IdentityPage()),
                                );
                              },
                            ),
                            // TODO: Adjust button position
                            ElevatedButton(
                              child: const Text('Next'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LivingAbroadDataContinuePage()),
                                );
                              },
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
