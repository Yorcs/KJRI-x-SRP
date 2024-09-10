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
  final TextEditingController _permitToStayDoc = TextEditingController();
  final TextEditingController _permitToStayDocName = TextEditingController();
  final TextEditingController _dateOfArrival = TextEditingController();

  late String visaNumberString;
  late String visaStartDateString;
  late String visaEndDateString;
  late String permitToStayString;
  late String permitToStayNameString;
  late String dateOfArrivalString;
  late String lengthOfStayYearString;
  late String lengthOfStayMonthString;

  String? lengthOfStayYear;
  String? lengthOfStayMonth;
  List<String> bulanTinggal =[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
  ];

  List<String> tahunTinggal =[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];
  
  //TODO: FIX DROPDOWN LENGTH OF STAY
  Future<(String, String, String, String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    visaNumberString = prefs.getString('Nomor Visa') ?? '';
    visaEndDateString = prefs.getString('Expired Visa') ??'';
    visaStartDateString = prefs.getString('Start Visa') ?? '';
    permitToStayString = prefs.getString('Ijin Tinggal') ?? '';
    permitToStayNameString = prefs.getString('Nama File Ijin Tinggal') ?? '';
    dateOfArrivalString = prefs.getString('Waktu Kedatangan') ?? '';
    lengthOfStayYearString = prefs.getString('Perkiraan Lama Menetap (Tahun)') ?? '';
    lengthOfStayMonthString = prefs.getString('Perkiraan Lama Menetap (Bulan)') ?? '';

    setState(() {
      _visaNumber.text = visaNumberString;
      _visaStartDate.text = visaStartDateString;
      _visaEndDate.text = visaEndDateString;
      _permitToStayDoc.text = permitToStayString;
      _permitToStayDocName.text = permitToStayNameString;
      _dateOfArrival.text = dateOfArrivalString;
      lengthOfStayYear = lengthOfStayYearString;
      lengthOfStayMonth = lengthOfStayMonthString;
    });

    return (visaNumberString, visaStartDateString, visaEndDateString, permitToStayString, permitToStayNameString, dateOfArrivalString, lengthOfStayYearString, lengthOfStayMonthString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Nomor Visa', _visaNumber.text);
    await prefs.setString('Expired Visa', _visaStartDate.text);
    await prefs.setString('Start Visa', _visaEndDate.text);
    await prefs.setString('Ijin Tinggal', _permitToStayDoc.text);
    await prefs.setString('Nama File Ijin Tinggal', _permitToStayDocName.text);
    await prefs.setString('Waktu Kedatangan', _dateOfArrival.text);
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

    _permitToStayDoc.addListener(() {
      final String text = _permitToStayDoc.text;
      _permitToStayDoc.value = _permitToStayDoc.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _permitToStayDocName.addListener(() {
      final String text = _permitToStayDocName.text;
      _permitToStayDocName.value = _permitToStayDocName.value.copyWith(
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
  }

  @override
  void dispose(){
    _visaNumber.dispose();
    _visaStartDate.dispose();
    _visaEndDate.dispose();
    _permitToStayDoc.dispose();
    _permitToStayDocName.dispose();
    _dateOfArrival.dispose();
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
                          buttonContent: 'Diisi dengan nomor yang ada di:\n\u2022 Study Permit\n\u2022 Work Permit\n\u2022 Kartu PR',
                          valueConstraints: r'^[A-Z0-9]+$', 
                          requiredDataChecker: true,  
                          controller: _visaNumber,
                          manualErrorText: 'Harap mengecek ulang format pengisian visa',                 
                        ),
                        SizedBox(height: 20,),
                        FilePickerContainer(
                          labels: 'Ijin Tinggal',
                          buttonContent: 'Diunggah dengan file format\nPNG/JPEG/JPG\n\nTidak menerima file format HEIC\n\nDiunggah halaman utama,\nmenghadap kedepan\n\nDiterima:\n\u2022 Study Permit\n\u2022 Work Permit\n\u2022 Kartu PR',
                          fileController: _permitToStayDoc,
                          fileName: _permitToStayDocName,
                        ),
                        SizedBox(height: 30,),
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
                        SizedBox(height: 30,),
                        FormContainerWithTwoInputs(
                          mainLabel: 'Masa Berlaku Visa',
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
                          labels1: 'Dari', 
                          labels2: 'Sampai', 
                          textStyle: 'header',          
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Perkiraan Lama Menetap',
                          style: TextStyling.regularBoldTextStyle,
                        ),
                          SizedBox(height: 5,),
                        DropdownContainer(
                          labels: 'Tahun',
                          needsInfoButton: false,
                          buttonContent: '',
                          dropdownName: 'Perkiraan Lama Menetap (Tahun)',
                          validatorWarning: 'Harap memilih perkiraan lama tahun menetap',
                          hintContents: '',
                          dropdownValue: lengthOfStayYear,
                          dropdownContents: tahunTinggal,
                          dropdownKey: 'Perkiraan Lama Menetap (Tahun)',
                        ), 
                        DropdownContainer(
                          labels: 'Bulan',
                          needsInfoButton: false,
                          buttonContent: '',
                          dropdownName: 'Perkiraan Lama Menetap (Bulan)',
                          validatorWarning: 'Harap memilih perkiraan lama bulan menetap',
                          hintContents: '',
                          dropdownValue: lengthOfStayMonth,
                          dropdownContents: bulanTinggal,
                          dropdownKey: 'Perkiraan Lama Menetap (Bulan)',
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