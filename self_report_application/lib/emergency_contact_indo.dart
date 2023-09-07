import 'package:flutter/material.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/container.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';
import 'package:self_report_application/styling.dart';

//Emergency Contact in Indonesia Page
class EmergencyContactIndoPage extends StatelessWidget {
  const EmergencyContactIndoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmergencyContactIndoForm();
  }
}

class EmergencyContactIndoForm extends StatefulWidget {
  @override
  _EmergencyContactIndoFormState createState() => _EmergencyContactIndoFormState();
}

class _EmergencyContactIndoFormState extends State<EmergencyContactIndoForm> {
  final emergencyContactIndoKey = GlobalKey<FormState>();

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
                key: emergencyContactIndoKey,
                child:ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Di Indonesia',
                              style: TextStyling.regularBoldTextStyle,
                            ),
                            InfoButton(
                              contents: 'Informasi kontak sesuai surat-surat pemerintah'
                            ),
                          ],
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
                          areaCode: '+62',                  
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
