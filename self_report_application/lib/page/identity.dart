import 'package:flutter/material.dart';
import 'package:self_report_application/components/form_container.dart';
import 'package:self_report_application/components/header.dart';
import 'package:self_report_application/page/living_abroad_data.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:self_report_application/styling.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  State<IdentityForm> createState() => _IdentityFormState();
}

class _IdentityFormState extends State<IdentityForm> {
  final _identityKey = GlobalKey<FormBuilderState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dOB = TextEditingController();
  final TextEditingController _passport = TextEditingController();
  final TextEditingController _iDNumber = TextEditingController();

  late String nameString;
  late String dobString;
  late String passportString;
  late String idNumberString;
  late String dropdownValueString;

  Future<(String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    nameString = prefs.getString('Nama Lengkap') ?? '';
    dobString = prefs.getString('Tanggal Lahir') ??'';
    passportString = prefs.getString('Nomor Paspor') ?? '';
    idNumberString = prefs.getString('NIK') ?? '';
    dropdownValueString = prefs.getString('Jenis Kelamin') ?? '';

    setState(() {
      _name.text = nameString;
      _dOB.text = dobString;
      _passport.text = passportString;
      _iDNumber.text = idNumberString;
      dropdownValue = dropdownValueString;
    });

    return (nameString, dobString, passportString, idNumberString, dropdownValueString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Nama Lengkap', _name.text);
    await prefs.setString('Tanggal Lahir', _dOB.text);
    await prefs.setString('Nomor Paspor', _passport.text);
    await prefs.setString('NIK', _iDNumber.text);
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
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
  List<String> genderOptions = [
    'Laki-laki',
    'Perempuan',
  ];

  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _identityKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LivingAbroadDataPage()
      )
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child: FormBuilder(
              key: _identityKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BuildHeader(
                  pageName: 'IDENTITAS',
                  assetName: 'images/identitas-active.svg',
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        FormContainer(
                        labels: 'Nama Lengkap',
                        needsInfoButton: true,
                        isDataRequired: AutovalidateMode.onUserInteraction,
                        hintContents: '',
                        requiredDataChecker: true,
                        buttonContent: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada).\n\nContoh: \nArena Sri Viktoria',
                        valueConstraints: r"^[a-z A-Z,.\-']+$", 
                        manualErrorText: 'Harap periksa ulang format pengisian nama',  
                        controller: _name,                 
                        ),
                        SizedBox(height: 30,),
                        DateFormContainer(
                          labels: 'Tanggal Lahir',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: 'DD/MM/YYYY',
                          buttonContent: '',
                          controller: _dOB,
                          firstDates: DateTime(1900-01-01),
                          lastDates: DateTime.now(),                 
                        ),
                        SizedBox(height: 20,),
                        FormContainer(
                          labels: 'Nomor Paspor',
                          needsInfoButton: true,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          requiredDataChecker: true,
                          buttonContent: 'Sesuai yang tertulis di paspor. \nTidak ada spasi.',
                          valueConstraints: r'^[a-zA-Z0-9]+$',  
                          manualErrorText: 'Harap periksa ulang format pengisian paspor',
                          controller: _passport,                  
                        ),
                        SizedBox(height: 20,),
                        FormContainer(
                          labels: 'NIK',
                          needsInfoButton: true,
                          isDataRequired: AutovalidateMode.disabled,
                          hintContents: '',
                          requiredDataChecker: false,
                          buttonContent: 'Jika ada, NIK bisa dilihat di KTP atau Kartu Keluarga',
                          valueConstraints: r'^[0-9]+$',
                          manualErrorText: '',   
                          controller: _iDNumber,                 
                        ),
                        SizedBox(height: 30,),
                        DropdownContainer(
                          labels: 'Jenis Kelamin',
                          needsInfoButton: false,
                          buttonContent: '',
                          dropdownName: 'gender',
                          validatorWarning: 'Harap pilih jenis kelamin',
                          hintContents: 'Pilih Jenis Kelamin',
                          dropdownValue: dropdownValue,
                          dropdownContents: genderOptions,
                          dropdownKey: 'Jenis Kelamin',
                        ),
                        SizedBox(height: 40,), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            ForwardButtons(
                              onPressed: () => getItemAndNavigate(context)
                            ),
                          ],
                        ),
                        SizedBox(height: 50,), 
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        );
      },
    );
  }
}
