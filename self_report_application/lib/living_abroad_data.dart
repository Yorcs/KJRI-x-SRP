// import 'package:flutter/material.dart';
// import 'package:self_report_application/header.dart';
// import 'package:self_report_application/form_container.dart';
// import 'package:self_report_application/living_abroad_data_continue.dart';
// import 'package:self_report_application/styling.dart';

// //Living Abroad First Page
// class LivingAbroadDataPage extends StatelessWidget {
//   const LivingAbroadDataPage({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.gender});
//   final String name;
//   final String idNumber;
//   final String dob;
//   final String passport;
//   final String gender;
  
//   @override
//   Widget build(BuildContext context) {
//     return LivingAbroadDataForm(
//       name: name,
//       idNumber: idNumber,
//       dob: dob,
//       passport: passport,
//       gender: gender,
//     );
//   }
// }

// class LivingAbroadDataForm extends StatefulWidget {
//   const LivingAbroadDataForm({super.key, required this.name, required this.idNumber, required this.dob, required this.passport, required this.gender});

//   final String name;
//   final String idNumber;
//   final String dob;
//   final String passport;
//   final String gender;

//   @override
//   State<LivingAbroadDataForm> createState() => _LivingAbroadDataFormState();
// }

// class _LivingAbroadDataFormState extends State<LivingAbroadDataForm> {
//   final _livingAbroadDataKey = GlobalKey<FormState>();
//   final TextEditingController _address = TextEditingController();
//   final TextEditingController _country = TextEditingController();
//   final TextEditingController _postalCode = TextEditingController();

//   @override
//   void initState(){
//     super.initState();
//     _address.addListener(() {
//       final String text = _address.text;
//       _address.value = _address.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _country.addListener(() {
//       final String text = _country.text;
//       _country.value = _country.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _postalCode.addListener(() {
//       final String text = _postalCode.text;
//       _postalCode.value = _postalCode.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });
//   }

//   @override
//   void dispose(){
//     _address.dispose();
//     _country.dispose();
//     _postalCode.dispose();
//     super.dispose();
//   }


//   goBack(BuildContext context)=> Navigator.pop(context);

//     getItemAndNavigate (BuildContext context) async {
//     await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => LivingAbroadDataContinuePage(
//           name: widget.name,
//           passport: widget.passport,
//           idNumber: widget.idNumber,
//           dob: widget.dob, 
//           gender: widget.gender,
//           addressAbroad: _address.toString(),
//           country: _country.toString(),
//           postalCode: _postalCode.toString(),      
//         )
//       )
//     );
//   }

//   String? provinceDropdownValue;
//   String? cityDropdownValue;

//   var provinces = [
//     'Alberta',
//     'British Columbia',
//   ];

//   var cities = [
//     'Burnaby',
//     'Coquitlam',
//     'Surrey',
//   ];

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
//                 key: _livingAbroadDataKey,
//                 child:ListView(
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
//                         labels: 'Alamat Lengkap di Luar Negeri',
//                         needsInfoButton: false,
//                         isDataRequired: AutovalidateMode.always,
//                         hintContents: '',
//                         buttonContent: '',
//                         valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'), 
//                         controller: _address,                   
//                         ),
//                         SizedBox(height: 30,),
//                         FormContainer(
//                           labels: 'Negara',
//                           needsInfoButton: false,
//                           isDataRequired: AutovalidateMode.always,
//                           hintContents: 'Kanada',
//                           buttonContent: '',
//                           valueConstraints: RegExp(r'^[a-z A-Z]+$'),  
//                           controller: _country,                  
//                         ),
//                         SizedBox(height: 30,),
//                         Text(
//                           'Propinsi',
//                           style: TextStyling.regularTextStyle,
//                         ),
//                         DropdownButton(
//                           value: provinceDropdownValue,
//                           hint: Text('Pilih Propinsi'),
//                           items: provinces.map((String items) {
//                             return DropdownMenuItem(value: items, child: Text(items));
//                           }).toList(),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               provinceDropdownValue = newValue!;
//                             });
//                           },
//                         ),
//                         SizedBox(height: 30,),
//                         Text(
//                           'Kota',
//                           style: TextStyling.regularTextStyle,
//                         ),
//                         DropdownButton(
//                           value: cityDropdownValue,
//                           hint: Text('Pilih Kota'),
//                           items: cities.map((String items) {
//                             return DropdownMenuItem(value: items, child: Text(items));
//                           }).toList(),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               cityDropdownValue = newValue!;
//                             });
//                           },
//                         ),
//                         SizedBox(height: 30,),
//                         FormContainer(
//                           labels: 'Kode Pos',
//                           needsInfoButton: false,
//                           isDataRequired: AutovalidateMode.always,
//                           hintContents: '',
//                           buttonContent: '',
//                           valueConstraints: RegExp(r'^[a-z A-Z 0-9]+$'),
//                           controller: _postalCode,                    
//                         ),
//                         //TODO: Adjust button position
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
//                                 if(_livingAbroadDataKey.currentState!.validate()){
//                                   getItemAndNavigate(context);
//                                 }
//                               }
//                             ),
//                           ],
//                         )                  
//                       ],
//                     ),
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
