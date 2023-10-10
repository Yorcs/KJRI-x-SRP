// import 'package:flutter/material.dart';
// import 'package:self_report_application/file_picker_container.dart';
// import 'package:self_report_application/form_container.dart';
// import 'package:self_report_application/goal_of_staying.dart';
// import 'package:self_report_application/header.dart';

// //Living Abroad cont. Page
// class LivingAbroadDataContinuePage extends StatelessWidget {
//   const LivingAbroadDataContinuePage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.gender});
//   final String name;
//   final String idNumber;
//   final String dob;
//   final String passport;
//   final String gender;
//   final String addressAbroad;
//   final String country;
//   final String postalCode;

//   @override
//   Widget build(BuildContext context) {
//     return LivingAbroadDataContinueForm(
//       name: name,
//       idNumber: idNumber,
//       dob: dob,
//       passport: passport,
//       gender: gender,
//       addressAbroad: addressAbroad,
//       country: country,
//       postalCode: postalCode,
//     );
//   }
// }

// class LivingAbroadDataContinueForm extends StatefulWidget {
//   const LivingAbroadDataContinueForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.gender});

//   final String name;
//   final String idNumber;
//   final String dob;
//   final String passport;
//   final String gender;
//   final String addressAbroad;
//   final String country;
//   final String postalCode;

//   @override
//   State<LivingAbroadDataContinueForm> createState() => _LivingAbroadDataContinueFormState();
// }

// class _LivingAbroadDataContinueFormState extends State<LivingAbroadDataContinueForm> {
//   final _livingAbroadDataContinueKey = GlobalKey<FormState>();
//   final TextEditingController _visaNumber = TextEditingController();
//   final TextEditingController _visaStartDate = TextEditingController();
//   final TextEditingController _visaEndDate = TextEditingController();
//   final TextEditingController _proofOfStayingDoc = TextEditingController();
//   final TextEditingController _permitToStayDoc = TextEditingController();

//   @override
//   void initState(){
//     super.initState();
//     _visaNumber.addListener(() {
//       final String text = _visaNumber.text;
//       _visaNumber.value = _visaNumber.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _visaStartDate.addListener(() {
//       final String text = _visaStartDate.text;
//       _visaStartDate.value = _visaStartDate.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _visaEndDate.addListener(() {
//       final String text = _visaEndDate.text;
//       _visaEndDate.value = _visaEndDate.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _proofOfStayingDoc.addListener(() {
//       final String text = _proofOfStayingDoc.text;
//       _proofOfStayingDoc.value = _proofOfStayingDoc.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _permitToStayDoc.addListener(() {
//       final String text = _permitToStayDoc.text;
//       _permitToStayDoc.value = _permitToStayDoc.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });
//   }

//   @override
//   void dispose(){
//     _visaNumber.dispose();
//     _visaStartDate.dispose();
//     _visaEndDate.dispose();
//     _proofOfStayingDoc.dispose();
//     _permitToStayDoc.dispose();
//     super.dispose();
//   }

//   goBack(BuildContext context)=> Navigator.pop(context, widget.addressAbroad);

//   getItemAndNavigate (BuildContext context) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => GoalOfStayingPage(
//           name: widget.name,
//           passport: widget.passport,
//           idNumber: widget.idNumber,
//           dob: widget.dob, 
//           gender: widget.gender,
//           addressAbroad: widget.addressAbroad,
//           country: widget.country,
//           postalCode: widget.postalCode,
//           visaNumber: _visaNumber.toString(),
//           visaStartDate: _visaStartDate.toString(),
//           visaEndDate: _visaEndDate.toString(),
//           proofOfStayingDoc: _proofOfStayingDoc.toString(),
//         )
//       )
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           //TODO: Readjust margin and padding
//           body: Center(
//             child: Container(
//               margin: const EdgeInsets.all(10.0),
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: Form(
//                 key: _livingAbroadDataContinueKey,
//                 child: ListView(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [ 
//                         BuildHeader(
//                         pageName: 'Data di Luar negeri',
//                         opacity1: 0.5,
//                         opacity2: 1,
//                         opacity3: 0.5,
//                         opacity4: 0.5,
//                         changeColor1: Colors.blue,
//                         changeColor2: Colors.white,
//                         changeColor3: Colors.blue,
//                         changeColor4: Colors.blue,
//                         ),
//                         SizedBox(height: 30,),
//                         FormContainer(
//                         labels: 'Nomor Visa',
//                         needsInfoButton: true,
//                         isDataRequired: AutovalidateMode.always,
//                         hintContents: '',
//                         buttonContent: 'Diisi dengan nomor yang ada di:\n\u2022Study Permit\n\u2022Work Permit\n\u2022Kartu PR',
//                         valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
//                         controller: _visaNumber,                 
//                         ),
//                         FilePickerContainer(
//                           labels: 'Dokumen Bukti Tinggal',
//                           buttonContent: 'Diunggah bukti tinggal dengan\ndokumen yang mencantumkan\nalamat domisili terkini seperti:\n\u2022ID Card\n\u2022Driver License\n\u2022Rekening Bank\n\u2022Kontrak Rumah\n\u2022Tagihan Telepon\n\u2022Pernyataan alamat dari kampus (Contoh: Confirmation of campus residence)\n\n\nTidak menerima file format HEIC',
//                           controller: _proofOfStayingDoc,
//                         ),
//                         FilePickerContainer(
//                           labels: 'Dokumen Visa = Ijin Tinggal',
//                           buttonContent: 'Diunggah dengan file format\nPDF/JPEG/JPG\n\nTidak menerima file format HEIC\n\nDiunggan halaman utama,\nmenghadap kedepan\n\nContoh:\n(INSERT IMAGE)\n\nDiterima: Study Permit, Work Permit,\natau PR Card',
//                           controller: _permitToStayDoc,
//                         ),
//                         FormContainerWithTwoInputs(
//                         labels: 'Masa Berlaku Visa',
//                         needsInfoButton: false,
//                         isDataRequired: AutovalidateMode.always,
//                         hintContents: '',
//                         buttonContent: '',
//                         valueConstraints: RegExp(r'^[a-z A-Z]+$'),   
//                         controller: _visaStartDate,
//                         controller2: _visaEndDate,                 
//                         ),
//                         Row(
//                           children: [
//                             ElevatedButton(
//                               child: const Text('Back'),
//                               onPressed: () => goBack(context),
//                             ),
//                             // TODO: Adjust button position
//                             ElevatedButton(
//                               child: const Text('Next'),
//                               onPressed: () {
//                                 // if(_livingAbroadDataContinueKey.currentState!.validate()){
//                                   getItemAndNavigate(context);
//                                 // }
//                               }
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ]
//                 ),
//               ),
//             ),
//           )
//         );
//       },
//     );
//   }
// }