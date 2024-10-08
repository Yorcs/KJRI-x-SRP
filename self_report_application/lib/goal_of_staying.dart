import 'package:flutter/material.dart';
import 'package:self_report_application/emergency_contact_abroad.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Goal of staying page
class GoalOfStayingPage extends StatelessWidget { 
  const GoalOfStayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GoalOfStayingForm();
  }
}

class GoalOfStayingForm extends StatefulWidget {
  const GoalOfStayingForm({super.key});


  @override
  State<GoalOfStayingForm> createState() => _GoalOfStayingFormState();
}

// TODO: Make text editing controller and string for the dropdown
class _GoalOfStayingFormState extends State<GoalOfStayingForm> {
  final _goalOfStayingKey = GlobalKey<FormBuilderState>();
  final TextEditingController _description = TextEditingController();

  final TextEditingController _perusahaanPenyalur = TextEditingController();
  final TextEditingController _agenPenyalur = TextEditingController();
  final TextEditingController _employerName = TextEditingController();
  final TextEditingController _employerAddress = TextEditingController();

  final TextEditingController _schoolName = TextEditingController();
  final TextEditingController _schoolProgram = TextEditingController();

  //Form Container String
  late String descriptionString;
  late String employerNameString;
  late String employerAddressString;
  late String perusahaanPenyalurString;
  late String agenPenyalurString;
  late String schoolNameString;
  late String schoolProgramString;

  //Dropdown string
  late String goalOfStayingDropdownValueString;
  late String secondaryGoalOfStayingDropdownValueString;
  late String employmentIndustryString;
  late String employmentNameString;
  late String schoolDegreeString;
  late String lengthOfSchoolYearString;
  late String lengthOfSchoolMonthString;

  Future<(String, String, String, String, String, String, String, String, String, String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    goalOfStayingDropdownValueString = prefs.getString('Tujuan Menetap') ?? '';
    secondaryGoalOfStayingDropdownValueString = prefs.getString('Tujuan Menetap Lainnya') ?? '';

    descriptionString = prefs.getString('Keterangan') ?? '';

    employerNameString = prefs.getString('Nama Perusahaan / Pengguna Jasa') ??'';
    employerAddressString = prefs.getString('Alamat Pekerjaan di Luar Negeri') ?? '';
    employmentIndustryString = prefs.getString('Bidang Kerja') ?? '';
    employmentNameString = prefs.getString('Pekerjaan') ?? '';
    perusahaanPenyalurString = prefs.getString('Perusahaan Penyalur / Penempatan') ?? '';
    agenPenyalurString = prefs.getString('Agen Penyalur di Luar Negeri') ?? '';

    schoolNameString = prefs.getString('Nama Sekolah') ?? '';
    schoolDegreeString = prefs.getString('Jenjang') ?? '';
    schoolProgramString = prefs.getString('Program / Bidang Studi') ?? '';
    lengthOfSchoolYearString = prefs.getString('Lama Pendidikan (Tahun)') ?? '';
    lengthOfSchoolMonthString = prefs.getString('Lama Pendidikan (Bulan)') ?? '';


    setState(() {
      goalOfStayingDropdownValue = goalOfStayingDropdownValueString;
      secondaryGoalOfStayingDropdownValue = secondaryGoalOfStayingDropdownValueString;

      _description.text = descriptionString;

      employmentIndustry = employmentIndustryString;
      employmentName = employmentNameString;
      _employerName.text = employerNameString;
      _employerAddress.text = employerAddressString;
      _perusahaanPenyalur.text = perusahaanPenyalurString;
      _agenPenyalur.text = agenPenyalurString;

      _schoolName.text = schoolNameString;
      schoolDegree = schoolDegreeString;
      _schoolProgram.text = schoolProgramString;
      lengthOfSchoolYear = lengthOfSchoolYearString;
      lengthOfSchoolMonth = lengthOfSchoolMonthString;
    });

    return (employerNameString, employerAddressString, descriptionString, perusahaanPenyalurString, agenPenyalurString, goalOfStayingDropdownValueString, secondaryGoalOfStayingDropdownValueString, employmentIndustryString, employerNameString, schoolNameString, schoolDegreeString, schoolProgramString, lengthOfSchoolYearString, lengthOfSchoolMonthString);
  }
  Future<void> saveDropdownData(String str, String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(str, value);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Keterangan', _description.text);

    await prefs.setString('Nama Perusahaan / Pengguna Jasa', _employerName.text);
    await prefs.setString('Alamat Pekerjaan di Luar Negeri', _employerAddress.text);
    await prefs.setString('Perusahaan Penyalur / Penempatan', _perusahaanPenyalur.text);
    await prefs.setString('Agen Penyalur di Luar Negeri', _agenPenyalur.text);

    await prefs.setString('Nama Sekolah', _schoolName.text);
    await prefs.setString('Program / Bidang Studi', _schoolProgram.text);
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _description.addListener(() {
      final String text = _description.text;
      _description.value = _description.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _employerName.addListener(() {
      final String text = _employerName.text;
      _employerName.value = _employerName.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _employerAddress.addListener(() {
      final String text = _employerAddress.text;
      _employerAddress.value = _employerAddress.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _perusahaanPenyalur.addListener(() {
      final String text = _perusahaanPenyalur.text;
      _perusahaanPenyalur.value = _perusahaanPenyalur.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _agenPenyalur.addListener(() {
      final String text = _agenPenyalur.text;
      _agenPenyalur.value = _agenPenyalur.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _schoolName.addListener(() {
      final String text = _schoolName.text;
      _schoolName.value = _schoolName.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _schoolProgram.addListener(() {
      final String text = _schoolProgram.text;
      _schoolProgram.value = _schoolProgram.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _description.dispose();
    _employerName.dispose();
    _employerAddress.dispose();
    _perusahaanPenyalur.dispose();
    _agenPenyalur.dispose();
    _schoolName.dispose();
    _schoolProgram.dispose();
    super.dispose();
  }
  

  String? goalOfStayingDropdownValue;
  String? secondaryGoalOfStayingDropdownValue;
  String? employmentIndustry;
  String? employmentName;
  String? schoolDegree;
  String? lengthOfSchoolYear;
  String? lengthOfSchoolMonth;

  List<String> goals =[
    'Anggota Keluarga / Pengikut',
    'Bekerja',
    'Belajar',
    'Magang',
    'Mendampingi Suami / Istri',
    'Lain-lain',
  ];

  List<String> secondaryGoals = [
    'Bekerja',
    'Belajar',
    'Lain-lain',
  ];

//Work Industries Variables
  List<String> industries =[
    'Pertambangan',
    'Pemerintahan',
    'Kesehatan',
    'Konstruksi',
    'Industri Manufaktur',
    'Organisasi Internasional',
    'Industri Perhotelan dan Pariwisata',
    'Pendidikan',
    'Penerbangan',
    'Perbankan dan Keuangan',
    'Pertanian',
    'Perkebunan',
    'Hukum',
    'Domestik',
    'Teknologi Informasi',
    'Media Elektronik',
    'Seni dan Budaya',
    'Wirausaha',
    'Pelayaran dan Kelautan',
    'Industri Mode',
    'Perikanan',
    'Jasa (Service)',
  ];

  List<String> pertambanganName =[
    'Konsultan',
    'Direktur',
    'Manajer',
    'Teknisi Lapangan',
    'Supervisor',
    'Lainnya',
  ];

  List<String> pemerintahanName =[
    'Home Staff / Diplomat',
    'Lokal Staff pada Perwakilan RI',
    'Staf pada Instansi Lainnya',
    'Staf Instansi Pemerintah Asing',
  ];

  List<String> kesehatanName = [
    'Apoteker',
    'Dokter',
    'Paramedis',
    'Perawat',
    'Lainnya',
  ];

  List<String> konstruksiName =[
    'Arsitek',
    'Konsultan',
    'Supervisor',
    'Buruh',
    'Lainnya',
  ];

  List<String> industriManufakturName =[
    'Direktur',
    'Manajer',
    'Pekerja',
    'Supervisor',
    'Teknisi',
    'Lainnya',
  ];

  List<String> orgInterName =[
    'Konsultan',
    'Manajer',
    'Staf',
    'Lainnya',
  ];

  List<String> parwisName =[
    'Manajer Biro Perjalanan',
    'Manajer Hotel',
    'Manajer Spa',
    'Manajer Restaurant'
    'Spa Terapis',
    'Tour Guide',
    'Chef / Cook',
    'ABK Kapal Pesiar',
    'Pemandu Karaoke',
    'Juru Masak',
    'Bartender',
    'Waitress',
    'Staf Biro Perjalanan',
    'Staf Hotel',
    'Staf Restaurant',
    'Lainnya',
  ];

  List<String> pendidikanName =[
    'Dosen',
    'Guru',
    'Peneliti',
    'Staf',
    'Lainnya',
  ];

  List<String> penerbanganName =[
    'Ground Staff',
    'Pilot',
    'Pramugari',
    'Teknisi Pesawat',
    'Lainnya',
  ];

  List<String> keuanganName =[
    'Konsultan Keuangan',
    'Manajer Asuransi / Perbankan',
    'Marketing',
    'Direktur Keuangan / Bank',
    'Underwriter',
    'Tax Manager',
    'Auditor',
    'Manajer Investasi',
    'Staf',
    'Lainnya',
  ];

  List<String> pertanianOrPerkebunanName =[
    'Pekerja',
    'Manajer',
    'Supervisor',
    'Lainnya'
  ];

  List<String> hukumName =[
    'Pengacara',
    'Konsultan Hukum',
    'Notaris',
    'Arbitor',
    'Staf Administrasi',
    'Lainnya',
  ];

  List<String> domestikName =[
    'PLRT',
    'Supir',
    'Tukang Kebun',
    'Babysitter / Nanny',
    'Caregiver',
    'Cook',
    'Lainnya'
  ];

  List<String> techName =[
    'Programmer',
    'Teknisi',
    'System Analyst',
    'IT Konsultan',
    'IT Art Designer',
    'Administrator',
    'Software Developer'
  ];

  List<String> mediaElektronikName =[
    'Script Writer',
    'Kameraman',
    'Reporter / Wartawan / Jurnalis',
    'Penyiar Radio / TV',
    'Lainnya',
  ];

  List<String> senbudName =[
    'Pemain Film / Aktor / Aktris',
    'Penyanyi',
    'Sutradara',
    'Produsen Film / Musik',
    'Pemusik',
    'Pematung',
    'Penulis',
    'Penari',
    'Pelukis / Perupa',
    'Lainnya',
  ];

  List<String> wirausahaName =[
    'Investor',
    'Distributor',
    'Importir',
    'Lainnya',
  ];

  List<String> kelautanName =[
    'ABK Kargo',
    'ABK Pesiar',
    'ABK Tanker',
    'ABK Tugboat',
    'Kapten',
  ];

  List<String> industriModeName =[
    'Desainer',
    'Penjait',
    'Model',
    'Lainnya',
  ];

  List<String> perikananName = [
    'Kapten Kapal',
    'ABK Kapal Penangkap Ikan',
    'Nelayan'
  ];


//Studies Variables
  List<String> jenjang =[
    'Sekolah Dasar',
    'Sekolah Menengah Pertama',
    'Sekolah Menengah Atas',
    'Diploma',
    'Sarjana',
    'Pasca Sarjana',
    'Doktor',
    'Lainnya',
  ];

  List<String> bulanJenjang =[
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

  List<String> tahunJenjang =[
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

  goBack(BuildContext context)=> Navigator.pop(context);

  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _goalOfStayingKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmergencyContactAbroadPage()
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
              key: _goalOfStayingKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ 
                  BuildHeader(
                    pageName: 'TUJUAN MENETAP',
                    assetName: 'images/tujuan-active.svg',
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30,),
                        Text(
                            'Tujuan Menetap',
                            style: TextStyling.regularTextStyle,
                          ),
                        SizedBox(height: 10,),
                        FormBuilderDropdown<String>(
                          name: "goals",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih tujuan menetap'; 
                              }
                              saveDropdownData('Tujuan Menetap', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              goalOfStayingDropdownValue = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: goals
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        SizedBox(height: 30,),
                        //Mendampingi Suami / Istri
                        if (goalOfStayingDropdownValue.toString() =='Mendampingi Suami / Istri') ... [
                          FormContainer(
                            labels: 'Keterangan',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                            controller: _description,
                            requiredDataChecker: true,    
                            manualErrorText: 'Harap mengisi kolom keterangan',             
                          ),
                        ] 
                        else if(goalOfStayingDropdownValue.toString() == 'Anggota Keluarga / Pengikut') ...[
                          Text(
                            'Tujuan Menetap Lainnya',
                            style: TextStyling.regularTextStyle,
                          ),
                          FormBuilderDropdown<String>(
                            name: "secondaryGoals",
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              (value){
                                if(value ==null || value =='' || value.isEmpty){
                                  return 'Harap memilih tujuan menetap lainnya'; 
                                }
                                saveDropdownData('Tujuan Menetap Lainnya', value);
                                return null;
                              }
                            ]),
                            onChanged: (String? newValue){
                              setState((){
                                secondaryGoalOfStayingDropdownValue = newValue!;
                                }
                              );
                            },
                            decoration: noHintFormDecoration,
                            items: secondaryGoals
                            .map((items) => DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                              )).toList()
                          ),
                          SizedBox(height: 30,),
                          if(secondaryGoalOfStayingDropdownValue.toString() == 'Lain-lain') ... [
                            FormContainer(
                              labels: 'Keterangan',
                              needsInfoButton: true,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: 'Sebutkan: \nKunjungan Keluarga, Au pair, dll',
                              valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',     
                              controller: _description,
                              requiredDataChecker: true,  
                              manualErrorText: 'Harap mengisi kolom keterangan',              
                            ),
                          ]
                          else if(secondaryGoalOfStayingDropdownValue.toString() == 'Bekerja') ... [
                            
                            Text(
                                'Bidang Kerja',
                                style: TextStyling.regularTextStyle,
                              ),
                            SizedBox(height: 10,),
                            FormBuilderDropdown<String>(
                              name: "employmentIndustry",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih bidang kerja';
                                  }
                                  saveDropdownData('Bidang Kerja', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentIndustry = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: industries
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            SizedBox(height: 30),
                            
                            
                            if(employmentIndustry.toString() == 'Pertambangan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: pertambanganName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: pemerintahanName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: kesehatanName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: konstruksiName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: industriManufakturName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: orgInterName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: parwisName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: pendidikanName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: penerbanganName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: keuanganName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: pertanianOrPerkebunanName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Hukum') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: hukumName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Domestik') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: domestikName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: techName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: mediaElektronikName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: senbudName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: wirausahaName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: kelautanName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: industriModeName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                              Text(
                                'Pekerjaan',
                                style: TextStyling.regularTextStyle,
                              ),
                              SizedBox(height: 10,),
                              FormBuilderDropdown<String>(
                              name: "employmentName",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih pekerjaan'; 
                                  }
                                  saveDropdownData('Pekerjaan', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  employmentName = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: perikananName
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            ] else if(employmentIndustry.toString() =='Jasa (Service)') ... [
                                FormContainer(
                                  labels: 'Keterangan',
                                  needsInfoButton: false,
                                  isDataRequired: AutovalidateMode.onUserInteraction,
                                  hintContents: '',
                                  buttonContent: '',
                                  valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                                  controller: _description,
                                  requiredDataChecker: true,    
                                  manualErrorText: "Harap mengisi kolom keterangan",             
                                ),
                            ],
                            SizedBox(height: 30),
                            FormContainer(
                              labels: 'Nama Perusahaan / Pengguna Jasa',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",   
                              controller: _employerName,
                              requiredDataChecker: true,    
                              manualErrorText: "Harap memeriksa ulang nama perusahaan",             
                            ),
                            SizedBox(height: 30),
                            FormContainer(
                              labels: 'Alamat Pekerjaan di Luar Negeri',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",   
                              controller: _employerAddress,
                              requiredDataChecker: true,   
                              manualErrorText: "Harap memeriksa ulang alamat pekerjaan",             
                            ),
                            SizedBox(height: 30),
                            FormContainer(
                              labels: 'Perusahaan Penyalur / Penempatan',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",    
                              controller: _perusahaanPenyalur,  
                              requiredDataChecker: true,   
                              manualErrorText: "Harap memeriksa ulang perusahaan penyalur",              
                            ),
                            SizedBox(height: 30),
                            FormContainer(
                              labels: 'Agen Penyalur di Luar Negeri',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",  
                              controller: _agenPenyalur, 
                              requiredDataChecker: true,
                              manualErrorText: "Harap memeriksa ulang agen penyalur",                  
                            ),
                          ]
                          else if(secondaryGoalOfStayingDropdownValue.toString() == 'Belajar') ...[
                            FormContainer(
                            labels: 'Nama Sekolah',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                            controller: _schoolName,
                            requiredDataChecker: true, 
                            manualErrorText: 'Harap mengisi nama sekolah',                
                            ),
                            SizedBox(height: 30),
                            Text(
                              'Jenjang',
                              style: TextStyling.regularTextStyle,
                            ),
                            FormBuilderDropdown<String>(
                              name: "Jenjang",
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                (value){
                                  if(value ==null || value =='' || value.isEmpty){
                                    return 'Harap memilih jenjang sekolah'; 
                                  }
                                  saveDropdownData('Jenjang', value);
                                  return null;
                                }
                              ]),
                              onChanged: (String? newValue){
                                setState((){
                                  schoolDegree = newValue!;
                                  }
                                );
                              },
                              decoration: noHintFormDecoration,
                              items: jenjang
                              .map((items) => DropdownMenuItem<String>(
                                value: items,
                                child: Text(items),
                                )).toList()
                            ),
                            SizedBox(height: 30),
                            FormContainer(
                              labels: 'Program / Bidang Studi',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                              controller: _schoolProgram,
                              requiredDataChecker: true,   
                              manualErrorText: 'Harap mengisi program / bidang studi',              
                            ),
                            SizedBox(height: 30),
                          Text(
                            'Lama Pendidikan',
                            style: TextStyling.regularBoldTextStyle,
                          ),
                            SizedBox(height: 5,),
                          DropdownContainer(
                            labels: 'Tahun',
                            needsInfoButton: false,
                            buttonContent: '',
                            dropdownName: 'Lama Pendidikan (Tahun)',
                            validatorWarning: '',
                            hintContents: '',
                            dropdownValue: lengthOfSchoolYear,
                            dropdownContents: tahunJenjang,
                            dropdownKey: 'Lama Pendidikan (Tahun)',
                          ), 
                          DropdownContainer(
                            labels: 'Bulan',
                            needsInfoButton: false,
                            buttonContent: '',
                            dropdownName: 'Lama Pendidikan (Bulan)',
                            validatorWarning: '',
                            hintContents: '',
                            dropdownValue: lengthOfSchoolMonth,
                            dropdownContents: bulanJenjang,
                            dropdownKey: 'Lama Pendidikan (Bulan)',
                          ),
                          ]
                        ]
                        //Lain-lain
                        else if (goalOfStayingDropdownValue.toString() == 'Lain-lain') ... [
                          FormContainer(
                            labels: 'Keterangan',
                            needsInfoButton: true,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: 'Sebutkan: \nKunjungan Keluarga, Au pair, dll',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',     
                            controller: _description,
                            requiredDataChecker: true,  
                            manualErrorText: 'Harap mengisi kolom keterangan',              
                          ),
                        ] 
                        //Bekerja
                        else if(goalOfStayingDropdownValue.toString() == 'Bekerja') ...[
                        Text(
                            'Bidang Kerja',
                            style: TextStyling.regularTextStyle,
                          ),
                        SizedBox(height: 10,),
                        FormBuilderDropdown<String>(
                          name: "employmentIndustry",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih bidang kerja'; 
                              }
                              saveDropdownData('Bidang Kerja', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentIndustry = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: industries
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        SizedBox(height: 30),
                        if(employmentIndustry.toString() == 'Pertambangan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pertambanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pemerintahanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: kesehatanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: konstruksiName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: industriManufakturName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: orgInterName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: parwisName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                             saveDropdownData('Pekerjaan', value);
                             return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pendidikanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: penerbanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: keuanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pertanianOrPerkebunanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Hukum') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: hukumName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Domestik') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: domestikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: techName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: mediaElektronikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: senbudName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: wirausahaName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: kelautanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: industriModeName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              saveDropdownData('Pekerjaan', value);
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: perikananName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if(employmentIndustry.toString() =='Jasa (Service)') ... [
                            FormContainer(
                              labels: 'Keterangan',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                              controller: _description,
                              requiredDataChecker: true,    
                              manualErrorText: "Harap mengisi kolom keterangan",             
                            ),
                        ],
                        SizedBox(height: 30),
                          FormContainer(
                            labels: 'Nama Perusahaan / Pengguna Jasa',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",   
                            controller: _employerName,
                            requiredDataChecker: true,    
                            manualErrorText: "Harap memeriksa ulang nama perusahaan",             
                          ),
                          SizedBox(height: 30),
                          FormContainer(
                            labels: 'Alamat Pekerjaan di Luar Negeri',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",   
                            controller: _employerAddress,
                            requiredDataChecker: true,   
                            manualErrorText: "Harap memeriksa ulang alamat pekerjaan",             
                          ),
                          SizedBox(height: 30),
                          FormContainer(
                            labels: 'Perusahaan Penyalur / Penempatan',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",    
                            controller: _perusahaanPenyalur,  
                            requiredDataChecker: true,   
                            manualErrorText: "Harap memeriksa ulang perusahaan penyalur",              
                          ),
                          SizedBox(height: 30),
                          FormContainer(
                            labels: 'Agen Penyalur di Luar Negeri',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r"^[a-z A-Z 0-9',.\-]+$",  
                            controller: _agenPenyalur, 
                            requiredDataChecker: true,
                            manualErrorText: "Harap memeriksa ulang perusahaan penyalur",                  
                          ),

                        ]
                        //TODO: FIX CONTROLLER
                        //Belajar 
                        else if(goalOfStayingDropdownValue.toString() == 'Belajar') ... [
                          FormContainer(
                            labels: 'Nama Sekolah',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                            controller: _schoolName,
                            requiredDataChecker: true, 
                            manualErrorText: 'Harap mengisi nama sekolah',                
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Jenjang',
                            style: TextStyling.regularTextStyle,
                          ),
                          FormBuilderDropdown<String>(
                            name: "Jenjang",
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              (value){
                                if(value ==null || value =='' || value.isEmpty){
                                  return 'Harap memilih jenjang sekolah'; 
                                }
                                saveDropdownData('Jenjang', value);
                                return null;
                              }
                            ]),
                            onChanged: (String? newValue){
                              setState((){
                                schoolDegree = newValue!;
                                }
                              );
                            },
                            decoration: noHintFormDecoration,
                            items: jenjang
                            .map((items) => DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                              )).toList()
                          ),
                          SizedBox(height: 30),
                          FormContainer(
                            labels: 'Program / Bidang Studi',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                            controller: _schoolProgram,
                            requiredDataChecker: true,   
                            manualErrorText: 'Harap mengisi program / bidang studi',              
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Lama Pendidikan',
                            style: TextStyling.regularBoldTextStyle,
                          ),
                            SizedBox(height: 5,),
                          DropdownContainer(
                            labels: 'Tahun',
                            needsInfoButton: false,
                            buttonContent: '',
                            dropdownName: 'Lama Pendidikan (Tahun)',
                            validatorWarning: '',
                            hintContents: '',
                            dropdownValue: lengthOfSchoolYear,
                            dropdownContents: tahunJenjang,
                            dropdownKey: 'Lama Pendidikan (Tahun)',
                          ), 
                          DropdownContainer(
                            labels: 'Bulan',
                            needsInfoButton: false,
                            buttonContent: '',
                            dropdownName: 'Lama Pendidikan (Bulan)',
                            validatorWarning: '',
                            hintContents: '',
                            dropdownValue: lengthOfSchoolMonth,
                            dropdownContents: bulanJenjang,
                            dropdownKey: 'Lama Pendidikan (Bulan)',
                          ),  
                        ]
                        //Magang
                        else if (goalOfStayingDropdownValue.toString() == 'Magang') ... [
                            Text(
                            'Bidang Kerja',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                        FormBuilderDropdown<String>(
                          name: "employmentIndustry",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih bidang kerja'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentIndustry = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: industries
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                          SizedBox(height: 30,),
                        
                        if(employmentIndustry.toString() == 'Pertambangan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pertambanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pemerintahanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: kesehatanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: konstruksiName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: industriManufakturName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: orgInterName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: parwisName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pendidikanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: penerbanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: keuanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: pertanianOrPerkebunanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Hukum') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: hukumName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Domestik') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: domestikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: techName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: mediaElektronikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: senbudName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: wirausahaName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: kelautanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: industriModeName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                          Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                          SizedBox(height: 10,),
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Harap memilih pekerjaan'; 
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              employmentName = newValue!;
                              }
                            );
                          },
                          decoration: noHintFormDecoration,
                          items: perikananName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if(employmentIndustry.toString() =='Jasa (Service)') ... [
                            FormContainer(
                              labels: 'Keterangan',
                              needsInfoButton: false,
                              isDataRequired: AutovalidateMode.onUserInteraction,
                              hintContents: '',
                              buttonContent: '',
                              valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                              controller: _description,
                              requiredDataChecker: true, 
                              manualErrorText: 'Harap mengisi kolom keterangan',                
                            ),
                        ],
                        SizedBox(height: 30),
                          FormContainer(
                            labels: 'Nama Perusahaan / Pengguna Jasa',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                            controller: _employerName,
                            requiredDataChecker: true, 
                            manualErrorText: 'Harap mengisi nama perusahaan',                
                          ),
                          SizedBox(height: 30),
                          FormContainer(
                            labels: 'Alamat Pekerjaan di Luar Negeri',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z 0-9,.\-]+$',   
                            controller: _employerAddress,
                            requiredDataChecker: true,   
                            manualErrorText: 'Harap mengisi alamat pekerjaan',            
                          ),
                        ],
                        SizedBox(height: 40,), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackButtons(
                              onPressed: () => goBack(context),
                            ),
                            ForwardButtons(
                              enableButton: true,
                              onPressed: () => getItemAndNavigate(context)
                            ),
                          ],
                        ),
                        SizedBox(height: 50,), 
                      ],
                    ),
                  ),
                ]
              )
            )
          )
        );
      }
    );
  }
}