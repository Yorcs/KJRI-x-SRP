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

class _GoalOfStayingFormState extends State<GoalOfStayingForm> {
  final _goalOfStayingKey = GlobalKey<FormBuilderState>();
  final TextEditingController _descriptionOrAddress = TextEditingController();
  final TextEditingController _perusahaanPenyalur = TextEditingController();
  final TextEditingController _agenPenyalur = TextEditingController();
  final TextEditingController _employerName = TextEditingController();
  final TextEditingController _employerAddress = TextEditingController();

  late String descriptionOrAddressString;
  late String employerNameString;
  late String employerAddressString;
  late String goalOfStayingDropdownValueString;
  late String employmentIndustryString;
  late String employmentNameString;
  late String perusahaanPenyalurString;
  late String agenPenyalurString;

  Future<(String, String, String, String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    descriptionOrAddressString = prefs.getString('Keterangan') ?? '';
    employerNameString = prefs.getString('Nama Perusahaan / Pengguna Jasa') ??'';
    employerAddressString = prefs.getString('Alamat Pekerjaan di Luar Negeri') ?? '';
    goalOfStayingDropdownValueString = prefs.getString('Tujuan Menetap') ?? '';
    employmentIndustryString = prefs.getString('Bidang Kerja') ?? '';
    employmentNameString = prefs.getString('Pekerjaan') ?? '';
    perusahaanPenyalurString = prefs.getString('Perusahaan Penyalur / Penempatan') ?? '';
    agenPenyalurString = prefs.getString('Agen Penyalur di Luar Negeri') ?? '';

    setState(() {
      _descriptionOrAddress.text = descriptionOrAddressString;
      _employerName.text = employerNameString;
      _employerAddress.text = employerAddressString;
      _perusahaanPenyalur.text = perusahaanPenyalurString;
      _agenPenyalur.text = agenPenyalurString;
      goalOfStayingDropdownValue = goalOfStayingDropdownValueString;
      employmentIndustry = employmentIndustryString;
      employmentName = employmentNameString;
    });

    return (employerNameString, employerAddressString, descriptionOrAddressString, perusahaanPenyalurString, agenPenyalurString, goalOfStayingDropdownValueString, employmentIndustryString, employerNameString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Keterangan', _descriptionOrAddress.text);
    await prefs.setString('Nama Perusahaan / Pengguna Jasa', _employerName.text);
    await prefs.setString('Alamat Pekerjaan di Luar Negeri', _employerAddress.text);
    await prefs.setString('Perusahaan Penyalur / Penempatan', _perusahaanPenyalur.text);
    await prefs.setString('Agen Penyalur di Luar Negeri', _agenPenyalur.text);
    await prefs.setString('Bidang Kerja', employmentIndustry.toString());
    await prefs.setString('Pekerjaan', employmentName.toString());
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _descriptionOrAddress.addListener(() {
      final String text = _descriptionOrAddress.text;
      _descriptionOrAddress.value = _descriptionOrAddress.value.copyWith(
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
  }

  @override
  void dispose(){
    _descriptionOrAddress.dispose();
    _employerName.dispose();
    _employerAddress.dispose();
    super.dispose();
  }
  

  String? goalOfStayingDropdownValue;
  String? employmentIndustry;
  String? employmentName;

  List<String> goals =[
    'Anggota Keluarga / Pengikut',
    'Bekerja',
    'Belajar',
    'Magang',
    'Mendampingi Suami / Istri',
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
          //TODO: Readjust margin and padding
          body: SingleChildScrollView(
            child: FormBuilder(
              key: _goalOfStayingKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[ 
                  BuildHeader(
                    pageName: 'Tujuan Menetap',
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
                        FormBuilderDropdown<String>(
                          name: "goals",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select a goal of staying'; //TODO: Change prompt
                              }
                              return null;
                            }
                          ]),
                          onChanged: (String? newValue){
                            setState((){
                              goalOfStayingDropdownValue = newValue!;
                              }
                            );
                          },
                          decoration: InputDecoration(
                            hintText: 'Pilih Tujuan',
                          ),
                          items: goals
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        //Mendampingi Suami / Istri, Anggota Keluarga / Pengikut
                        if (goalOfStayingDropdownValue.toString() =='Mendampingi Suami / Istri' || goalOfStayingDropdownValue.toString() == 'Anggota Keluarga / Pengikut') ... [
                          FormContainer(
                            labels: 'Keterangan',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,
                            requiredDataChecker: true,                 
                          ),
                        ] 
                        //Lain-lain
                        else if (goalOfStayingDropdownValue.toString() == 'Lain-lain') ... [
                          FormContainer(
                            labels: 'Sebutkan: Kunjungan Keluarga, Au pair, dll',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,
                            requiredDataChecker: true,               
                          ),
                        ] 
                        //Bekerja
                        else if(goalOfStayingDropdownValue.toString() == 'Bekerja') ...[
                        // TODO: Change hint contents
                        Text(
                            'Bidang Kerja',
                            style: TextStyling.regularTextStyle,
                          ),
                        FormBuilderDropdown<String>(
                          name: "employmentIndustry",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your industry'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Pekerjaan',
                          ),
                          items: industries
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                        // TODO: Change placeholder
                        if(employmentIndustry.toString() == 'Pertambangan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pertambanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pemerintahanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: kesehatanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: konstruksiName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: industriManufakturName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: orgInterName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: parwisName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pendidikanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: penerbanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: keuanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pertanianOrPerkebunanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Hukum') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: hukumName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Domestik') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: domestikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: techName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: mediaElektronikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: senbudName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: wirausahaName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: kelautanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: industriModeName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
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
                              valueConstraints: r'^[a-z A-Z]+$',   
                              controller: _descriptionOrAddress,
                              requiredDataChecker: true,                 
                            ),
                        ],
                          FormContainer(
                            labels: 'Nama Perusahaan / Pengguna Jasa',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,
                            requiredDataChecker: true,                 
                          ),
                          FormContainer(
                            labels: 'Alamat pekerjaan di Luar negeri',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,
                            requiredDataChecker: true,               
                          ),
                          FormContainer(
                            labels: 'Perusahaan Penyalur / Penempatan',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,  
                            requiredDataChecker: true,               
                          ),
                          FormContainer(
                            labels: 'Agen Penyalur di Luar Negeri',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress, 
                            requiredDataChecker: true,                
                          ),

                        ]
                        //Belajar 
                        else if(goalOfStayingDropdownValue.toString() == 'Belajar') ... [

                        ]
                        //Magang
                        else if (goalOfStayingDropdownValue.toString() == 'Magang') ... [
                            Text(
                            'Bidang Kerja',
                            style: TextStyling.regularTextStyle,
                          ),
                        FormBuilderDropdown<String>(
                          name: "employmentIndustry",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your industry'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Pekerjaan',
                          ),
                          items: industries
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        Text(
                            'Pekerjaan',
                            style: TextStyling.regularTextStyle,
                          ),
                        // TODO: Change placeholder
                        if(employmentIndustry.toString() == 'Pertambangan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pertambanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pemerintahanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: kesehatanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: konstruksiName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: industriManufakturName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: orgInterName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: parwisName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pendidikanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: penerbanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: keuanganName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: pertanianOrPerkebunanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Hukum') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: hukumName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Domestik') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: domestikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: techName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: mediaElektronikName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: senbudName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: wirausahaName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: kelautanName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
                          items: industriModeName
                          .map((items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                            )).toList()
                        ),
                        ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                          FormBuilderDropdown<String>(
                          name: "employmentName",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            (value){
                              if(value ==null || value =='' || value.isEmpty){
                                return 'Please select your job'; //TODO: Change prompt
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
                          decoration: InputDecoration(
                            hintText: 'Pilih Jenis Jabatan',
                          ),
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
                              valueConstraints: r'^[a-z A-Z]+$',   
                              controller: _descriptionOrAddress,
                              requiredDataChecker: true,                 
                            ),
                        ],
                          FormContainer(
                            labels: 'Nama Perusahaan / Pengguna Jasa',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,
                            requiredDataChecker: true,                 
                          ),
                          FormContainer(
                            labels: 'Alamat pekerjaan di Luar negeri',
                            needsInfoButton: false,
                            isDataRequired: AutovalidateMode.onUserInteraction,
                            hintContents: '',
                            buttonContent: '',
                            valueConstraints: r'^[a-z A-Z]+$',   
                            controller: _descriptionOrAddress,
                            requiredDataChecker: true,               
                          ),
                        ]
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