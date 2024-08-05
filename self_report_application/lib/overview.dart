import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Overview Page
class OverviewPage extends StatelessWidget {
 const OverviewPage({super.key, required this.proofOfStayingDocFile, required this.permitToStayFile});
 final PlatformFile? proofOfStayingDocFile;
 final PlatformFile? permitToStayFile;

  @override
  Widget build(BuildContext context) {
    return OverviewState(
      proofOfStayingDocFile: proofOfStayingDocFile,
      permitToStayFile: permitToStayFile,
    );
  }
}

class OverviewState extends StatefulWidget {
  const OverviewState({super.key, required this.proofOfStayingDocFile, required this.permitToStayFile});
  final PlatformFile? proofOfStayingDocFile;
  final PlatformFile? permitToStayFile;

  @override
  State<OverviewState> createState() => _OverviewFormState();
}

class _OverviewFormState extends State<OverviewState> {
  final db = FirebaseFirestore.instance;
  //Personal Data
  String name = '';
  String dob = '';
  String passport = '';
  String idNumber = '';
  String gender = '';

  //Living Abroad Data
  String address = '';
  String country = '';
  String postalCode = '';
  String province = '';
  String proofOfStayingDoc = '';
  String proofOfStayingDocName = '';
  String canadianPhoneNumber = '';

  //Living Abroad Data Continued
  String visaNumber = '';
  String visaStartDate = '';
  String visaEndDate = '';
  String permitToStayDoc = '';
  String permitToStayDocName = '';
  String dateOfArrival = '';
  String lengthOfStayMonth = '';
  String lengthOfStayYear = '';

  //Goal of Staying
  String goalOfStaying = '';
  String secondaryGoalOfStaying = '';

  String description = '';

  String employmentName = '';
  String employmentIndustry = '';
  String employerName = '';
  String employerAddress = '';
  String agenPenyalur = '';
  String perusahaanPenyalur = '';

  String schoolName = '';
  String schoolProgram = '';
  String schoolDegree = '';
  String lengthOfSchoolMonth = '';
  String lengthOfSchoolYear = '';

  //Emergency Contact Abroad
  String emergencyContactAbroadName = '';
  String emergencyContactAbroadEmail = '';
  String emergencyContactAbroadPhone = '';
  String emergencyContactAbroadRelationship = ''; 

  //Emergency Contact Indonesia
  String emergencyContactIndoName = '';
  String emergencyContactIndoEmail = '';
  String emergencyContactIndoPhone = '';
  String emergencyContactIndoRelationship = '';

  Future<(String, String, String, String, String,
   String, String, String, String, String, String, String,
   String, String, String, String, String, String, String, String,
   String, String, String, String, String, String, String, String, String, 
   String, String, String, String, String,
   String, String, String, String,
   String, String, String, String
   )> getSharedPrefs() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //Personal Data
    String nameString = prefs.getString('Nama Lengkap') ?? '';
    String dobString = prefs.getString('Tanggal Lahir') ??'';
    String passportString = prefs.getString('Nomor Paspor') ?? '';
    String idNumberString = prefs.getString('NIK') ?? '';
    String genderString = prefs.getString('Jenis Kelamin') ?? '';

    // //Living Abroad Data
    String addressString = prefs.getString('Alamat Lengkap di Luar Negeri') ?? '';
    String countryString = prefs.getString('Negara') ?? 'Kanada';
    String postalCodeString = prefs.getString('Kode Pos') ?? '';
    String provinceDropdownValueString = prefs.getString('Provinsi') ?? '';
    String proofOfStayingDocString = prefs.getString('Dokumen Bukti Tinggal') ?? '';
    String proofOfStayingDocNameString = prefs.getString('Nama File Dokumen Bukti Tinggal') ?? '';
    String canadianPhoneNumberString = prefs.getString('Nomor Telepon di Canada') ??'';

    // //Living Abroad Data Continued
    String visaNumberString = prefs.getString('Nomor Visa') ?? '';
    String visaEndDateString = prefs.getString('Expired Visa') ??'';
    String visaStartDateString = prefs.getString('Start Visa') ?? '';
    String permitToStayString = prefs.getString('Ijin Tinggal') ?? '';
    String permitToStayNameString = prefs.getString('Nama File Ijin Tinggal') ?? '';
    String dateOfArrivalString = prefs.getString('Waktu Kedatangan') ?? '';
    String lengthOfStayYearString = prefs.getString('Perkiraan Lama Menetap (Tahun)') ?? '';
    String lengthOfStayMonthString = prefs.getString('Perkiraan Lama Menetap (Bulan)') ?? '';

    // //Goal Of Staying
    String goalOfStayingDropdownValueString = prefs.getString('Tujuan Menetap') ?? '';
    String secondaryGoalOfStayingDropdownValueString = prefs.getString('Tujuan Menetap Lainnya') ?? '';

    String descriptionString = prefs.getString('Keterangan') ?? '';

    String employerNameString = prefs.getString('Nama Perusahaan / Pengguna Jasa') ??'';
    String employerAddressString = prefs.getString('Alamat Pekerjaan di Luar Negeri') ?? '';
    String employmentIndustryString = prefs.getString('Bidang Kerja') ?? '';
    String employmentNameString = prefs.getString('Pekerjaan') ?? '';
    String perusahaanPenyalurString = prefs.getString('Perusahaan Penyalur / Penempatan') ?? '';
    String agenPenyalurString = prefs.getString('Agen Penyalur di Luar Negeri') ?? '';

    String schoolNameString = prefs.getString('Nama Sekolah') ?? '';
    String schoolDegreeString = prefs.getString('Jenjang') ?? '';
    String schoolProgramString = prefs.getString('Program / Bidang Studi') ?? '';
    String lengthOfSchoolYearString = prefs.getString('Lama Pendidikan (Tahun)') ?? '';
    String lengthOfSchoolMonthString = prefs.getString('Lama Pendidikan (Bulan)') ?? '';

    // //Emergency Contact Abroad
    String emergencyContactAbroadNameString = prefs.getString('Nama Kontak Darurat di Luar Negeri') ?? '';
    String emergencyContactAbroadEmailString = prefs.getString('Email Kontak Darurat di Luar Negeri') ??'';
    String emergencyContactAbroadPhoneString = prefs.getString('Telepon Kontak Darurat di Luar Negeri') ?? '';
    String emergencyContactAbroadRelationshipString = prefs.getString('Hubungan Kontak Darurat di Luar Negeri') ?? '';

    // //Emergency Contact Indonesia
    String emergencyContactIndoNameString = prefs.getString('Nama Kontak Darurat di Indonesia') ?? '';
    String emergencyContactIndoEmailString = prefs.getString('Email Kontak Darurat di Indonesia') ??'';
    String emergencyContactIndoPhoneString = prefs.getString('Telepon Kontak Darurat di Indonesia') ?? '';
    String emergencyContactIndoRelationshipString = prefs.getString('Hubungan Kontak Darurat di Indonesia') ?? '';

    setState(() {
      //Personal Data
      name = nameString;
      dob = dobString;
      passport = passportString;
      idNumber = idNumberString;
      gender = genderString;

      //Living Abroad Data
      address = addressString;
      country = countryString;
      postalCode = postalCodeString;
      province = provinceDropdownValueString;
      proofOfStayingDoc = proofOfStayingDocString;
      proofOfStayingDocName = proofOfStayingDocNameString;
      canadianPhoneNumber = canadianPhoneNumberString;

      //Living Abroad Data Continue
      visaNumber = visaNumberString;
      visaStartDate = visaStartDateString;
      visaEndDate = visaEndDateString;
      permitToStayDoc = permitToStayString;
      permitToStayDocName = permitToStayNameString;
      dateOfArrival = dateOfArrivalString;
      lengthOfStayYear = lengthOfStayYearString;
      lengthOfStayMonth = lengthOfStayMonthString;

      //Goal Of Staying
      goalOfStaying = goalOfStayingDropdownValueString;
      secondaryGoalOfStaying = secondaryGoalOfStayingDropdownValueString;

      description = descriptionString;

      employmentIndustry = employmentIndustryString;
      employmentName = employmentNameString;
      employerName = employerNameString;
      employerAddress = employerAddressString;
      perusahaanPenyalur = perusahaanPenyalurString;
      agenPenyalur = agenPenyalurString;

      schoolName = schoolNameString;
      schoolDegree = schoolDegreeString;
      schoolProgram = schoolProgramString;
      lengthOfSchoolYear = lengthOfSchoolYearString;
      lengthOfSchoolMonth = lengthOfSchoolMonthString;

      //Emergency Contact Abroad
      emergencyContactAbroadName = emergencyContactAbroadNameString;
      emergencyContactAbroadEmail = emergencyContactAbroadEmailString;
      emergencyContactAbroadPhone = emergencyContactAbroadPhoneString;
      emergencyContactAbroadRelationship = emergencyContactAbroadRelationshipString;

      //Emergency Contact Indo
      emergencyContactIndoName = emergencyContactIndoNameString;
      emergencyContactIndoEmail = emergencyContactIndoEmailString;
      emergencyContactIndoPhone = emergencyContactIndoPhoneString;
      emergencyContactIndoRelationship = emergencyContactIndoRelationshipString;
    });

    return(name, dob, passport, idNumber, gender,
     address, country, postalCode, province, proofOfStayingDoc, proofOfStayingDocName, canadianPhoneNumber,
     visaNumber, visaStartDate, visaEndDate, permitToStayDoc, permitToStayDocName, dateOfArrival,lengthOfStayMonth, lengthOfStayYear,
     goalOfStaying, secondaryGoalOfStaying, description, employmentIndustry, employmentName, employerName, employerAddress, perusahaanPenyalur, agenPenyalur,
     schoolName, schoolDegree, schoolProgram, lengthOfSchoolMonth, lengthOfSchoolYear,
     emergencyContactAbroadName, emergencyContactAbroadEmail, emergencyContactAbroadPhone, emergencyContactAbroadRelationship,
     emergencyContactIndoName, emergencyContactIndoEmail, emergencyContactIndoPhone, emergencyContactIndoRelationship,
     );
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
  }


  Future uploadFile(PlatformFile? pickedFile) async {
    try{
      final path = 'files/$name/${pickedFile!.name}';
      final file = File(pickedFile.path!);
      final ref = FirebaseStorage.instance.ref().child(path);

      UploadTask uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() {});

      final String urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;

    } on FirebaseException catch (e){
      print("Failed with error '${e.code}': ${e.message}");
      return 'null';
    }

  }

  goBack(BuildContext context)=> Navigator.pop(context);
  Future <void> getItemAndNavigate (BuildContext context) async {
    final user = <String, dynamic>{
      //Personal Data
      "Nama Lengkap" : name,
      "Tanggal Lahir" : dob,
      "Nomor Paspor" : passport,
      "NIK" : idNumber,
      "Jenis Kelamin" : gender,

      //Living Abroad Data
      "Alamat Lengkap di Luar Negeri" : address,
      "Negara": country,
      "Kode Pos": postalCode,
      "Provinsi": province,
      "Dokumen Bukti Tinggal" : uploadFile(widget.permitToStayFile),

      // //Living Abroad Data Continue
      "Nomor Visa": visaNumber,
      "Start Visa" : visaStartDate,
      "Expired Visa" : visaEndDate,
      "Waktu Kedatangan" : dateOfArrival,
      "Perkiraan Lama Menetap (Tahun)" : lengthOfStayYear,
      "Perkiraan Lama Menetap (Bulan)" : lengthOfStayMonth,
      "Ijin Tinggal" : uploadFile(widget.proofOfStayingDocFile),

      // //Goal of Staying
      "Tujuan Menetap": goalOfStaying,
      "Tujuan Menetap Lainnya": secondaryGoalOfStaying,

      "Keterangan": description,

      "Nama Perusahaan / Pengguna Jasa": employerName,
      "Alamat Pekerjaan di Luar Negeri": employerAddress,
      "Bidang Kerja": employmentIndustry,
      "Pekerjaan": employmentName,
      "Perusahaan Penyalur / Penempatan": perusahaanPenyalur,
      "Agen Penyalur di Luar Negeri": agenPenyalur,

      "Nama Sekolah": schoolName,
      "Jenjang" : schoolDegree,
      "Program / Bidang Studi" : schoolProgram,
      "Lama Pendidikan (Tahun)" : lengthOfSchoolYear,
      "Lama Pendidikan (Bulan)" : lengthOfSchoolMonth,

      //Emergency Contact Abroad

      //Emergency Contact Indonesia


      "timestamp" : FieldValue.serverTimestamp(), //NECESSARY TO QUERY THE DATA IN GSHEETS
      
    };
    await db.collection("datas").add(user).then((DocumentReference doc) => print('DocumentSnapshot added with ID:${doc.id}'));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BuildHeader(
                  pageName: 'IDENTITAS',
                  assetName: 'images/identitas-active.svg',
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 30,),

                      //Identity Section
                      Text(
                        'IDENTITAS',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Nama Lengkap', 
                        content: name,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'Tanggal Lahir', 
                        content: dob,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'Nomor Paspor', 
                        content: passport,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'NIK', 
                        content: idNumber,
                      ),
                      SizedBox(height: 30),
                      OverviewLabelWidget(
                        labelName: 'Jenis Kelamin', 
                        content: gender,
                      ),
                      SizedBox(height: 30,),

                      // //Living Abroad Data & Living Abroad Data Continue section
                      Text(
                        'DATA LUAR NEGERI',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),

                      // //Living Abroad Data
                      OverviewLabelWidget(
                        labelName: 'Alamat Lengkap di Luar Negeri', 
                        content: address,
                      ),
                      SizedBox(height: 30,),
                      OverviewCombinedLabelWidget(
                        labelName1: 'Negara',
                        labelName2: 'Propinsi',
                        content1: country,
                        content2: province,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Kode Pos', 
                        content: postalCode,
                      ),                      
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Telepon', 
                        content: canadianPhoneNumber,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Dokumen Bukti Tinggal', 
                        content: proofOfStayingDocName,
                      ),
                      SizedBox(height: 30,),

                      // //Living Abroad Data Continued
                      OverviewLabelWidget(
                        labelName: 'Waktu Kedatangan', 
                        content: dateOfArrival,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Ijin Tinggal', 
                        content: permitToStayDocName,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Nomor Visa', 
                        content: visaNumber,
                      ),
                      SizedBox(height: 30,),
                      OverviewHeaderLabelWidget(
                        headerLabelName: 'Masa Berlaku Visa', 
                        labelName1: 'Dari',
                        content1: visaStartDate,
                        labelName2: 'Sampai',
                        content2: visaEndDate,
                      ),
                      SizedBox(height: 30,),
                      OverviewHeaderLabelWidget(
                        headerLabelName: 'Perkiraan Lama Menetap', 
                        labelName1: 'Dari',
                        content1: visaStartDate,
                        labelName2: 'Sampai',
                        content2: visaEndDate,
                      ),
                      SizedBox(height: 30,),

                      // //Goal of Staying Section
                      Text(
                        'TUJUAN MENETAP',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Tujuan Menetap', 
                        content: goalOfStaying,
                      ),
                      SizedBox(height: 30,),
                      if(goalOfStaying == 'Lain-lain' || goalOfStaying == 'Mendampingi Suami / Istri')...[
                        OverviewLabelWidget(
                          labelName: 'Keterangan', 
                          content: description,
                        ),
                      ]
                      else if(goalOfStaying == 'Anggota Keluarga / Pengikut') ... [
                        if(secondaryGoalOfStaying == 'Lain-lain')...[
                          OverviewLabelWidget(
                            labelName: 'Keterangan', 
                            content: description,
                          ),
                        ]
                        else if(secondaryGoalOfStaying == 'Bekerja')...[
                          if(employmentIndustry == 'Jasa (Service)')...[
                            OverviewLabelWidget(
                              labelName: 'Keterangan', 
                              content: description,
                            ),
                          ]
                          else...[
                            OverviewLabelWidget(
                              labelName: 'Bidang Kerja', 
                              content: employmentIndustry,
                            ),
                            SizedBox(height: 30,),
                            OverviewLabelWidget(
                              labelName: 'Pekerjaan', 
                              content: employmentName,
                            ),
                          ],
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Nama Perusahaan / Pengguna Jasa', 
                            content: employerName,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Alamat Pekerjaan di Luar Negeri', 
                            content: employerName,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Perusahaan Penyalur / Penempatan', 
                            content: perusahaanPenyalur,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Agen Penyalur di Luar Negeri', 
                            content: agenPenyalur,
                          ),
                        ]
                        else if(secondaryGoalOfStaying == 'Belajar')...[
                          OverviewLabelWidget(
                            labelName: 'Nama Sekolah', 
                            content: schoolName,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Jenjang', 
                            content: schoolDegree,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Program / Bidang Studi', 
                            content: schoolProgram,
                          ),
                          SizedBox(height: 30,),
                          OverviewHeaderLabelWidget(
                            headerLabelName: 'Lama Pendidikan', 
                            labelName1: 'Tahun',
                            content1: lengthOfSchoolYear,
                            labelName2: 'Bulan',
                            content2: lengthOfSchoolMonth,
                          ),
                        ]
                      ]
                      else if(goalOfStaying == 'Bekerja')...[
                        if(employmentIndustry == 'Jasa (Service)')...[
                          OverviewLabelWidget(
                            labelName: 'Keterangan', 
                            content: description,
                          ),
                        ]
                        else...[
                          OverviewLabelWidget(
                            labelName: 'Bidang Kerja', 
                            content: employmentIndustry,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Pekerjaan', 
                            content: employmentName,
                          ),
                        ],
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Nama Perusahaan / Pengguna Jasa', 
                          content: employerName,
                        ),
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Alamat Pekerjaan di Luar Negeri', 
                          content: employerName,
                        ),
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Perusahaan Penyalur / Penempatan', 
                          content: perusahaanPenyalur,
                        ),
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Agen Penyalur di Luar Negeri', 
                          content: agenPenyalur,
                        ),
                      ]
                      else if(goalOfStaying =='Belajar')...[
                        OverviewLabelWidget(
                          labelName: 'Nama Sekolah', 
                          content: schoolName,
                        ),
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Jenjang', 
                          content: schoolDegree,
                        ),
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Program / Bidang Studi', 
                          content: schoolProgram,
                        ),
                        SizedBox(height: 30,),
                        OverviewHeaderLabelWidget(
                          headerLabelName: 'Lama Pendidikan', 
                          labelName1: 'Tahun',
                          content1: lengthOfSchoolYear,
                          labelName2: 'Bulan',
                          content2: lengthOfSchoolMonth,
                        ),
                      ]
                      else if(goalOfStaying == 'Magang')...[
                        if(employmentIndustry == 'Jasa (Service)')...[
                          OverviewLabelWidget(
                            labelName: 'Keterangan', 
                            content: description,
                          ),
                        ]
                        else...[
                          OverviewLabelWidget(
                            labelName: 'Bidang Kerja', 
                            content: employmentIndustry,
                          ),
                          SizedBox(height: 30,),
                          OverviewLabelWidget(
                            labelName: 'Pekerjaan', 
                            content: employmentName,
                          ),
                        ],
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Nama Perusahaan / Pengguna Jasa', 
                          content: employerName,
                        ),
                        SizedBox(height: 30,),
                        OverviewLabelWidget(
                          labelName: 'Alamat Pekerjaan di Luar Negeri', 
                          content: employerName,
                        ),
                      ],
                      SizedBox(height: 30,),

                      // //Emergency Contact Section
                      Text(
                        'KONTAK DARURAT',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),

                      // //Emergency Contact Abroad
                      OverviewHeaderWidget(
                        headerLabelName: 'Di Luar Negeri'
                      ),
                      OverviewLabelWidget(
                        labelName: 'Nama', 
                        content: emergencyContactAbroadName,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Hubungan', 
                        content: emergencyContactAbroadRelationship,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Email', 
                        content: emergencyContactAbroadEmail,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Telepon', 
                        content: emergencyContactAbroadPhone,
                      ),
                      SizedBox(height: 30,),

                      // //Emergency Contact Indonesia
                      OverviewHeaderWidget(
                        headerLabelName: 'Di Indonesia'
                      ),
                      OverviewLabelWidget(
                        labelName: 'Nama', 
                        content: emergencyContactIndoName,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Hubungan', 
                        content: emergencyContactIndoRelationship,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Email', 
                        content: emergencyContactIndoEmail,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Telepon', 
                        content: emergencyContactIndoPhone,
                      ),
                      SizedBox(height: 40,),                     
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackButtons(
                              onPressed: () => goBack(context),
                            ),
                            ForwardButtons(
                              onPressed: () => uploadFile(widget.permitToStayFile)
                            ),
                          ],
                        ),
                        SizedBox(height: 50,), 
                    ]
                  )
                )
              ]
            )
          )
        );
      }
    );
  }
}