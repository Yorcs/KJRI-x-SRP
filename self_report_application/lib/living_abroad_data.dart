import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/file_picker_container.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';
import 'package:self_report_application/overview.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_report_application/styling.dart';

//Living Abroad First Page
class LivingAbroadDataPage extends StatelessWidget {
  const LivingAbroadDataPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return LivingAbroadDataForm();
  }
}

class LivingAbroadDataForm extends StatefulWidget {
  const LivingAbroadDataForm({super.key});

  @override
  State<LivingAbroadDataForm> createState() => _LivingAbroadDataFormState();
}

class _LivingAbroadDataFormState extends State<LivingAbroadDataForm> {
  final _livingAbroadDataKey = GlobalKey<FormBuilderState>();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _canadianPhoneNumber = TextEditingController();
  final TextEditingController _proofOfStayingDoc = TextEditingController();
  final TextEditingController _proofOfStayingDocName = TextEditingController();
  String? provinceDropdownValue;

  List<String> provinces = [
    'Alberta',
    'British Columbia',
    'Yukon',
  ];

  PlatformFile? proofOfStayingDocFile;
  late String addressString;
  late String countryString;
  late String postalCodeString;
  late String provinceDropdownValueString;
  late String proofOfStayingDocString;
  late String proofOfStayingDocNameString;
  // late String canadianAreaCodeString;
  late String canadianPhoneNumberString;

  Future<(String, String, String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    addressString = prefs.getString('Alamat Lengkap di Luar Negeri') ?? '';
    countryString = prefs.getString('Negara') ?? 'Kanada';
    postalCodeString = prefs.getString('Kode Pos') ?? '';
    provinceDropdownValueString = prefs.getString('Provinsi') ?? '';
    proofOfStayingDocString = prefs.getString('Dokumen Bukti Tinggal') ?? '';
    proofOfStayingDocNameString = prefs.getString('Nama File Dokumen Bukti Tinggal') ?? '';
    canadianPhoneNumberString = prefs.getString('Nomor Telepon di Canada') ??'';

    setState(() {
      _address.text = addressString;
      _country.text = countryString;
      _postalCode.text = postalCodeString;
      provinceDropdownValue = provinceDropdownValueString;
      _proofOfStayingDoc.text = proofOfStayingDocString;
      _proofOfStayingDocName.text = proofOfStayingDocNameString;
      _canadianPhoneNumber.text = canadianPhoneNumberString;
    });

    return (addressString, countryString, postalCodeString, provinceDropdownValueString, proofOfStayingDocString, proofOfStayingDocNameString, canadianPhoneNumberString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Alamat Lengkap di Luar Negeri', _address.text);
    await prefs.setString('Negara', _country.text);
    await prefs.setString('Kode Pos', _postalCode.text);
    await prefs.setString('Dokumen Bukti Tinggal', _proofOfStayingDoc.text);
    await prefs.setString('Nama File Dokumen Bukti Tinggal', _proofOfStayingDocName.text);
    await prefs.setString('Nomor Telepon di Canada', _canadianPhoneNumber.text);
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _address.addListener(() {
      final String text = _address.text;
      _address.value = _address.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _country.addListener(() {
      final String text = _country.text;
      _country.value = _country.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _postalCode.addListener(() {
      final String text = _postalCode.text;
      _postalCode.value = _postalCode.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _proofOfStayingDoc.addListener(() {
      final String text = _proofOfStayingDoc.text;
      _proofOfStayingDoc.value = _proofOfStayingDoc.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _proofOfStayingDocName.addListener(() {
      final String text = _proofOfStayingDocName.text;
      _proofOfStayingDocName.value = _proofOfStayingDocName.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _address.dispose();
    _country.dispose();
    _postalCode.dispose();
    _proofOfStayingDoc.dispose();
    _proofOfStayingDocName.dispose();
    _canadianPhoneNumber.dispose();
    super.dispose();
  }


  goBack(BuildContext context)=> Navigator.pop(context);
  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _livingAbroadDataKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LivingAbroadDataContinuePage(
          proofOfStayingDocFile: proofOfStayingDocFile,
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
              key: _livingAbroadDataKey,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BuildHeader(
                  pageName: 'DATA LUAR NEGERI',
                  assetName: 'images/data-active.svg',
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30,),
                        FilePickerContainer(
                          labels: 'Dokumen Bukti Domisili',
                          buttonContent: 'Diunggah bukti tinggal dengan\ndokumen yang mencantumkan\nalamat domisili terkini seperti:\n\u2022 ID Card\n\u2022 Driver License\n\u2022 Rekening Bank\n\u2022 Kontrak Rumah\n\u2022 Tagihan Telepon\n\u2022 Pernyataan alamat dari kampus (Contoh: Confirmation of campus residence)\n\n\nTidak menerima file format HEIC',
                          fileController: _proofOfStayingDoc,
                          fileName: _proofOfStayingDocName,
                          fileType: proofOfStayingDocFile,
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                        labels: 'Alamat Lengkap di Luar Negeri',
                        needsInfoButton: false,
                        isDataRequired: AutovalidateMode.onUserInteraction,
                        hintContents: '',
                        buttonContent: '',
                        valueConstraints: r'^[a-z A-Z 0-9,.\-]+$', 
                        controller: _address, 
                        requiredDataChecker: true,
                        manualErrorText: 'Tolong periksa ulang alamat anda',                   
                        ),
                        SizedBox(height: 30,),
                        DisabledFormContainer(
                          labels: 'Negara',
                          needsInfoButton: false,
                          buttonContent: '', 
                          controller: _country,              
                        ),
                        SizedBox(height: 30,),
                        DropdownContainer(
                          labels: 'Propinsi',
                          needsInfoButton: false,
                          buttonContent: '',
                          dropdownName: 'province',
                          validatorWarning: 'Please select a province',
                          hintContents: 'Pilih Propinsi',
                          dropdownValue: provinceDropdownValue,
                          dropdownContents: provinces,
                          dropdownKey: 'Provinsi',
                        ),
                        SizedBox(height: 30,),
                        FormContainer(
                          labels: 'Kode Pos',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: '',
                          valueConstraints: r'^[A-Z 0-9]+$',
                          controller: _postalCode,   
                          requiredDataChecker: true, 
                          manualErrorText: 'Tolong periksa ulang kode pos',                
                        ),
                        SizedBox(height: 30,),
                      //  FormContainerWithDisabledText(
                      //     labels: 'Telepon',
                      //     needsInfoButton: false,
                      //     isDataRequired: AutovalidateMode.onUserInteraction,
                      //     hintContents: '',
                      //     buttonContent: '',
                      //     valueConstraints: r"^[0-9]+$",
                      //     requiredDataChecker: true,
                      //     areaCode: '+62',     
                      //     controller: _canadianPhoneNumber,   
                      //     manualErrorText: 'Tolong periksa ulang nomor telepon',           
                      //   ),
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
                  )                  
                ],
              ),
            ),
          )
        );
      },
    );
  }
}
