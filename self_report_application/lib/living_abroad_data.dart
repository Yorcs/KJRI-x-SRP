import 'package:flutter/material.dart';
import 'package:self_report_application/identity.dart';
import 'package:self_report_application/container.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';

//Requirements Page
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
  final LivingAbroadDataKey = GlobalKey<FormState>();

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
              child: Form(
                key: LivingAbroadDataKey,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FormContainer(
                      labels: 'Alamat Lengkap di Luar Negeri',
                      needsInfoButton: false,
                      isDataRequired: true,
                      hintContents: '',
                      buttonContent: '',
                      valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),                    
                    ),
                    FormContainer(
                      labels: 'Negara',
                      needsInfoButton: false,
                      isDataRequired: true,
                      hintContents: 'Kanada',
                      buttonContent: '',
                      valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                    ),
                    
                    Text('Propinsi'),
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
                    Text('Kota'),
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
                        //TODO: Adjust button position
                        // ElevatedButton(
                        //   child: const Text('Next'),
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => const LivingAbroadDataContinuePage()),
                        //     );
                        //   },
                        // ),
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
