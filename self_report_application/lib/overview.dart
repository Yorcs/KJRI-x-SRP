import 'package:flutter/material.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/living_abroad_data.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:self_report_application/styling.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Overview Page
class OverviewPage extends StatelessWidget {
 const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OverviewState();
  }
}

class OverviewState extends StatefulWidget {
  @override
  State<OverviewState> createState() => _OverviewFormState();
}

class _OverviewFormState extends State<OverviewState> {
  //Personal Data
  late String name;
  late String dob;
  late String passport;
  late String idNumber;
  late String gender;

  //Living Abroad Data
  late String address;
  late String country;
  late String postalCode;
  late String province;
  late String proofOfStayingDoc;
  late String proofOfStayingDocName;
  late String canadianAreaCode;
  late String canadianPhoneNumber;

  //Living Abroad Data Continued
  late String visaNumber;
  late String visaStartDate;
  late String visaEndDate;
  late String permitToStayDoc;
  late String permitToStayDocName;
  late String dateOfArrival;
  late String lengthOfStayMonth;
  late String lengthOfStayYear;

  //Goal of Staying

  //Emergency Contact Abroad

  //Emergency Contact Indonesia

  Future<(String, String, String, String, String,
   String, String, String, String, String, String, String, String,
   String, String, String, String, String, String, String, String)> getSharedPrefs() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //Personal data
    String nameString = prefs.getString('Nama Lengkap') ?? '';
    String dobString = prefs.getString('Tanggal Lahir') ??'';
    String passportString = prefs.getString('Nomor Paspor') ?? '';
    String idNumberString = prefs.getString('NIK') ?? '';
    String genderString = prefs.getString('Jenis Kelamin') ?? '';

    //Living abroad data
    String addressString = prefs.getString('Alamat Lengkap di Luar Negeri') ?? '';
    String countryString = prefs.getString('Negara') ?? 'Kanada';
    String postalCodeString = prefs.getString('Kode Pos') ?? '';
    String provinceDropdownValueString = prefs.getString('Provinsi') ?? '';
    String proofOfStayingDocString = prefs.getString('Dokumen Bukti Tinggal') ?? '';
    String proofOfStayingDocNameString = prefs.getString('Nama File Dokumen Bukti Tinggal') ?? '';
    String canadianAreaCodeString = prefs.getString('Nomor Area Canada') ??'';
    String canadianPhoneNumberString = prefs.getString('Nomor Telepon Canada') ??'';

    //Living abroad data continued
    String visaNumberString = prefs.getString('Nomor Visa') ?? '';
    String visaEndDateString = prefs.getString('Expired Visa') ??'';
    String visaStartDateString = prefs.getString('Start Visa') ?? '';
    String permitToStayString = prefs.getString('Ijin Tinggal') ?? '';
    String permitToStayNameString = prefs.getString('Nama File Ijin Tinggal') ?? '';
    String dateOfArrivalString = prefs.getString('Waktu Kedatangan') ?? '';
    String lengthOfStayYearString = prefs.getString('Perkiraan Lama Menetap (Tahun)') ?? '';
    String lengthOfStayMonthString = prefs.getString('Perkiraan Lama Menetap (Bulan)') ?? '';

    setState(() {
      //Personal data
      name = nameString;
      dob = dobString;
      passport = passportString;
      idNumber = idNumberString;
      gender = genderString;

      //Living abroad data
      address = addressString;
      country = countryString;
      postalCode = postalCodeString;
      province = provinceDropdownValueString;
      proofOfStayingDoc = proofOfStayingDocString;
      proofOfStayingDocName = proofOfStayingDocNameString;
      canadianAreaCode = canadianAreaCodeString;
      canadianPhoneNumber = canadianPhoneNumberString;

      //Living abroad data continue
      visaNumber = visaNumberString;
      visaStartDate = visaStartDateString;
      visaEndDate = visaEndDateString;
      permitToStayDoc = permitToStayString;
      permitToStayDocName = permitToStayNameString;
      dateOfArrival = dateOfArrivalString;
      lengthOfStayYear = lengthOfStayYearString;
      lengthOfStayMonth = lengthOfStayMonthString;
    });

    return(name, dob, passport, idNumber, gender,
     address, country, postalCode, province, proofOfStayingDoc, proofOfStayingDocName, canadianAreaCode, canadianPhoneNumber,
     visaNumber, visaStartDate, visaEndDate, permitToStayDoc, permitToStayDocName, dateOfArrival,lengthOfStayMonth, lengthOfStayYear);
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
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
                      SizedBox(height: 30,),

                      //Identity Section
                      Text(
                        'IDENTITAS',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Nama Lengkap', 
                        content: name,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'Tanggal Lahir', 
                        content: dob,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'Nomor Paspor', 
                        content: passport,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'NIK', 
                        content: idNumber,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'Jenis Kelamin', 
                        content: gender,
                      ),
                      SizedBox(height: 30,),

                      //Living Abroad Data & Living Abroad Data Continue
                      Text(
                        'DATA LUAR NEGERI',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Alamat Lengkap di Luar Negeri', 
                        content: address,
                      ),
                      SizedBox(height: 30,),
                      OverviewCombinedLabelWidget(
                        labelName1: 'Negara',
                        labelName2: 'Propinsi',
                        content1: country,
                        content2: province,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Kode Pos', 
                        content: postalCode,
                      ),                      
                      SizedBox(height: 30,),
                      OverviewLabelCombinedStringWidget(
                        labelName: 'Telepon', 
                        content1: canadianAreaCode,
                        content2: canadianPhoneNumber,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Dokumen Bukti Tinggal', 
                        content: proofOfStayingDocName,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Waktu Kedatangan', 
                        content: dateOfArrival,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Ijin Tinggal', 
                        content: permitToStayDocName,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Nomor Visa', 
                        content: proofOfStayingDocName,
                      ),
                      SizedBox(height: 30,),
                      OverviewHeaderLabelWidget(
                        headerLabelName: 'Masa Berlaku Visa', 
                        labelName1: 'Dari',
                        content1: visaStartDate,
                        labelName2: 'Sampai',
                        content2: visaEndDate,
                      ),
                      SizedBox(height: 30,),
                      OverviewHeaderLabelWidget(
                        headerLabelName: 'Perkiraan Lama Menetap', 
                        labelName1: 'Dari',
                        content1: visaStartDate,
                        labelName2: 'Sampai',
                        content2: visaEndDate,
                      ),
                      SizedBox(height: 30,),

                      //Goal of Staying
                      Text(
                        'TUJUAN MENETAP',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),

                      //Emergency Contact
                      Text(
                        'KONTAK DARURAT',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),
                      OverviewHeaderWidget(
                        headerLabelName: 'Di Luar Negeri'
                      ),
                      OverviewLabelWidget(
                        labelName: 'Nama', 
                        content: proofOfStayingDocName,
                      ),
                      SizedBox(height: 30,),
                    ]
                  )
                )
              ]
            )
          )
        );
      }
    );
  }
}