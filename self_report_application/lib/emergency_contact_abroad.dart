import 'package:flutter/material.dart';
import 'package:self_report_application/emergency_contact_indo.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Emergency Contact Abroad Page
class EmergencyContactAbroadPage extends StatelessWidget {
  const EmergencyContactAbroadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmergencyContactAbroadForm();
  }
}

class EmergencyContactAbroadForm extends StatefulWidget {
  const EmergencyContactAbroadForm({super.key});
  
  @override
  State<EmergencyContactAbroadForm> createState() => _EmergencyContactAbroadFormState();
}

class _EmergencyContactAbroadFormState extends State<EmergencyContactAbroadForm> {
  final _emergencyContactAbroadKey = GlobalKey<FormBuilderState>();
  final TextEditingController _emergencyContactAbroadName = TextEditingController();
  final TextEditingController _emergencyContactAbroadEmail = TextEditingController();
  final TextEditingController _emergencyContactAbroadPhone = TextEditingController();

  String? relationshipDropdownValue;

  List<String> relationship = [
    'Keluarga',
    'Rekan Kerja',
    'Istri/Suami',
    'Orang Tua',
    'Teman',
  ];

  late String emergencyContactAbroadNameString;
  late String emergencyContactAbroadEmailString;
  late String emergencyContactAbroadPhoneString;
  late String relationshipDropdownValueString;

  Future<(String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    emergencyContactAbroadNameString = prefs.getString('Nama Kontak Darurat di Luar Negeri') ?? '';
    emergencyContactAbroadEmailString = prefs.getString('Email Kontak Darurat di Luar Negeri') ??'';
    emergencyContactAbroadPhoneString = prefs.getString('Telepon Kontak Darurat di Luar Negeri') ?? '';
    relationshipDropdownValueString = prefs.getString('Hubungan Kontak Darurat di Luar Negeri') ?? '';

    setState(() {
      _emergencyContactAbroadName.text = emergencyContactAbroadNameString;
      _emergencyContactAbroadEmail.text = emergencyContactAbroadEmailString;
      _emergencyContactAbroadPhone.text = emergencyContactAbroadPhoneString;
      relationshipDropdownValue = relationshipDropdownValueString;
    });

    return (emergencyContactAbroadNameString, emergencyContactAbroadEmailString, emergencyContactAbroadPhoneString, relationshipDropdownValueString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Nama Kontak Darurat di Luar Negeri', _emergencyContactAbroadName.text);
    await prefs.setString('Email Kontak Darurat di Luar Negeri', _emergencyContactAbroadEmail.text);
    await prefs.setString('Telepon Kontak Darurat di Luar Negeri', _emergencyContactAbroadPhone.text);
    await prefs.setString('Hubungan Kontak Darurat di Luar Negeri', relationshipDropdownValue.toString()); 
  }
  

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _emergencyContactAbroadName.addListener(() {
      final String text = _emergencyContactAbroadName.text;
      _emergencyContactAbroadName.value = _emergencyContactAbroadName.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _emergencyContactAbroadEmail.addListener(() {
      final String text = _emergencyContactAbroadEmail.text;
      _emergencyContactAbroadEmail.value = _emergencyContactAbroadEmail.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _emergencyContactAbroadPhone.addListener(() {
      final String text = _emergencyContactAbroadPhone.text;
      _emergencyContactAbroadPhone.value = _emergencyContactAbroadPhone.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _emergencyContactAbroadName.dispose();
    _emergencyContactAbroadEmail.dispose();
    _emergencyContactAbroadPhone.dispose();
    super.dispose();
  }

  goBack(BuildContext context)=> Navigator.pop(context);

  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _emergencyContactAbroadKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmergencyContactIndoPage()
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
              key: _emergencyContactAbroadKey,
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
                        Text(
                          'Di Luar Negeri',
                          style: TextStyling.regularBoldTextStyle,
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
                        controller: _emergencyContactAbroadName, 
                        manualErrorText: 'Harap mengisi nama kontak darurat luar negeri anda',                   
                        ),
                        SizedBox(height: 30,),
                        DropdownContainer(
                          labels: 'Hubungan',
                          needsInfoButton: false,
                          buttonContent: '',
                          dropdownName: 'relationshipAbroad',
                          validatorWarning: 'Harap mengisi hubungan anda dengan kontak darurat',
                          hintContents: 'Pilih Hubungan',
                          dropdownValue: relationshipDropdownValue,
                          dropdownContents: relationship
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
                          controller: _emergencyContactAbroadEmail, 
                          manualErrorText: 'Harap mengisi email kontak darurat luar negeri',                 
                        ),
                        SizedBox(height: 30,),
                        FormContainerWithDisabledText(
                          labels: 'Telepon',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: r"^[0-9]+$",
                          areaCode: '+1',
                          controller: _emergencyContactAbroadPhone, 
                          requiredDataChecker: true,      
                          manualErrorText: 'Harap mengisi nomor telepon kontak darurat di luar negeri',           
                        ),
                        SizedBox(height: 40,), 
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackButtons(
                              onPressed: () => goBack(context),
                            ),
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
