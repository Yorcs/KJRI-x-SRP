import 'package:flutter/material.dart';
import 'package:self_report_application/components/header.dart';
import 'package:self_report_application/components/form_container.dart';
import 'package:self_report_application/page/overview.dart';
import 'package:self_report_application/styling.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Emergency Contact in Indonesia Page
class EmergencyContactIndoPage extends StatelessWidget {
  const EmergencyContactIndoPage({super.key});


  @override
  Widget build(BuildContext context) {
    return EmergencyContactIndoForm();
  }
}

class EmergencyContactIndoForm extends StatefulWidget {
  const EmergencyContactIndoForm({super.key});
  
  @override
  State<EmergencyContactIndoForm> createState() => _EmergencyContactIndoFormState();
}

class _EmergencyContactIndoFormState extends State<EmergencyContactIndoForm> {
  final _emergencyContactIndoKey = GlobalKey<FormBuilderState>();
  final TextEditingController _emergencyContactIndoName = TextEditingController();
  final TextEditingController _emergencyContactIndoEmail = TextEditingController();
  final TextEditingController _emergencyContactIndoPhone = TextEditingController();

  String? relationshipDropdownValue;

 List<String> relationship = [
    'Keluarga',
    'Rekan Kerja',
    'Istri/Suami',
    'Orang Tua',
    'Teman',
  ];

  late String emergencyContactIndoNameString;
  late String emergencyContactIndoEmailString;
  late String emergencyContactIndoPhoneString;
  late String relationshipDropdownValueString;

  Future<(String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    emergencyContactIndoNameString = prefs.getString('Nama Kontak Darurat di Indonesia') ?? '';
    emergencyContactIndoEmailString = prefs.getString('Email Kontak Darurat di Indonesia') ??'';
    emergencyContactIndoPhoneString = prefs.getString('Telepon Kontak Darurat di Indonesia') ?? '';
    relationshipDropdownValueString = prefs.getString('Hubungan Kontak Darurat di Indonesia') ?? '';

    setState(() {
      _emergencyContactIndoName.text = emergencyContactIndoNameString;
      _emergencyContactIndoEmail.text = emergencyContactIndoEmailString;
      _emergencyContactIndoPhone.text = emergencyContactIndoPhoneString;
      relationshipDropdownValue = relationshipDropdownValueString;
    });

    return (emergencyContactIndoNameString, emergencyContactIndoEmailString, emergencyContactIndoPhoneString, relationshipDropdownValueString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Nama Kontak Darurat di Indonesia', _emergencyContactIndoName.text);
    await prefs.setString('Email Kontak Darurat di Indonesia', _emergencyContactIndoEmail.text);
    await prefs.setString('Telepon Kontak Darurat di Indonesia', _emergencyContactIndoPhone.text);
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _emergencyContactIndoName.addListener(() {
      final String text = _emergencyContactIndoName.text;
      _emergencyContactIndoName.value = _emergencyContactIndoName.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _emergencyContactIndoEmail.addListener(() {
      final String text = _emergencyContactIndoEmail.text;
      _emergencyContactIndoEmail.value = _emergencyContactIndoEmail.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _emergencyContactIndoPhone.addListener(() {
      final String text = _emergencyContactIndoPhone.text;
      _emergencyContactIndoPhone.value = _emergencyContactIndoPhone.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _emergencyContactIndoEmail.dispose();
    _emergencyContactIndoName.dispose();
    _emergencyContactIndoPhone.dispose();
    super.dispose();
  }

  goBack(BuildContext context)=> Navigator.pop(context);

  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _emergencyContactIndoKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OverviewPage(
          emergencyContactIndoEmailSt: _emergencyContactIndoEmail.text,
          emergencyContactIndoPhoneSt: _emergencyContactIndoPhone.text,
        )
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
              key: _emergencyContactIndoKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BuildHeader(
                  pageName: 'KONTAK DARURAT',
                  assetName: 'images/kontak-active.svg',
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30,),
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
                        SizedBox(height: 30,),
                        FormContainer(
                        labels: 'Nama',
                        needsInfoButton: false,
                        isDataRequired: AutovalidateMode.onUserInteraction,
                        hintContents: '',
                        buttonContent: '',
                        valueConstraints: r"^[a-z A-Z',.\-]+$",
                        requiredDataChecker: true,
                        controller: _emergencyContactIndoName, 
                        manualErrorText: 'Harap mengisi nama kontak darurat anda di Indonesia',                 
                        ),
                        SizedBox(height: 30,),
                        DropdownContainer(
                          labels: 'Hubungan',
                          needsInfoButton: false,
                          buttonContent: '',
                          dropdownName: 'relationshipIndo',
                          validatorWarning: 'Harap mengisi hubungan anda dengan kontak darurat',
                          hintContents: 'Pilih Hubungan',
                          dropdownValue: relationshipDropdownValue,
                          dropdownContents: relationship,
                          dropdownKey: 'Hubungan Kontak Darurat di Indonesia',
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                          labels: 'Email',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: r"^[a-zA-Z0-9'@,.\-]+$", 
                          requiredDataChecker: true, 
                          controller: _emergencyContactIndoEmail,  
                          manualErrorText: 'Harap mengisi email kontak darurat di Indonesia',                  
                        ),
                        SizedBox(height: 30,),
                        FormContainerWithDisabledText(
                          labels: 'Telepon',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: r"^[0-9]+$",
                          requiredDataChecker: true,
                          areaCode: '+62',     
                          controller: _emergencyContactIndoPhone,   
                          manualErrorText: 'Harap mengisi nomor telepon kontak darurat di Indonesia',           
                        ),
                        SizedBox(height: 40,), 
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackButtons(
                              onPressed: () => goBack(context),
                            ),
                            ForwardButtons(
                              enableButton: true,
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
