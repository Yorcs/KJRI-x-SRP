import 'package:flutter/material.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/styling.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Overview Page
class OverviewPage extends StatelessWidget {
 const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OverviewState();
  }
}

class OverviewState extends StatefulWidget {
  @override
  State<OverviewState> createState() => _OverviewFormState();
}

class _OverviewFormState extends State<OverviewState> {
  //Personal Data
  late String name;
  late String dob;
  late String passport;
  late String idNumber;
  late String gender;

  //Living Abroad Data
  late String address;
  late String country;
  late String postalCode;
  late String province;
  late String proofOfStayingDoc;
  late String proofOfStayingDocName;
  late String canadianAreaCode;
  late String canadianPhoneNumber;

  //Living Abroad Data Continued
  late String visaNumber;
  late String visaStartDate;
  late String visaEndDate;
  late String permitToStayDoc;
  late String permitToStayDocName;
  late String dateOfArrival;
  late String lengthOfStayMonth;
  late String lengthOfStayYear;

  //Goal of Staying
  late String goalOfStaying;
  late String secondaryGoalOfStaying;

  late String description;

  late String employmentName;
  late String employmentIndustry;
  late String employerName;
  late String employerAddress;
  late String agenPenyalur;
  late String perusahaanPenyalur;

  late String schoolName;
  late String schoolProgram;
  late String schoolDegree;
  late String lengthOfSchoolMonth;
  late String lengthOfSchoolYear;

  //Emergency Contact Abroad
  late String emergencyContactAbroadName;
  late String emergencyContactAbroadEmail;
  late String emergencyContactAbroadPhone;
  late String emergencyContactAbroadRelationship;

  //Emergency Contact Indonesia
  late String emergencyContactIndoName;
  late String emergencyContactIndoEmail;
  late String emergencyContactIndoPhone;
  late String emergencyContactIndoRelationship;

  Future<(String, String, String, String, String,
   String, String, String, String, String, String, String, String,
   String, String, String, String, String, String, String, String,
   String, String, String, String, String, String, String, String, String, 
   String, String, String, String, String,
   String, String, String, String,
   String, String, String, String)> getSharedPrefs() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //Personal Data
    String nameString = prefs.getString('Nama Lengkap') ?? '';
    String dobString = prefs.getString('Tanggal Lahir') ??'';
    String passportString = prefs.getString('Nomor Paspor') ?? '';
    String idNumberString = prefs.getString('NIK') ?? '';
    String genderString = prefs.getString('Jenis Kelamin') ?? '';

    //Living Abroad Data
    String addressString = prefs.getString('Alamat Lengkap di Luar Negeri') ?? '';
    String countryString = prefs.getString('Negara') ?? 'Kanada';
    String postalCodeString = prefs.getString('Kode Pos') ?? '';
    String provinceDropdownValueString = prefs.getString('Provinsi') ?? '';
    String proofOfStayingDocString = prefs.getString('Dokumen Bukti Tinggal') ?? '';
    String proofOfStayingDocNameString = prefs.getString('Nama File Dokumen Bukti Tinggal') ?? '';
    String canadianAreaCodeString = prefs.getString('Nomor Area Canada') ??'';
    String canadianPhoneNumberString = prefs.getString('Nomor Telepon Canada') ??'';

    //Living Abroad Data Continued
    String visaNumberString = prefs.getString('Nomor Visa') ?? '';
    String visaEndDateString = prefs.getString('Expired Visa') ??'';
    String visaStartDateString = prefs.getString('Start Visa') ?? '';
    String permitToStayString = prefs.getString('Ijin Tinggal') ?? '';
    String permitToStayNameString = prefs.getString('Nama File Ijin Tinggal') ?? '';
    String dateOfArrivalString = prefs.getString('Waktu Kedatangan') ?? '';
    String lengthOfStayYearString = prefs.getString('Perkiraan Lama Menetap (Tahun)') ?? '';
    String lengthOfStayMonthString = prefs.getString('Perkiraan Lama Menetap (Bulan)') ?? '';

    //Goal Of Staying
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

    //Emergency Contact Abroad
    String emergencyContactAbroadNameString = prefs.getString('Nama Kontak Darurat di Luar Negeri') ?? '';
    String emergencyContactAbroadEmailString = prefs.getString('Email Kontak Darurat di Luar Negeri') ??'';
    String emergencyContactAbroadPhoneString = prefs.getString('Telepon Kontak Darurat di Luar Negeri') ?? '';
    String emergencyContactAbroadRelationshipString = prefs.getString('Hubungan Kontak Darurat di Luar Negeri') ?? '';

    //Emergency Contact Indonesia
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
      canadianAreaCode = canadianAreaCodeString;
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
     address, country, postalCode, province, proofOfStayingDoc, proofOfStayingDocName, canadianAreaCode, canadianPhoneNumber,
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

                      //Living Abroad Data & Living Abroad Data Continue section
                      Text(
                        'DATA LUAR NEGERI',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),

                      //Living Abroad Data
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
                      OverviewLabelCombinedStringWidget(
                        labelName: 'Telepon', 
                        content1: canadianAreaCode,
                        content2: canadianPhoneNumber,
                      ),
                      SizedBox(height: 30,),
                      OverviewLabelWidget(
                        labelName: 'Dokumen Bukti Tinggal', 
                        content: proofOfStayingDocName,
                      ),
                      SizedBox(height: 30,),

                      //Living Abroad Data Continued
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
                        content: proofOfStayingDocName,
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

                      //Goal of Staying Section
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

                      //Emergency Contact Section
                      Text(
                        'KONTAK DARURAT',
                        style: TextStyling.regularBoldTextStyle,
                      ),
                      SizedBox(height: 30,),

                      //Emergency Contact Abroad
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

                      //Emergency Contact Indonesia
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
                      SizedBox(height: 30,),
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