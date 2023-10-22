// import 'package:flutter/material.dart';
// import 'package:self_report_application/header.dart';
// import 'package:self_report_application/form_container.dart';
// import 'package:self_report_application/styling.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// //Emergency Contact in Indonesia Page
// class EmergencyContactIndoPage extends StatelessWidget {
//   const EmergencyContactIndoPage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.visaNumber, required this.visaStartDate, required this.visaEndDate, required this.emergencyContactAbroadName, required this.emergencyContactAbroadEmail, required this.emergencyContactAbroadPhone, required this.gender, required this.emergencyContactAbroadRelationship, required this.emergencyContactAbroadCity});
//   final String name;
//   final String idNumber;
//   final String dob;
//   final String passport;
//   final String gender;
//   final String addressAbroad;
//   final String country;
//   final String postalCode;
//   final String visaNumber;
//   final String visaStartDate;
//   final String visaEndDate;
//   final String emergencyContactAbroadName;
//   final String emergencyContactAbroadEmail;
//   final String emergencyContactAbroadPhone;
//   final String emergencyContactAbroadRelationship;
//   final String emergencyContactAbroadCity;

//   @override
//   Widget build(BuildContext context) {
//     return EmergencyContactIndoForm(
//       name: name,
//       idNumber: idNumber,
//       dob: dob,
//       passport: passport,
//       gender: gender,
//       addressAbroad: addressAbroad,
//       country: country,
//       postalCode: postalCode,
//       visaNumber: visaNumber,
//       visaStartDate: visaStartDate,
//       visaEndDate: visaEndDate,
//       emergencyContactAbroadName: emergencyContactAbroadName,
//       emergencyContactAbroadEmail: emergencyContactAbroadEmail,
//       emergencyContactAbroadPhone: emergencyContactAbroadPhone,
//       emergencyContactAbroadRelationship: emergencyContactAbroadRelationship,
//       emergencyContactAbroadCity: emergencyContactAbroadCity,
//     );
//   }
// }

// class EmergencyContactIndoForm extends StatefulWidget {
//   const EmergencyContactIndoForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.addressAbroad, required this.country, required this.postalCode, required this.visaNumber, required this.visaStartDate, required this.visaEndDate, required this.emergencyContactAbroadName, required this.emergencyContactAbroadEmail, required this.emergencyContactAbroadPhone, required this.gender, required this.emergencyContactAbroadRelationship, required this.emergencyContactAbroadCity});

//   final String name;
//   final String idNumber;
//   final String dob;
//   final String passport;
//   final String gender;
//   final String addressAbroad;
//   final String country;
//   final String postalCode;
//   final String visaNumber;
//   final String visaStartDate;
//   final String visaEndDate;
//   final String emergencyContactAbroadName;
//   final String emergencyContactAbroadEmail;
//   final String emergencyContactAbroadPhone;
//   final String emergencyContactAbroadRelationship;
//   final String emergencyContactAbroadCity;
  
//   @override
//   State<EmergencyContactIndoForm> createState() => _EmergencyContactIndoFormState();
// }

// class _EmergencyContactIndoFormState extends State<EmergencyContactIndoForm> {
//   final _emergencyContactIndoKey = GlobalKey<FormBuilderState>();
//   final TextEditingController _emergencyContactIndoName = TextEditingController();
//   final TextEditingController _emergencyContactIndoEmail = TextEditingController();
//   final TextEditingController _emergencyContactIndoPhone = TextEditingController();

//   String? relationshipDropdownValue;
//   String? cityDropdownValue;

//  List<String> relationship = [
//     'Keluarga',
//     'Rekan Kerja',
//     'Istri/Suami',
//     'Orang Tua',
//     'Teman',
//   ];

//   @override
//   void initState(){
//     super.initState();
//     _emergencyContactIndoName.addListener(() {
//       final String text = _emergencyContactIndoName.text;
//       _emergencyContactIndoName.value = _emergencyContactIndoName.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _emergencyContactIndoEmail.addListener(() {
//       final String text = _emergencyContactIndoEmail.text;
//       _emergencyContactIndoEmail.value = _emergencyContactIndoEmail.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _emergencyContactIndoPhone.addListener(() {
//       final String text = _emergencyContactIndoPhone.text;
//       _emergencyContactIndoPhone.value = _emergencyContactIndoPhone.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });
//   }

//   @override
//   void dispose(){
//     _emergencyContactIndoEmail.dispose();
//     _emergencyContactIndoName.dispose();
//     _emergencyContactIndoPhone.dispose();
//     super.dispose();
//   }

//   goBack(BuildContext context)=> Navigator.pop(context);

//   Future <void> getItemAndNavigate (BuildContext context) async {
//     final isValid = _emergencyContactIndoKey.currentState!.validate();
//     if(!isValid){
//     } else {
//       await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => EmergencyContactIndoPage(
//           name: widget.name,
//           passport: widget.passport,
//           idNumber: widget.idNumber,
//           dob: widget.dob, 
//           gender: widget.gender,
//           addressAbroad: widget.addressAbroad,
//           country: widget.country,
//           postalCode: widget.postalCode,
//           visaNumber: widget.visaNumber,
//           visaStartDate: widget.visaStartDate,
//           visaEndDate: widget.visaEndDate,
//           emergencyContactAbroadName: widget.emergencyContactAbroadName,
//           emergencyContactAbroadEmail: widget.emergencyContactAbroadEmail,
//           emergencyContactAbroadPhone: widget.emergencyContactAbroadPhone, 
//           emergencyContactAbroadRelationship: widget.emergencyContactAbroadRelationship,
//           emergencyContactAbroadCity: widget.emergencyContactAbroadCity,    
//         )
//       )
//     );
//   }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           //TODO: Readjust margin and padding
//           body: SingleChildScrollView(
//             child: Container(
//               margin: const EdgeInsets.all(10.0),
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: FormBuilder(
//                 key: _emergencyContactIndoKey,
//                 child:Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     BuildHeader(
//                     pageName: 'Kontak Darurat',
//                     opacity1: 0.5,
//                     opacity2: 0.5,
//                     opacity3: 0.5,
//                     opacity4: 1,
//                     changeColor1: Colors.blue,
//                     changeColor2: Colors.blue,
//                     changeColor3: Colors.blue,
//                     changeColor4: Colors.white,
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Text(
//                           'Di Indonesia',
//                           style: TextStyling.regularBoldTextStyle,
//                         ),
//                         InfoButton(
//                           contents: 'Informasi kontak sesuai surat-surat pemerintah'
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30,),
//                     FormContainer(
//                     labels: 'Nama',
//                     needsInfoButton: false,
//                     isDataRequired: AutovalidateMode.onUserInteraction,
//                     hintContents: '',
//                     buttonContent: '',
//                     valueConstraints: r'^[a-z A-Z]+$',  
//                     requiredDataChecker: true,
//                     controller: _emergencyContactIndoName,                  
//                     ),
//                     SizedBox(height: 30,),
//                     Text('Hubungan'),

//                     FormBuilderDropdown<String>(
//                       name: "relationship",
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: FormBuilderValidators.compose([
//                         (value){
//                           if(value ==null || value =='' || value.isEmpty){
//                             return 'Please select relationship'; //TODO: Change prompt
//                           }
//                           return null;
//                         }
//                       ]),
//                       onChanged: (String? newValue){
//                         setState((){
//                           relationshipDropdownValue = newValue!;
//                           }
//                         );
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Pilih Hubungan',
//                       ),
//                       items: relationship
//                       .map((relationship) => DropdownMenuItem(
//                         value: relationship,
//                         child: Text(relationship),
//                         )).toList()
//                     ),
                    
//                     SizedBox(height: 30,),
//                     //TODO: Change RegExp
//                     FormContainer(
//                       labels: 'Email',
//                       needsInfoButton: false,
//                       isDataRequired: AutovalidateMode.onUserInteraction,
//                       hintContents: '',
//                       buttonContent: '',
//                       valueConstraints: r'^[a-z A-Z 0-9]+$', 
//                       requiredDataChecker: true, 
//                       controller: _emergencyContactIndoEmail,                  
//                     ),
//                     SizedBox(height: 30,),
//                     //TODO: Change RegExp
//                     FormContainerWithDisabledText(
//                       labels: 'Telepon',
//                       needsInfoButton: false,
//                       isDataRequired: AutovalidateMode.onUserInteraction,
//                       hintContents: '',
//                       buttonContent: '',
//                       valueConstraints: r'^[0-9]+$',
//                       requiredDataChecker: true,
//                       areaCode: '+62',     
//                       controller: _emergencyContactIndoPhone,             
//                     ),
//                     //TODO: Adjust button position
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           child: const Text('Back'),
//                           onPressed: () => goBack(context)
//                         ),
//                         // TODO: Adjust button position
//                         // ElevatedButton(
//                         //   child: const Text('Next'),
//                         //   onPressed: () {
//                         //     Navigator.push(
//                         //       context,
//                         //       MaterialPageRoute(builder: (context) => const LivingAbroadDataContinuePage()),
//                         //     );
//                         //   },
//                         // ),
//                       ],
//                     )                  
//                   ],
//                 ),
//               ),
//             ),
//           )
//         );
//       },
//     );
//   }
// }
