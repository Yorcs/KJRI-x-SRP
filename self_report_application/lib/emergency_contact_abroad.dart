import 'package:flutter/material.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/container.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';
import 'package:self_report_application/styling.dart';

//Emergency Contact Abroad Page
class EmergencyContactAbroadPage extends StatelessWidget {
  const EmergencyContactAbroadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmergencyContactAbroadForm();
  }
}

class EmergencyContactAbroadForm extends StatefulWidget {
  @override
  _EmergencyContactAbroadFormState createState() => _EmergencyContactAbroadFormState();
}

class _EmergencyContactAbroadFormState extends State<EmergencyContactAbroadForm> {
  final emergencyContactAbroadKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          //TODO: Readjust margin and padding
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Form(
                key: emergencyContactAbroadKey,
                child:ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Di Luar Negeri',
                          style: TextStyling.regularBoldTextStyle,
                        ),
                        FormContainer(
                        labels: 'Nama',
                        needsInfoButton: false,
                        isDataRequired: true,
                        hintContents: '',
                        buttonContent: '',
                        valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                        ),
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
                        //TODO: Change RegExp
                        FormContainer(
                          labels: 'Email',
                          needsInfoButton: false,
                          isDataRequired: true,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),                    
                        ),
                        //TODO: Change RegExp
                        FormContainerWithDisabledText(
                          labels: 'Telepon',
                          needsInfoButton: false,
                          isDataRequired: true,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: RegExp(r'^[0-9]+$'),
                          areaCode: '+1',                  
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
