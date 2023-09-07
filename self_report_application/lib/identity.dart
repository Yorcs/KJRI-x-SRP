import 'package:flutter/material.dart';
import 'package:self_report_application/container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/living_abroad_data.dart';

//Requirements Page
class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdentityForm();
  }
}

class IdentityForm extends StatefulWidget {
  @override
  _IdentityFormState createState() => _IdentityFormState();
}

class _IdentityFormState extends State<IdentityForm> {
  final identityKey = GlobalKey<FormState>();

  String? dropdownValue;
  var items = [
    'Laki-laki',
    'Perempuan',
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
                key: identityKey,
                child:ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        BuildHeader(
                        pageName: 'Identitas',
                        opacity1: 1,
                        opacity2: 0.5,
                        opacity3: 0.5,
                        opacity4: 0.5,
                        changeColor1: Colors.white,
                        changeColor2: Colors.blue,
                        changeColor3: Colors.blue,
                        changeColor4: Colors.blue,
                        ),
                        FormContainer(
                        labels: 'Nama Lengkap',
                        needsInfoButton: true,
                        isDataRequired: true,
                        hintContents: '',
                        buttonContent: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada).\n\nContoh: \nArena Sri Viktoria',
                        valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                        ),
                        FormContainer(
                          labels: 'Tanggal Lahir',
                          needsInfoButton: false,
                          isDataRequired: true,
                          hintContents: 'DD/MM/YYYY',
                          buttonContent: '',
                          valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                        ),
                        FormContainer(
                          labels: 'Nomor Paspor',
                          needsInfoButton: true,
                          isDataRequired: true,
                          hintContents: '',
                          buttonContent: 'Sesuai yang tertulis di paspor. \nTidak ada spasi.',
                          valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),                    
                        ),
                        FormContainer(
                          labels: 'NIK',
                          needsInfoButton: true,
                          isDataRequired: false,
                          hintContents: '',
                          buttonContent: 'Jika ada, NIK bisa dilihat di KTP atau Kartu Keluarga',
                          valueConstraints: RegExp(r'^[0-9]+$'),                    
                        ),
                        Text(
                          'Jenis kelamin',
                          textAlign: TextAlign.left,),
                        DropdownButton(
                          alignment: Alignment.centerLeft,
                          value: dropdownValue,
                          hint: Text('Pilih Jenis Kelamin'),
                          items: items.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                        //TODO: Adjust button position
                        ElevatedButton(
                          child: const Text('Next'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LivingAbroadDataPage()),
                            );
                          },
                        ),
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
