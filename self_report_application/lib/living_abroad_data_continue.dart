import 'package:flutter/material.dart';
import 'package:self_report_application/living_abroad_data.dart';
import 'package:self_report_application/styling.dart';
import 'package:file_picker/file_picker.dart';

//Living Abroad cont. Page
class LivingAbroadDataContinuePage extends StatelessWidget {
  const LivingAbroadDataContinuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LivingAbroadDataContinueForm();
  }
}

class LivingAbroadDataContinueForm extends StatefulWidget {
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LivingAbroadDataPage()),
                                );
                              },
                            ),
                            // TODO: Adjust button position
                            //TODO: Change source
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