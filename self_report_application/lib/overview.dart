// import 'package:flutter/material.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:self_report_application/form_container.dart';
// import 'package:self_report_application/header.dart';
// import 'package:self_report_application/living_abroad_data.dart';
// import 'package:self_report_application/styling.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// //Overview Page
// class OverviewPage extends StatelessWidget {
//   const OverviewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return OverviewForm();
//   }
// }

// class OverviewForm extends StatefulWidget {
//   @override
//   State<OverviewForm> createState() => _OverviewFormState();
// }

// class _OverviewFormState extends State<OverviewForm> {
//   final _overviewKey = GlobalKey<FormBuilderState>();
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _dOB = TextEditingController();
//   final TextEditingController _passport = TextEditingController();
//   final TextEditingController _iDNumber = TextEditingController();
//   final TextEditingController _address = TextEditingController();
//   final TextEditingController _country = TextEditingController();
//   final TextEditingController _postalCode = TextEditingController();

//   late String nameString;
//   late String dobString;
//   late String passportString;
//   late String idNumberString;
//   late String addressString;
//   late String countryString;
//   late String postalCodeString;
//   late String provinceDropdownValueString;
//   late String cityDropdownValueString;

//   //dropdown
//   late String dropdownValueString;
//   late String provinceDropdownValue;
//   late String cityDropdownValue;

//   List<String> provinces = [
//     'Alberta',
//     'British Columbia',
//   ];

//   List<String>  cities = [
//     'Burnaby',
//     'Coquitlam',
//     'Surrey',
//   ];

//   Future<(String, String, String, String, String, String, String, String, String, String)> getSharedPrefs() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     nameString = prefs.getString('Nama Lengkap') ?? '';
//     dobString = prefs.getString('Tanggal Lahir') ??'';
//     passportString = prefs.getString('Nomor Paspor') ?? '';
//     idNumberString = prefs.getString('NIK') ?? '';
//     dropdownValueString = prefs.getString('Jenis Kelamin') ?? '';
//     addressString = prefs.getString('Alamat Lengkap di Luar Negeri') ?? '';
//     countryString = prefs.getString('Negara') ??'';
//     postalCodeString = prefs.getString('Kode Pos') ?? '';
//     provinceDropdownValueString = prefs.getString('Provinsi') ?? '';
//     cityDropdownValueString = prefs.getString('Kota') ?? '';

//     setState(() {
//       _name.text = nameString;
//       _dOB.text = dobString;
//       _passport.text = passportString;
//       _iDNumber.text = idNumberString;
//       dropdownValue = dropdownValueString;
//       _address.text = addressString;
//       _country.text = countryString;
//       _postalCode.text = postalCodeString;
//       provinceDropdownValue = provinceDropdownValueString;
//       cityDropdownValue = cityDropdownValueString;
//     });

//     return (nameString, dobString, passportString, idNumberString, dropdownValueString, addressString, countryString, postalCodeString, provinceDropdownValueString, cityDropdownValueString);
//   }


//   @override
//   void initState(){
//     super.initState();
//     getSharedPrefs();
//     _name.addListener(() {
//       final String text = _name.text.toString();
//       _name.value = _name.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _dOB.addListener(() {
//       final String text = _dOB.text;
//       _dOB.value = _dOB.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _passport.addListener(() {
//       final String text = _passport.text;
//       _passport.value = _passport.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _iDNumber.addListener(() {
//       final String text = _iDNumber.text;
//       _iDNumber.value = _iDNumber.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });
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
//     _name.dispose();
//     _dOB.dispose();
//     _passport.dispose();
//     _iDNumber.dispose();
//     _address.dispose();
//     _country.dispose();
//     _postalCode.dispose();
//     super.dispose();
//   }

//   late String dropdownValue;
//   List<String> genderOptions = [
//     'Laki-laki',
//     'Perempuan',
//   ];

//   Future <void> getItemAndNavigate (BuildContext context) async {
//     final isValid = _overviewKey.currentState!.validate();
//     if(!isValid){
//     } else {
//       await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => LivingAbroadDataPage()
//       )
//     );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: Container(
//               margin: const EdgeInsets.all(10.0),
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: FormBuilder(
//                 key: _overviewKey,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child:Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     BuildHeader(
//                     pageName: 'Identitas',
//                     opacity1: 1,
//                     opacity2: 0.5,
//                     opacity3: 0.5,
//                     opacity4: 0.5,
//                     changeColor1: Colors.white,
//                     changeColor2: Colors.blue,
//                     changeColor3: Colors.blue,
//                     changeColor4: Colors.blue,
//                     ),
//                     SizedBox(height: 20,),
//                     DisabledFormContainer(
//                     labels: 'Nama Lengkap',
//                     needsInfoButton: true,
//                     buttonContent: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada).\n\nContoh: \nArena Sri Viktoria',
//                     controller: _name,                 
//                     ),
//                     SizedBox(height: 30,),
//                     DisabledFormContainer(
//                       labels: 'Tanggal Lahir',
//                       needsInfoButton: false,
//                       buttonContent: '',
//                       controller: _dOB,               
//                     ),
//                     SizedBox(height: 20,),
//                     DisabledFormContainer(
//                       labels: 'Nomor Paspor',
//                       needsInfoButton: false,
//                       buttonContent: '', 
//                       controller: _passport,                  
//                     ),
//                     SizedBox(height: 20,),
//                     DisabledFormContainer(
//                       labels: 'NIK',
//                       needsInfoButton: false,
//                       buttonContent: '',  
//                       controller: _iDNumber,                 
//                     ),
//                     SizedBox(height: 20,),
//                     Text(
//                       'Jenis kelamin',
//                       textAlign: TextAlign.left,
//                       style: TextStyling.regularTextStyle,
//                     ),

//                     FormBuilderDropdown<String>(
//                       name: "gender",
//                       enabled: false,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: FormBuilderValidators.compose([
//                         (value){
//                           if(value ==null || value =='' || value.isEmpty){
//                             return 'Please select gender'; //TODO: Change prompt
//                           }
//                           return null;
//                         }
//                       ]),
//                       onChanged: (String? newValue){
//                         setState((){
//                           dropdownValue = newValue!;
//                           }
//                         );
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Pilih Jenis Kelamin',
//                       ),
//                       items: genderOptions
//                       .map((gender) => DropdownMenuItem(
//                         value: gender,
//                         child: Text(gender),
//                         )).toList()
//                     ),
//                     SizedBox(height: 20,),
//                     DisabledFormContainer(
//                     labels: 'Alamat Lengkap di Luar Negeri',
//                     needsInfoButton: false,
//                     buttonContent: '',
//                     controller: _address,                
//                     ),
//                     SizedBox(height: 30,),
//                     DisabledFormContainer(
//                       labels: 'Negara',
//                       needsInfoButton: false,
//                       buttonContent: '',
//                       controller: _country,                 
//                     ),
//                     SizedBox(height: 30,),
//                     Text(
//                       'Propinsi',
//                       style: TextStyling.regularTextStyle,
//                     ),
//                     FormBuilderDropdown<String>(
//                       name: "province",
//                       enabled: false,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: FormBuilderValidators.compose([
//                         (value){
//                           if(value ==null || value =='' || value.isEmpty){
//                             return 'Please select province'; //TODO: Change prompt
//                           }
//                           return null;
//                         }
//                       ]),
//                       onChanged: (String? newValue){
//                         setState((){
//                           provinceDropdownValue = newValue!;
//                           }
//                         );
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Pilih Propinsi',
//                       ),
//                       items: provinces
//                       .map((provinces) => DropdownMenuItem(
//                         value: provinces,
//                         child: Text(provinces),
//                         )).toList()
//                     ),
//                     SizedBox(height: 30,),
//                     Text(
//                       'Kota',
//                       style: TextStyling.regularTextStyle,
//                     ),
//                     FormBuilderDropdown<String>(
//                       name: "cities",
//                       enabled: false,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       validator: FormBuilderValidators.compose([
//                         (value){
//                           if(value ==null || value =='' || value.isEmpty){
//                             return 'Please select city'; //TODO: Change prompt
//                           }
//                           return null;
//                         }
//                       ]),
//                       onChanged: (String? newValue){
//                         setState((){
//                           cityDropdownValue = newValue!;
//                           }
//                         );
//                       },
//                       decoration: InputDecoration(
//                         hintText: 'Pilih Kota',
//                       ),
//                       items: cities
//                       .map((cities) => DropdownMenuItem(
//                         value: cities,
//                         child: Text(cities),
//                         )).toList()
//                     ),
//                     SizedBox(height: 30,),
//                     DisabledFormContainer(
//                       labels: 'Kode Pos',
//                       needsInfoButton: false,
//                       buttonContent: '',
//                       controller: _postalCode,                 
//                     ),
//                     //TODO: Adjust button position
//                     ElevatedButton(
//                       child: const Text('Next'),
//                       onPressed: () {
//                         getItemAndNavigate(context);
//                       }
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
