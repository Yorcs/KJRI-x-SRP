import 'package:flutter/material.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/living_abroad_data.dart';
import 'package:self_report_application/styling.dart';

//Identity Page
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dOB = TextEditingController();
  final TextEditingController _passport = TextEditingController();
  final TextEditingController _iDNumber = TextEditingController();

  @override
  void initState(){
    super.initState();
    _name.addListener(() {
      final String text = _name.text.toString();
      _name.value = _name.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _dOB.addListener(() {
      final String text = _dOB.text;
      _dOB.value = _dOB.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _passport.addListener(() {
      final String text = _passport.text;
      _passport.value = _passport.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _iDNumber.addListener(() {
      final String text = _iDNumber.text;
      _iDNumber.value = _iDNumber.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _name.dispose();
    _dOB.dispose();
    _passport.dispose();
    _iDNumber.dispose();
    super.dispose();
  }

  String? dropdownValue;
  var items = [
    'Laki-laki',
    'Perempuan',
  ];

  getItemAndNavigate (BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LivingAbroadDataPage(
          name: _name.toString(),
          passport: _passport.toString(),
          idNumber: _iDNumber.toString(),
          dob: _dOB.toString(), 
          gender: dropdownValue.toString(),      
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        SizedBox(height: 20,),
                        FormContainer(
                        labels: 'Nama Lengkap',
                        needsInfoButton: true,
                        isDataRequired: true,
                        hintContents: '',
                        buttonContent: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada).\n\nContoh: \nArena Sri Viktoria',
                        valueConstraints: RegExp(r'[a-z A-Z]+$'),   
                        controller: _name,                 
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                          labels: 'Tanggal Lahir',
                          needsInfoButton: false,
                          isDataRequired: true,
                          hintContents: 'DD/MM/YYYY',
                          buttonContent: '',
                          valueConstraints: RegExp(r'[a-z A-Z]+$'),   
                          controller: _dOB,                 
                        ),
                        SizedBox(height: 20,),
                        FormContainer(
                          labels: 'Nomor Paspor',
                          needsInfoButton: true,
                          isDataRequired: true,
                          hintContents: '',
                          buttonContent: 'Sesuai yang tertulis di paspor. \nTidak ada spasi.',
                          valueConstraints: RegExp(r'[a-z A-Z 0-9]+$'),  
                          controller: _passport,                  
                        ),
                        SizedBox(height: 20,),
                        FormContainer(
                          labels: 'NIK',
                          needsInfoButton: true,
                          isDataRequired: false,
                          hintContents: '',
                          buttonContent: 'Jika ada, NIK bisa dilihat di KTP atau Kartu Keluarga',
                          valueConstraints: RegExp(r'[0-9]+$'),   
                          controller: _iDNumber,                 
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Jenis kelamin',
                          textAlign: TextAlign.left,
                          style: TextStyling.regularTextStyle,
                        ),
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
                            // if(identityKey.currentState!.validate()){
                              getItemAndNavigate(context);
                            // }
                          }
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
