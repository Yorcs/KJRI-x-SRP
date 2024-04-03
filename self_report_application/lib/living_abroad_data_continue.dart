import 'package:flutter/material.dart';
import 'package:self_report_application/file_picker_container.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/goal_of_staying.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Living Abroad cont. Page
class LivingAbroadDataContinuePage extends StatelessWidget {
  const LivingAbroadDataContinuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LivingAbroadDataContinueForm();
  }
}

class LivingAbroadDataContinueForm extends StatefulWidget {
  const LivingAbroadDataContinueForm({super.key});

  @override
  State<LivingAbroadDataContinueForm> createState() => _LivingAbroadDataContinueFormState();
}

class _LivingAbroadDataContinueFormState extends State<LivingAbroadDataContinueForm> {
  final _livingAbroadDataContinueKey = GlobalKey<FormBuilderState>();
  final TextEditingController _visaNumber = TextEditingController();
  final TextEditingController _visaStartDate = TextEditingController();
  final TextEditingController _visaEndDate = TextEditingController();
  final TextEditingController _proofOfStayingDoc = TextEditingController();
  final TextEditingController _permitToStayDoc = TextEditingController();
  final TextEditingController _dateOfArrival = TextEditingController();
  final TextEditingController _lengthOfStayYear = TextEditingController();
  final TextEditingController _lengthOfStayMonth = TextEditingController();

  late String visaNumberString;
  late String visaStartDateString;
  late String visaEndDateString;
  late String proofOfStayingDocString;
  late String permitToStayString;
  late String dateOfArrivalString;
  late String lengthOfStayYearString;
  late String lengthOfStayMonthString;
  
  Future<(String, String, String, String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    visaNumberString = prefs.getString('Nomor Visa') ?? '';
    visaEndDateString = prefs.getString('Expired Visa') ??'';
    visaStartDateString = prefs.getString('Start Visa') ?? '';
    proofOfStayingDocString = prefs.getString('Dokumen Bukti Tinggal') ?? '';
    permitToStayString = prefs.getString('Ijin Tinggal') ?? '';
    dateOfArrivalString = prefs.getString('Waktu Kedatangan') ?? '';
    lengthOfStayYearString = prefs.getString('Perkiraan Lama Menetap (Tahun)') ?? '';
    lengthOfStayMonthString = prefs.getString('Perkiraan Lama Menetap (Bulan)') ?? '';

    setState(() {
      _visaNumber.text = visaNumberString;
      _visaStartDate.text = visaStartDateString;
      _visaEndDate.text = visaEndDateString;
      _proofOfStayingDoc.text = proofOfStayingDocString;
      _permitToStayDoc.text = permitToStayString;
      _dateOfArrival.text = dateOfArrivalString;
      _lengthOfStayYear.text = lengthOfStayYearString;
      _lengthOfStayMonth.text = lengthOfStayMonthString;
    });

    return (visaNumberString, visaStartDateString, visaEndDateString, proofOfStayingDocString, permitToStayString, dateOfArrivalString, lengthOfStayYearString, lengthOfStayMonthString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Nomor Visa', _visaNumber.text);
    await prefs.setString('Expired Visa', _visaStartDate.text);
    await prefs.setString('Start Visa', _visaEndDate.text);
    await prefs.setString('Dokumen Bukti Tinggal', _proofOfStayingDoc.text);
    await prefs.setString('Ijin Tinggal', _permitToStayDoc.text);
    await prefs.setString('Waktu Kedatangan', _dateOfArrival.text);
    await prefs.setString('Perkiraan Lama Menetap (Tahun)', _lengthOfStayYear.text);
    await prefs.setString('Perkiraan Lama Menetap (Bulan)', _lengthOfStayMonth.text);
  }


  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _visaNumber.addListener(() {
      final String text = _visaNumber.text;
      _visaNumber.value = _visaNumber.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _visaStartDate.addListener(() {
      final String text = _visaStartDate.text;
      _visaStartDate.value = _visaStartDate.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _visaEndDate.addListener(() {
      final String text = _visaEndDate.text;
      _visaEndDate.value = _visaEndDate.value.copyWith(
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

    _permitToStayDoc.addListener(() {
      final String text = _permitToStayDoc.text;
      _permitToStayDoc.value = _permitToStayDoc.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _dateOfArrival.addListener(() {
      final String text = _dateOfArrival.text;
      _dateOfArrival.value = _dateOfArrival.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _lengthOfStayYear.addListener(() {
      final String text = _lengthOfStayYear.text;
      _lengthOfStayYear.value = _lengthOfStayYear.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _lengthOfStayMonth.addListener(() {
      final String text = _lengthOfStayMonth.text;
      _lengthOfStayMonth.value = _lengthOfStayMonth.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _visaNumber.dispose();
    _visaStartDate.dispose();
    _visaEndDate.dispose();
    _proofOfStayingDoc.dispose();
    _permitToStayDoc.dispose();
    _dateOfArrival.dispose();
    _lengthOfStayYear.dispose();
    _lengthOfStayMonth.dispose();
    super.dispose();
  }

  goBack(BuildContext context)=> Navigator.pop(context);

  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _livingAbroadDataContinueKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
      builder: (context) => GoalOfStayingPage()
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
              key: _livingAbroadDataContinueKey,
              child: Column(
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
                        FormContainer(
                          labels: 'Nomor Visa',
                          needsInfoButton: true,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: 'Diisi dengan nomor yang ada di:\n\u2022Study Permit\n\u2022Work Permit\n\u2022Kartu PR',
                          valueConstraints: r'^[a-z A-Z]+$', 
                          requiredDataChecker: true,  
                          controller: _visaNumber,                 
                        ),
                        FilePickerContainer(
                          labels: 'Dokumen Visa = Ijin Tinggal',
                          buttonContent: 'Diunggah dengan file format\nPDF/JPEG/JPG\n\nTidak menerima file format HEIC\n\nDiunggan halaman utama,\nmenghadap kedepan\n\nContoh:\n(INSERT IMAGE)\n\nDiterima: Study Permit, Work Permit,\natau PR Card',
                          controller: _permitToStayDoc,
                        ),
                        FormContainerWithTwoInputs(
                          labels: 'Masa Berlaku Visa',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: '',
                          firstDates: DateTime(1900-01-01),
                          lastDates: DateTime.now(),
                          firstDates2: DateTime.now(), 
                          lastDates2: DateTime(2099-01-01),
                          controller: _visaStartDate,
                          controller2: _visaEndDate,  
                          text1: "Dari",   
                          text2: "Sampai",            
                        ),
                        DateFormContainer(
                          labels: "Waktu Kedatangan", 
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: "",
                          needsInfoButton: false,
                          buttonContent: "",
                          controller: _dateOfArrival,
                          firstDates: DateTime(1900-01-01),
                          lastDates: DateTime.now(),
                        ),
                        FormContainerWithTwoInputs(
                          labels: 'Masa Berlaku Visa',
                          needsInfoButton: false,
                          isDataRequired: AutovalidateMode.onUserInteraction,
                          hintContents: '',
                          buttonContent: '',
                          firstDates: DateTime(1900-01-01),
                          lastDates: DateTime.now(),
                          firstDates2: DateTime.now(), 
                          lastDates2: DateTime(2099-01-01),
                          controller: _lengthOfStayYear,
                          controller2: _lengthOfStayMonth,  
                          text1: "Tahun",   
                          text2: "Bulan",            
                        ),
                        Row(
                          children: [
                            BackButtons(
                              onPressed: () => goBack(context),
                            ),
                            // TODO: Adjust button position
                            ForwardButtons(
                              onPressed: () => getItemAndNavigate(context)
                            ),
                          ],
                        ),
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