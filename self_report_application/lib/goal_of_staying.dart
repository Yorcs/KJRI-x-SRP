// import 'package:flutter/material.dart';
// import 'package:self_report_application/emergency_contact_abroad.dart';
// import 'package:self_report_application/form_container.dart';
// import 'package:self_report_application/header.dart';
// import 'package:self_report_application/styling.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // Goal of staying page
// class GoalOfStayingPage extends StatelessWidget { 
//   const GoalOfStayingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GoalOfStayingForm();
//   }
// }

// class GoalOfStayingForm extends StatefulWidget {
//   const GoalOfStayingForm({super.key});


//   @override
//   State<GoalOfStayingForm> createState() => _GoalOfStayingFormState();
// }

// // TODO: Make text editing controller and string for the dropdown
// class _GoalOfStayingFormState extends State<GoalOfStayingForm> {
//   final _goalOfStayingKey = GlobalKey<FormBuilderState>();
//   final TextEditingController _description = TextEditingController();

//   final TextEditingController _perusahaanPenyalur = TextEditingController();
//   final TextEditingController _agenPenyalur = TextEditingController();
//   final TextEditingController _employerName = TextEditingController();
//   final TextEditingController _employerAddress = TextEditingController();

//   final TextEditingController _schoolName = TextEditingController();
//   final TextEditingController _schoolProgram = TextEditingController();

//   //Form Container String
//   late String descriptionString;
//   late String employerNameString;
//   late String employerAddressString;
//   late String perusahaanPenyalurString;
//   late String agenPenyalurString;
//   late String schoolNameString;
//   late String schoolProgramString;

//   //Dropdown string
//   late String goalOfStayingDropdownValueString;
//   late String employmentIndustryString;
//   late String employmentNameString;
//   late String schoolDegreeString;
//   late String lengthOfSchoolYearString;
//   late String lengthOfSchoolMonthString;

//   Future<(String, String, String, String, String, String, String, String, String, String, String, String, String)> getSharedPrefs() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     goalOfStayingDropdownValueString = prefs.getString('Tujuan Menetap') ?? '';

//     descriptionString = prefs.getString('Keterangan') ?? '';

//     employerNameString = prefs.getString('Nama Perusahaan / Pengguna Jasa') ??'';
//     employerAddressString = prefs.getString('Alamat Pekerjaan di Luar Negeri') ?? '';
//     employmentIndustryString = prefs.getString('Bidang Kerja') ?? '';
//     employmentNameString = prefs.getString('Pekerjaan') ?? '';
//     perusahaanPenyalurString = prefs.getString('Perusahaan Penyalur / Penempatan') ?? '';
//     agenPenyalurString = prefs.getString('Agen Penyalur di Luar Negeri') ?? '';

//     schoolNameString = prefs.getString('Nama Sekolah') ?? '';
//     schoolDegreeString = prefs.getString('Jenjang') ?? '';
//     schoolProgramString = prefs.getString('Program / Bidang Studi') ?? '';
//     lengthOfSchoolYearString = prefs.getString('Lama Pendidikan (Tahun)') ?? '';
//     lengthOfSchoolMonthString = prefs.getString('Lama Pendidikan (Bulan)') ?? '';


//     setState(() {
//       goalOfStayingDropdownValue = goalOfStayingDropdownValueString;

//       _description.text = descriptionString;

//       employmentIndustry = employmentIndustryString;
//       employmentName = employmentNameString;
//       _employerName.text = employerNameString;
//       _employerAddress.text = employerAddressString;
//       _perusahaanPenyalur.text = perusahaanPenyalurString;
//       _agenPenyalur.text = agenPenyalurString;

//       _schoolName.text = schoolNameString;
//       schoolDegree = schoolDegreeString;
//       _schoolProgram.text = schoolProgramString;
//       lengthOfSchoolYear = lengthOfSchoolYearString;
//       lengthOfSchoolMonth = lengthOfSchoolMonthString;
//     });

//     return (employerNameString, employerAddressString, descriptionString, perusahaanPenyalurString, agenPenyalurString, goalOfStayingDropdownValueString, employmentIndustryString, employerNameString, schoolNameString, schoolDegreeString, schoolProgramString, lengthOfSchoolYearString, lengthOfSchoolMonthString);
//   }

//   Future<void> saveData() async{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('Tujuan Menetap', goalOfStayingDropdownValue.toString());

//     await prefs.setString('Keterangan', _description.text);

//     await prefs.setString('Nama Perusahaan / Pengguna Jasa', _employerName.text);
//     await prefs.setString('Alamat Pekerjaan di Luar Negeri', _employerAddress.text);
//     await prefs.setString('Perusahaan Penyalur / Penempatan', _perusahaanPenyalur.text);
//     await prefs.setString('Agen Penyalur di Luar Negeri', _agenPenyalur.text);
//     await prefs.setString('Bidang Kerja', employmentIndustry.toString());
//     await prefs.setString('Pekerjaan', employmentName.toString());

//     await prefs.setString('Nama Sekolah', _schoolName.text);
//     await prefs.setString('Jenjang', schoolDegree.toString());
//     await prefs.setString('Program / Bidang Studi', _schoolProgram.text);
//     await prefs.setString('Lama Pendidikan (Tahun)', lengthOfSchoolYear.toString());
//     await prefs.setString('Lama Pendidikan (Bulan)', lengthOfSchoolMonth.toString());
//   }

//   @override
//   void initState(){
//     super.initState();
//     getSharedPrefs();
//     _description.addListener(() {
//       final String text = _description.text;
//       _description.value = _description.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _employerName.addListener(() {
//       final String text = _employerName.text;
//       _employerName.value = _employerName.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _employerAddress.addListener(() {
//       final String text = _employerAddress.text;
//       _employerAddress.value = _employerAddress.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _perusahaanPenyalur.addListener(() {
//       final String text = _perusahaanPenyalur.text;
//       _perusahaanPenyalur.value = _perusahaanPenyalur.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _agenPenyalur.addListener(() {
//       final String text = _agenPenyalur.text;
//       _agenPenyalur.value = _agenPenyalur.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _schoolName.addListener(() {
//       final String text = _schoolName.text;
//       _schoolName.value = _schoolName.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });

//     _schoolProgram.addListener(() {
//       final String text = _schoolProgram.text;
//       _schoolProgram.value = _schoolProgram.value.copyWith(
//         text: text,
//         selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
//         composing:  TextRange.empty,
//       );
//     });
//   }

//   @override
//   void dispose(){
//     _description.dispose();
//     _employerName.dispose();
//     _employerAddress.dispose();
//     _perusahaanPenyalur.dispose();
//     _agenPenyalur.dispose();
//     _schoolName.dispose();
//     _schoolProgram.dispose();
//     super.dispose();
//   }
  

//   String? goalOfStayingDropdownValue;
//   String? employmentIndustry;
//   String? employmentName;
//   String? schoolDegree;
//   String? lengthOfSchoolYear;
//   String? lengthOfSchoolMonth;

//   List<String> goals =[
//     'Anggota Keluarga / Pengikut',
//     'Bekerja',
//     'Belajar',
//     'Magang',
//     'Mendampingi Suami / Istri',
//     'Lain-lain',
//   ];

// //Work Industries Variables
//   List<String> industries =[
//     'Pertambangan',
//     'Pemerintahan',
//     'Kesehatan',
//     'Konstruksi',
//     'Industri Manufaktur',
//     'Organisasi Internasional',
//     'Industri Perhotelan dan Pariwisata',
//     'Pendidikan',
//     'Penerbangan',
//     'Perbankan dan Keuangan',
//     'Pertanian',
//     'Perkebunan',
//     'Hukum',
//     'Domestik',
//     'Teknologi Informasi',
//     'Media Elektronik',
//     'Seni dan Budaya',
//     'Wirausaha',
//     'Pelayaran dan Kelautan',
//     'Industri Mode',
//     'Perikanan',
//     'Jasa (Service)',
//   ];

//   List<String> pertambanganName =[
//     'Konsultan',
//     'Direktur',
//     'Manajer',
//     'Teknisi Lapangan',
//     'Supervisor',
//     'Lainnya',
//   ];

//   List<String> pemerintahanName =[
//     'Home Staff / Diplomat',
//     'Lokal Staff pada Perwakilan RI',
//     'Staf pada Instansi Lainnya',
//     'Staf Instansi Pemerintah Asing',
//   ];

//   List<String> kesehatanName = [
//     'Apoteker',
//     'Dokter',
//     'Paramedis',
//     'Perawat',
//     'Lainnya',
//   ];

//   List<String> konstruksiName =[
//     'Arsitek',
//     'Konsultan',
//     'Supervisor',
//     'Buruh',
//     'Lainnya',
//   ];

//   List<String> industriManufakturName =[
//     'Direktur',
//     'Manajer',
//     'Pekerja',
//     'Supervisor',
//     'Teknisi',
//     'Lainnya',
//   ];

//   List<String> orgInterName =[
//     'Konsultan',
//     'Manajer',
//     'Staf',
//     'Lainnya',
//   ];

//   List<String> parwisName =[
//     'Manajer Biro Perjalanan',
//     'Manajer Hotel',
//     'Manajer Spa',
//     'Manajer Restaurant'
//     'Spa Terapis',
//     'Tour Guide',
//     'Chef / Cook',
//     'ABK Kapal Pesiar',
//     'Pemandu Karaoke',
//     'Juru Masak',
//     'Bartender',
//     'Waitress',
//     'Staf Biro Perjalanan',
//     'Staf Hotel',
//     'Staf Restaurant',
//     'Lainnya',
//   ];

//   List<String> pendidikanName =[
//     'Dosen',
//     'Guru',
//     'Peneliti',
//     'Staf',
//     'Lainnya',
//   ];

//   List<String> penerbanganName =[
//     'Ground Staff',
//     'Pilot',
//     'Pramugari',
//     'Teknisi Pesawat',
//     'Lainnya',
//   ];

//   List<String> keuanganName =[
//     'Konsultan Keuangan',
//     'Manajer Asuransi / Perbankan',
//     'Marketing',
//     'Direktur Keuangan / Bank',
//     'Underwriter',
//     'Tax Manager',
//     'Auditor',
//     'Manajer Investasi',
//     'Staf',
//     'Lainnya',
//   ];

//   List<String> pertanianOrPerkebunanName =[
//     'Pekerja',
//     'Manajer',
//     'Supervisor',
//     'Lainnya'
//   ];

//   List<String> hukumName =[
//     'Pengacara',
//     'Konsultan Hukum',
//     'Notaris',
//     'Arbitor',
//     'Staf Administrasi',
//     'Lainnya',
//   ];

//   List<String> domestikName =[
//     'PLRT',
//     'Supir',
//     'Tukang Kebun',
//     'Babysitter / Nanny',
//     'Caregiver',
//     'Cook',
//     'Lainnya'
//   ];

//   List<String> techName =[
//     'Programmer',
//     'Teknisi',
//     'System Analyst',
//     'IT Konsultan',
//     'IT Art Designer',
//     'Administrator',
//     'Software Developer'
//   ];

//   List<String> mediaElektronikName =[
//     'Script Writer',
//     'Kameraman',
//     'Reporter / Wartawan / Jurnalis',
//     'Penyiar Radio / TV',
//     'Lainnya',
//   ];

//   List<String> senbudName =[
//     'Pemain Film / Aktor / Aktris',
//     'Penyanyi',
//     'Sutradara',
//     'Produsen Film / Musik',
//     'Pemusik',
//     'Pematung',
//     'Penulis',
//     'Penari',
//     'Pelukis / Perupa',
//     'Lainnya',
//   ];

//   List<String> wirausahaName =[
//     'Investor',
//     'Distributor',
//     'Importir',
//     'Lainnya',
//   ];

//   List<String> kelautanName =[
//     'ABK Kargo',
//     'ABK Pesiar',
//     'ABK Tanker',
//     'ABK Tugboat',
//     'Kapten',
//   ];

//   List<String> industriModeName =[
//     'Desainer',
//     'Penjait',
//     'Model',
//     'Lainnya',
//   ];

//   List<String> perikananName = [
//     'Kapten Kapal',
//     'ABK Kapal Penangkap Ikan',
//     'Nelayan'
//   ];


// //Studies Variables
//   List<String> jenjang =[
//     'Sekolah Dasar',
//     'Sekolah Menengah Pertama',
//     'Sekolah Menengah Atas',
//     'Diploma',
//     'Sarjana',
//     'Pasca Sarjana',
//     'Doktor',
//     'Lainnya',
//   ];

//   List<String> bulanJenjang =[
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '10',
//     '11',
//   ];

//   List<String> tahunJenjang =[
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '10',
//     '11',
//     '12',
//     '13',
//     '14',
//     '15',
//     '16',
//     '17',
//     '18',
//     '19',
//     '20',
//   ];

//   goBack(BuildContext context)=> Navigator.pop(context);

//   Future <void> getItemAndNavigate (BuildContext context) async {
//     final isValid = _goalOfStayingKey.currentState!.validate();
//     if(!isValid){
//     } else {
//       saveData();
//       await Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => EmergencyContactAbroadPage()
//       )
//     );
//     }
//   }
  
  
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           //TODO: Readjust margin and padding
//           body: SingleChildScrollView(
//             child: FormBuilder(
//               key: _goalOfStayingKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[ 
//                   BuildHeader(
//                     pageName: 'TUJUAN MENETAP',
//                     assetName: 'images/tujuan-active.svg',
//                   ),
//                   Container(
//                     margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         SizedBox(height: 30,),
//                         Text(
//                             'Tujuan Menetap',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                         FormBuilderDropdown<String>(
//                           name: "goals",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select a goal of staying'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               goalOfStayingDropdownValue = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: goals
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         SizedBox(height: 30,),
//                         //Mendampingi Suami / Istri, Anggota Keluarga / Pengikut
//                         if (goalOfStayingDropdownValue.toString() =='Mendampingi Suami / Istri' || goalOfStayingDropdownValue.toString() == 'Anggota Keluarga / Pengikut') ... [
//                           FormContainer(
//                             labels: 'Keterangan',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _description,
//                             requiredDataChecker: true,                 
//                           ),
//                         ] 
//                         //Lain-lain
//                         else if (goalOfStayingDropdownValue.toString() == 'Lain-lain') ... [
//                           FormContainer(
//                             labels: 'Keterangan',
//                             needsInfoButton: true,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: 'Sebutkan: \nKunjungan Keluarga, Au pair, dll',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _description,
//                             requiredDataChecker: true,               
//                           ),
//                         ] 
//                         //Bekerja
//                         else if(goalOfStayingDropdownValue.toString() == 'Bekerja') ...[
//                         // TODO: Change hint contents
//                         Text(
//                             'Bidang Kerja',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                         FormBuilderDropdown<String>(
//                           name: "employmentIndustry",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your industry'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentIndustry = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: industries
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         SizedBox(height: 30),
//                         //TODO: COPY PASTE TO IF STATEMENT
                        
//                         // TODO: Change placeholder
//                         if(employmentIndustry.toString() == 'Pertambangan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pertambanganName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pemerintahanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: kesehatanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: konstruksiName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: industriManufakturName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: orgInterName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: parwisName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pendidikanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: penerbanganName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: keuanganName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pertanianOrPerkebunanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Hukum') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: hukumName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Domestik') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: domestikName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: techName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: mediaElektronikName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: senbudName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: wirausahaName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: kelautanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: industriModeName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Perikanan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: perikananName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if(employmentIndustry.toString() =='Jasa (Service)') ... [
//                             FormContainer(
//                               labels: 'Keterangan',
//                               needsInfoButton: false,
//                               isDataRequired: AutovalidateMode.onUserInteraction,
//                               hintContents: '',
//                               buttonContent: '',
//                               valueConstraints: r'^[a-z A-Z]+$',   
//                               controller: _description,
//                               requiredDataChecker: true,                 
//                             ),
//                         ],
//                         SizedBox(height: 30),
//                           FormContainer(
//                             labels: 'Nama Perusahaan / Pengguna Jasa',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _employerName,
//                             requiredDataChecker: true,                 
//                           ),
//                           SizedBox(height: 30),
//                           FormContainer(
//                             labels: 'Alamat Pekerjaan di Luar Negeri',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _employerAddress,
//                             requiredDataChecker: true,               
//                           ),
//                           SizedBox(height: 30),
//                           FormContainer(
//                             labels: 'Perusahaan Penyalur / Penempatan',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _perusahaanPenyalur,  
//                             requiredDataChecker: true,               
//                           ),
//                           SizedBox(height: 30),
//                           FormContainer(
//                             labels: 'Agen Penyalur di Luar Negeri',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _agenPenyalur, 
//                             requiredDataChecker: true,                
//                           ),

//                         ]
//                         //TODO: FIX CONTROLLER
//                         //Belajar 
//                         else if(goalOfStayingDropdownValue.toString() == 'Belajar') ... [
//                           FormContainer(
//                             labels: 'Nama Sekolah',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _schoolName,
//                             requiredDataChecker: true,                 
//                           ),
//                           SizedBox(height: 30),
//                           Text(
//                             'Jenjang',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                             name: "Jenjang",
//                             autovalidateMode: AutovalidateMode.onUserInteraction,
//                             validator: FormBuilderValidators.compose([
//                               (value){
//                                 if(value ==null || value =='' || value.isEmpty){
//                                   return 'Please select your degree'; //TODO: Change prompt
//                                 }
//                                 return null;
//                               }
//                             ]),
//                             onChanged: (String? newValue){
//                               setState((){
//                                 schoolDegree = newValue!;
//                                 }
//                               );
//                             },
//                             decoration: InputDecoration(
//                               errorStyle: TextStyle(
//                                 fontFamily: 'Source Sans Pro',
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               ),
//                               errorBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 0.5,
//                                   color: Color.fromRGBO(255, 5, 5, 1),
//                                 )
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 0.5,
//                                   color: Color.fromRGBO(255, 5, 5, 1),
//                                 )
//                               ),
//                               focusColor: Color.fromRGBO(74, 74, 74, 1),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   width: 0.5,
//                                   color: Color.fromRGBO(74, 74, 74, 1),
//                                 ),
//                               ),
//                               contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                               prefix: const Padding(
//                                 padding: EdgeInsets.only(left: 15),
//                               ),
//                               isDense: true,
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 0.5,
//                                   color: Color.fromRGBO(179, 179, 179, 1),
//                                   )
//                                 ),
//                             ),
//                             items: jenjang
//                             .map((items) => DropdownMenuItem<String>(
//                               value: items,
//                               child: Text(items),
//                               )).toList()
//                           ),
//                           SizedBox(height: 30),
//                           FormContainer(
//                             labels: 'Program / Bidang Studi',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _schoolProgram,
//                             requiredDataChecker: true,                 
//                           ),

//                           //TODO: ADD TWO INPUT CONTAINER
//                         ]
//                         //Magang
//                         else if (goalOfStayingDropdownValue.toString() == 'Magang') ... [
//                             Text(
//                             'Bidang Kerja',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                         FormBuilderDropdown<String>(
//                           name: "employmentIndustry",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your industry'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentIndustry = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: industries
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                         // TODO: Change placeholder
//                         if(employmentIndustry.toString() == 'Pertambangan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pertambanganName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pemerintahanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: kesehatanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: konstruksiName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: industriManufakturName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: orgInterName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: parwisName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pendidikanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: penerbanganName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: keuanganName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: pertanianOrPerkebunanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Hukum') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: hukumName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Domestik') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: domestikName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: techName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: mediaElektronikName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: senbudName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: wirausahaName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: kelautanName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: industriModeName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if (employmentIndustry.toString() == 'Perikanan') ... [
//                           Text(
//                             'Pekerjaan',
//                             style: TextStyling.regularTextStyle,
//                           ),
//                           FormBuilderDropdown<String>(
//                           name: "employmentName",
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           validator: FormBuilderValidators.compose([
//                             (value){
//                               if(value ==null || value =='' || value.isEmpty){
//                                 return 'Please select your job'; //TODO: Change prompt
//                               }
//                               return null;
//                             }
//                           ]),
//                           onChanged: (String? newValue){
//                             setState((){
//                               employmentName = newValue!;
//                               }
//                             );
//                           },
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(
//                               fontFamily: 'Source Sans Pro',
//                               color: Color.fromRGBO(255, 5, 5, 1),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(255, 5, 5, 1),
//                               )
//                             ),
//                             focusColor: Color.fromRGBO(74, 74, 74, 1),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(74, 74, 74, 1),
//                               ),
//                             ),
//                             contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 10),
//                             prefix: const Padding(
//                               padding: EdgeInsets.only(left: 15),
//                             ),
//                             isDense: true,
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 0.5,
//                                 color: Color.fromRGBO(179, 179, 179, 1),
//                                 )
//                               ),
//                           ),
//                           items: perikananName
//                           .map((items) => DropdownMenuItem<String>(
//                             value: items,
//                             child: Text(items),
//                             )).toList()
//                         ),
//                         ] else if(employmentIndustry.toString() =='Jasa (Service)') ... [
//                             FormContainer(
//                               labels: 'Keterangan',
//                               needsInfoButton: false,
//                               isDataRequired: AutovalidateMode.onUserInteraction,
//                               hintContents: '',
//                               buttonContent: '',
//                               valueConstraints: r'^[a-z A-Z]+$',   
//                               controller: _description,
//                               requiredDataChecker: true,                 
//                             ),
//                         ],
//                           FormContainer(
//                             labels: 'Nama Perusahaan / Pengguna Jasa',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _employerName,
//                             requiredDataChecker: true,                 
//                           ),
//                           FormContainer(
//                             labels: 'Alamat Pekerjaan di Luar Negeri',
//                             needsInfoButton: false,
//                             isDataRequired: AutovalidateMode.onUserInteraction,
//                             hintContents: '',
//                             buttonContent: '',
//                             valueConstraints: r'^[a-z A-Z]+$',   
//                             controller: _employerAddress,
//                             requiredDataChecker: true,               
//                           ),
//                         ],
//                         SizedBox(height: 40,), 
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             BackButtons(
//                               onPressed: () => goBack(context),
//                             ),
//                             // TODO: Adjust button position
//                             ForwardButtons(
//                               onPressed: () => getItemAndNavigate(context)
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 50,), 
//                       ],
//                     ),
//                   ),
//                 ]
//               )
//             )
//           )
//         );
//       }
//     );
//   }
// }