import 'package:flutter/material.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';

// Goal of staying page
class GoalOfStayingPage extends StatelessWidget { 
  const GoalOfStayingPage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.gender, required this.visaNumber, required this.visaStartDate, required this.visaEndDate, required this.proofOfStayingDoc});
  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String gender;
  final String addressAbroad;
  final String country;
  final String postalCode;
  final String visaNumber;
  final String visaStartDate;
  final String visaEndDate;
  final String proofOfStayingDoc;

  @override
  Widget build(BuildContext context) {
    return GoalOfStayingForm(
      name: name,
      idNumber: idNumber,
      dob: dob,
      passport: passport,
      gender: gender,
      addressAbroad: addressAbroad,
      country: country,
      postalCode: postalCode,
      visaNumber: visaNumber,
      visaEndDate: visaEndDate,
      visaStartDate: visaStartDate,
      proofOfStayingDoc: proofOfStayingDoc,
    );
  }
}

class GoalOfStayingForm extends StatefulWidget {
  const GoalOfStayingForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.gender, required this.addressAbroad, required this.country, required this.postalCode, required this.visaNumber, required this.visaStartDate, required this.visaEndDate, required this.proofOfStayingDoc});

  final String name;
  final String idNumber;
  final String dob;
  final String passport;
  final String gender;
  final String addressAbroad;
  final String country;
  final String postalCode;
  final String visaNumber;
  final String visaStartDate;
  final String visaEndDate;
  final String proofOfStayingDoc;


  @override
  State<GoalOfStayingForm> createState() => _GoalOfStayingFormState();
}

class _GoalOfStayingFormState extends State<GoalOfStayingForm> {
  final goalOfStayingKey = GlobalKey<FormState>();
  final TextEditingController _descriptionOrAddress = TextEditingController();

  @override
  void initState(){
    super.initState();
    _descriptionOrAddress.addListener(() {
      final String text = _descriptionOrAddress.text;
      _descriptionOrAddress.value = _descriptionOrAddress.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _descriptionOrAddress.dispose();
    super.dispose();
  }
  

  String? goalOfStayingDropdownValue;

  var goals =[
    'Lain-lain',
    'Mendampingi Suami/Istri',
    'Anggota Keluarga/ Pengikut',
    'Bekerja',
    'Belajar',
    'Magang',
  ];

  goBack(BuildContext context)=> Navigator.pop(context);

  getItemAndNavigate (BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoalOfStayingPage(
          name: widget.name,
          passport: widget.passport,
          idNumber: widget.idNumber,
          dob: widget.dob, 
          gender: widget.gender,
          addressAbroad: widget.addressAbroad,
          country: widget.country,
          postalCode: widget.postalCode,
          visaNumber: widget.visaNumber,
          visaStartDate: widget.visaStartDate,
          visaEndDate:widget.visaEndDate,
          proofOfStayingDoc: widget.proofOfStayingDoc,
        )
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          //TODO: Readjust margin and padding
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Form(
                key: goalOfStayingKey,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        BuildHeader(
                          pageName: 'Tujuan Menetap',
                          opacity1: 0.5,
                          opacity2: 0.5,
                          opacity3: 1,
                          opacity4: 0.5,
                          changeColor1: Colors.blue,
                          changeColor2: Colors.blue,
                          changeColor3: Colors.white,
                          changeColor4: Colors.blue,
                        ),
                        SizedBox(height: 30,),
                        Text(
                          'Tujuan Menetap',
                          style: TextStyling.regularTextStyle,
                        ),
                        DropdownButton(
                          value: goalOfStayingDropdownValue,
                          items: goals.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              goalOfStayingDropdownValue = newValue!;
                            });
                          },
                        ),
                        if (goalOfStayingDropdownValue.toString() =='Mendampingi Suami/Istri' || goalOfStayingDropdownValue == 'Anggota Keluarga/ Pengikut') ... [
                          FormContainer(
                            labels: 'Keterangan',
                            needsInfoButton: false,
                            isDataRequired: true,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                            controller: _descriptionOrAddress,                 
                          ),
                        ] else if (goalOfStayingDropdownValue.toString() == 'Lain-lain') ... [
                          FormContainer(
                            labels: 'Sebutkan: Kunjungan Keluarga, Au pair, dll',
                            needsInfoButton: false,
                            isDataRequired: true,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                            controller: _descriptionOrAddress,                 
                          ),
                        ] else if(goalOfStayingDropdownValue.toString() == 'Bekerja') ...[
                          Text(
                            'Bidang Kerja',
                            style: TextStyling.regularTextStyle,
                          ),
                        // TODO: Change placeholder
                          DropdownButton(
                            value: goalOfStayingDropdownValue,
                            items: goals.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                goalOfStayingDropdownValue = newValue!;
                              });
                            },
                          ),
                        Text(
                          'Pekerjaan',
                          style: TextStyling.regularTextStyle,
                        ),
                        // TODO: Change placeholder
                        DropdownButton(
                          value: goalOfStayingDropdownValue,
                          items: goals.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              goalOfStayingDropdownValue = newValue!;
                            });
                          },
                        ),
                          FormContainer(
                            labels: 'Nama Perusahaan / Pengguna Jasa',
                            needsInfoButton: false,
                            isDataRequired: true,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                            controller: _descriptionOrAddress,                 
                          ),
                          FormContainer(
                            labels: 'Alamat pekerjaan di Luar negeri',
                            needsInfoButton: false,
                            isDataRequired: true,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                            controller: _descriptionOrAddress,                 
                          ),
                          FormContainer(
                            labels: 'Perusahaan Penyalur / Penempatan',
                            needsInfoButton: false,
                            isDataRequired: true,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                            controller: _descriptionOrAddress,                 
                          ),
                          FormContainer(
                            labels: 'Agen Penyalur di Luar Negeri',
                            needsInfoButton: false,
                            isDataRequired: true,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                            controller: _descriptionOrAddress,                 
                          ),

                        ] else if(goalOfStayingDropdownValue.toString() == 'Belajar') ... [

                        ] else if (goalOfStayingDropdownValue.toString() == 'Magang') ... [
                            Text(
                              'Bidang Kerja',
                              style: TextStyling.regularTextStyle,
                            ),
                            // TODO: Change placeholder
                            DropdownButton(
                              value: goalOfStayingDropdownValue,
                              items: goals.map((String items) {
                                return DropdownMenuItem(value: items, child: Text(items));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  goalOfStayingDropdownValue = newValue!;
                                });
                              },
                            ),
                            Text(
                              'Pekerjaan',
                              style: TextStyling.regularTextStyle,
                            ),
                            // TODO: Change placeholder
                            DropdownButton(
                              value: goalOfStayingDropdownValue,
                              items: goals.map((String items) {
                                return DropdownMenuItem(value: items, child: Text(items));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  goalOfStayingDropdownValue = newValue!;
                                });
                              },
                            ),
                            FormContainer(
                              labels: 'Nama Perusahaan / Pengguna Jasa',
                              needsInfoButton: false,
                              isDataRequired: true,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                              controller: _descriptionOrAddress,                 
                            ),
                            FormContainer(
                              labels: 'Alamat pekerjaan di Luar neegri',
                              needsInfoButton: false,
                              isDataRequired: true,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
                              controller: _descriptionOrAddress,                 
                            ),
                        ]
                      ]
                    )
                  ]
                )
              )
            )
          )
        );
      }
    );
  }
}