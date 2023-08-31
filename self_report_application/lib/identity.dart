import 'package:flutter/material.dart';
import 'package:self_report_application/container.dart';
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
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FormContainer(
                      labels: 'Nama Lengkap',
                      needsInfoButton: true,
                      isDataRequired: true,
                      hintContents: '',
                      buttonContent: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada). Contoh: Arena Sri Viktoria',
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
                      buttonContent: 'Sesuai yang tertulis di paspor. Tidak ada spasi.',
                      valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                    ),
                    FormContainer(
                      labels: 'NIK',
                      needsInfoButton: true,
                      isDataRequired: false,
                      hintContents: '',
                      buttonContent: 'Jika ada, NIK bisa dilihat di KTP atau Kartu Keluarga',
                      valueConstraints: RegExp(r'^[a-z A-Z]+$'),                    
                    ),
                    Text('Jenis kelamin'),
                    DropdownButton(
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
              ),
            ),
          )
        );
      },
    );
  }
}
