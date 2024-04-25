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
  late String name;
  late String dob;
  late String passport;
  late String idNumber;
  late String gender;

  Future<(String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String nameString = prefs.getString('Nama Lengkap') ?? '';
    String dobString = prefs.getString('Tanggal Lahir') ??'';
    String passportString = prefs.getString('Nomor Paspor') ?? '';
    String idNumberString = prefs.getString('NIK') ?? '';
    String genderString = prefs.getString('Jenis Kelamin') ?? '';

    setState(() {
      name = nameString;
      dob = dobString;
      passport = passportString;
      idNumber = idNumberString;
      gender = genderString;
    });

    return(name, dob, passport, idNumber, gender);
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
                      SizedBox(height: 20,),
                      Text(name),
                      SizedBox(height: 30,),
                      Text(dob),
                      SizedBox(height: 30,),
                      Text(passport),
                      SizedBox(height: 30,),
                      Text(idNumber),
                      SizedBox(height: 30,),
                      Text(gender),
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