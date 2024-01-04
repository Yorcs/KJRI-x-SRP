import 'package:flutter/material.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
  String? employmentIndustry;
  String? employmentName;

  var goals =[
    'Anggota Keluarga / Pengikut',
    'Bekerja',
    'Belajar',
    'Magang',
    'Mendampingi Suami / Istri',
    'Lain-lain',
  ];

//Work Industries Variables
  var industries =[
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

  var pertambanganName =[
    'Konsultan',
    'Direktur',
    'Manajer',
    'Teknisi Lapangan',
    'Supervisor',
    'Lainnya',
  ];

  var pemerintahanName =[
    'Home Staff / Diplomat',
    'Lokal Staff pada Perwakilan RI',
    'Staf pada Instansi Lainnya',
    'Staf Instansi Pemerintah Asing',
  ];

  var kesehatanName = [
    'Apoteker',
    'Dokter',
    'Paramedis',
    'Perawat',
    'Lainnya',
  ];

  var konstruksiName =[
    'Arsitek',
    'Konsultan',
    'Supervisor',
    'Buruh',
    'Lainnya',
  ];

  var industriManufakturName =[
    'Direktur',
    'Manajer',
    'Pekerja',
    'Supervisor',
    'Teknisi',
    'Lainnya',
  ];

  var orgInterName =[
    'Konsultan',
    'Manajer',
    'Staf',
    'Lainnya',
  ];

  var parwisName =[
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

  var pendidikanName =[
    'Dosen',
    'Guru',
    'Peneliti',
    'Staf',
    'Lainnya',
  ];

  var penerbanganName =[
    'Ground Staff',
    'Pilot',
    'Pramugari',
    'Teknisi Pesawat',
    'Lainnya',
  ];

  var keuanganName =[
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

  var pertanianOrPerkebunanName =[
    'Pekerja',
    'Manajer',
    'Supervisor',
    'Lainnya'
  ];

  var hukumName =[
    'Pengacara',
    'Konsultan Hukum',
    'Notaris',
    'Arbitor',
    'Staf Administrasi',
    'Lainnya',
  ];

  var domestikName =[
    'PLRT',
    'Supir',
    'Tukang Kebun',
    'Babysitter / Nanny',
    'Caregiver',
    'Cook',
    'Lainnya'
  ];

  var techName =[
    'Programmer',
    'Teknisi',
    'System Analyst',
    'IT Konsultan',
    'IT Art Designer',
    'Administrator',
    'Software Developer'
  ];

  var mediaElektronikName =[
    'Script Writer',
    'Kameraman',
    'Reporter / Wartawan / Jurnalis',
    'Penyiar Radio / TV',
    'Lainnya',
  ];

  var senbudName =[
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

  var wirausahaName =[
    'Investor',
    'Distributor',
    'Importir',
    'Lainnya',
  ];

  var kelautanName =[
    'ABK Kargo',
    'ABK Pesiar',
    'ABK Tanker',
    'ABK Tugboat',
    'Kapten',
  ];

  var industriModeName =[
    'Desainer',
    'Penjait',
    'Model',
    'Lainnya',
  ];

  var perikananName = [
    'Kapten Kapal',
    'ABK Kapal Penangkap Ikan',
    'Nelayan'
  ];


//Studies Variables
  var jenjang =[
    'Sekolah Dasar',
    'Sekolah Menengah Pertama',
    'Sekolah Menengah Atas',
    'Diploma',
    'Sarjana',
    'Pasca Sarjana',
    'Doktor',
    'Lainnya',
  ];

  var bulanJenjang =[
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

  var tahunJenjang =[
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

  getItemAndNavigate (BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GoalOfStayingPage(
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
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: FormBuilder(
                key: _goalOfStayingKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ 
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

                    //Mendampingi Suami / Istri, Anggota Keluarga / Pengikut
                    if (goalOfStayingDropdownValue.toString() =='Mendampingi Suami / Istri' || goalOfStayingDropdownValue == 'Anggota Keluarga / Pengikut') ... [
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
                      Text(
                        'Bidang Kerja',
                        style: TextStyling.regularTextStyle,
                      ),
                    // TODO: Change placeholder
                      DropdownButton(
                        value: employmentIndustry,
                        items: industries.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            employmentIndustry = newValue!;
                          });
                        },
                      ),
                    Text(
                      'Pekerjaan',
                      style: TextStyling.regularTextStyle,
                    ),
                    // TODO: Change placeholder
                    if(employmentIndustry.toString() == 'Pertambangan') ... [
                        DropdownButton(
                          value: employmentName,
                          items: pertambanganName.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              employmentName = newValue!;
                          });
                        },
                      ),
                    ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: pemerintahanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: kesehatanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                        DropdownButton(
                            value: employmentName,
                            items: konstruksiName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                        DropdownButton(
                            value: employmentName,
                            items: industriManufakturName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                        DropdownButton(
                            value: employmentName,
                            items: orgInterName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                        DropdownButton(
                            value: employmentName,
                            items: parwisName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: pendidikanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: penerbanganName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: keuanganName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: pertanianOrPerkebunanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Hukum') ... [
                        DropdownButton(
                            value: employmentName,
                            items: hukumName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Domestik') ... [
                        DropdownButton(
                            value: employmentName,
                            items: domestikName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                        DropdownButton(
                            value: employmentName,
                            items: techName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                        DropdownButton(
                            value: employmentName,
                            items: mediaElektronikName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                        DropdownButton(
                            value: employmentName,
                            items: senbudName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                        DropdownButton(
                            value: employmentName,
                            items: wirausahaName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: kelautanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                        DropdownButton(
                            value: employmentName,
                            items: industriModeName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: perikananName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
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
                    // TODO: Change placeholder
                      DropdownButton(
                        value: employmentIndustry,
                        items: industries.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            employmentIndustry = newValue!;
                          });
                        },
                      ),
                    Text(
                      'Pekerjaan',
                      style: TextStyling.regularTextStyle,
                    ),
                    // TODO: Change placeholder
                    if(employmentIndustry.toString() == 'Pertambangan') ... [
                        DropdownButton(
                          value: employmentName,
                          items: pertambanganName.map((String items) {
                            return DropdownMenuItem(value: items, child: Text(items));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              employmentName = newValue!;
                          });
                        },
                      ),
                    ] else if (employmentIndustry.toString() == 'Pemerintahan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: pemerintahanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Kesehatan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: kesehatanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Konstruksi') ... [
                        DropdownButton(
                            value: employmentName,
                            items: konstruksiName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Industri Manufaktur') ... [
                        DropdownButton(
                            value: employmentName,
                            items: industriManufakturName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Organisasi Internasional') ... [
                        DropdownButton(
                            value: employmentName,
                            items: orgInterName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Industri Perhotelan dan Pariwisata') ... [
                        DropdownButton(
                            value: employmentName,
                            items: parwisName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Pendidikan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: pendidikanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Penerbangan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: penerbanganName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Perbankan dan Keuangan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: keuanganName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Pertanian' || employmentIndustry.toString() == 'Perkebunan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: pertanianOrPerkebunanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Hukum') ... [
                        DropdownButton(
                            value: employmentName,
                            items: hukumName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Domestik') ... [
                        DropdownButton(
                            value: employmentName,
                            items: domestikName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Teknologi Informasi') ... [
                        DropdownButton(
                            value: employmentName,
                            items: techName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Media Elektronik') ... [
                        DropdownButton(
                            value: employmentName,
                            items: mediaElektronikName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Seni dan Budaya') ... [
                        DropdownButton(
                            value: employmentName,
                            items: senbudName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Wirausaha') ... [
                        DropdownButton(
                            value: employmentName,
                            items: wirausahaName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Pelayaran dan Kelautan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: kelautanName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Industri Mode') ... [
                        DropdownButton(
                            value: employmentName,
                            items: industriModeName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
                        ),
                    ] else if (employmentIndustry.toString() == 'Perikanan') ... [
                        DropdownButton(
                            value: employmentName,
                            items: perikananName.map((String items) {
                              return DropdownMenuItem(value: items, child: Text(items));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                employmentName = newValue!;
                            });
                          },
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