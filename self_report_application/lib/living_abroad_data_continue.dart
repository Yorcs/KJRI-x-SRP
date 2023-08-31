// import 'package:flutter/material.dart';
// import 'package:self_report_application/living_abroad_data.dart';
// import 'package:self_report_application/styling.dart';

// //Requirements Page
// class LivingAbroadDataContinuePage extends StatelessWidget {
//   const LivingAbroadDataContinuePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LivingAbroadDataContinueForm();
//   }
// }

// class LivingAbroadDataContinueForm extends StatefulWidget {
//   @override
//   _LivingAbroadDataContinueFormState createState() => _LivingAbroadDataContinueFormState();
// }

// class _LivingAbroadDataContinueFormState extends State<LivingAbroadDataContinueForm> {
//   final LivingAbroadDataContinueKey = GlobalKey<FormState>();

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
//               child: Form(
//                 key: LivingAbroadDataContinueKey,
//                 child:Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextsForm(
//                       labels: 'Nomor Visa',
//                       requiredData: true,
//                       valueConstraints: RegExp(r'^[a-z A-Z]+$'), 
//                       needsInfo: true,
//                       hintContent: '',
//                       buttonContent: 'Diisi dengan nomor yang ada di: Study Permit, Work Permit, Kartu PR', //TODO: FIx spacing and alignmet of popup
//                       ),
//                     TextsForm(
//                       labels: 'Negara',
//                       requiredData: true,
//                       valueConstraints: RegExp(r'^[a-z A-Z]+$'), 
//                       needsInfo: false,
//                       hintContent: 'Kanada',
//                       buttonContent: '',
//                       ),
//                     Text('Propinsi'),
//                     DropdownButton(
//                       value: provinceDropdownValue,
//                       hint: Text('Pilih Propinsi'),
//                       items: provinces.map((String items) {
//                         return DropdownMenuItem(value: items, child: Text(items));
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           provinceDropdownValue = newValue!;
//                         });
//                       },
//                     ),
//                     Text('Jenis kelamin'),
//                     DropdownButton(
//                       value: provinceDropdownValue,
//                       hint: Text('Pilih Jenis Kelamin'),
//                       items: cities.map((String items) {
//                         return DropdownMenuItem(value: items, child: Text(items));
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           provinceDropdownValue = newValue!;
//                         });
//                       },
//                     ),
//                     TextsForm(
//                       labels: 'Kode Pos',
//                       requiredData: true,
//                       valueConstraints: RegExp(r'^[a-z A-Z]+$'), 
//                       needsInfo: false,
//                       hintContent: '',
//                       buttonContent: '',
//                       ),
//                     //TODO: Adjust button position
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           child: const Text('Back'),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const LivingAbroadDataPage()),
//                             );
//                           },
//                         ),
//                         //TODO: Adjust button position
//                         ElevatedButton(
//                           child: const Text('Next'),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const LivingAbroadDataPage()),
//                             );
//                           },
//                         ),
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