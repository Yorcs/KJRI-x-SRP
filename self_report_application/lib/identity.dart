import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/living_abroad_data.dart';
import 'package:self_report_application/styling.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Identity Page
class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdentityForm();
  }
}

class IdentityForm extends StatefulWidget {
  @override
  State<IdentityForm> createState() => _IdentityFormState();
}

class _IdentityFormState extends State<IdentityForm> {
  final _identityKey = GlobalKey<FormBuilderState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dOB = TextEditingController();
  final TextEditingController _passport = TextEditingController();
  final TextEditingController _iDNumber = TextEditingController();

  late String nameString;
  late String dobString;
  late String passportString;
  late String idNumberString;
  late String dropdownValueString;

  Future<(String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    nameString = prefs.getString('Nama Lengkap') ?? '';
    dobString = prefs.getString('Tanggal Lahir') ??'';
    passportString = prefs.getString('Nomor Paspor') ?? '';
    idNumberString = prefs.getString('NIK') ?? '';
    dropdownValueString = prefs.getString('Jenis Kelamin') ?? '';

    setState(() {
      _name.text = nameString;
      _dOB.text = dobString;
      _passport.text = passportString;
      _iDNumber.text = idNumberString;
      dropdownValue = dropdownValueString;
    });

    return (nameString, dobString, passportString, idNumberString, dropdownValueString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Nama Lengkap', _name.text);
    await prefs.setString('Tanggal Lahir', _dOB.text);
    await prefs.setString('Nomor Paspor', _passport.text);
    await prefs.setString('NIK', _iDNumber.text);
    await prefs.setString('Jenis Kelamin', dropdownValue ?? '');
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _name.addListener(() {
      final String text = _name.text.toString();
      _name.value = _name.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _dOB.addListener(() {
      final String text = _dOB.text;
      _dOB.value = _dOB.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _passport.addListener(() {
      final String text = _passport.text;
      _passport.value = _passport.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _iDNumber.addListener(() {
      final String text = _iDNumber.text;
      _iDNumber.value = _iDNumber.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }
  @override
  void dispose(){
    _name.dispose();
    _dOB.dispose();
    _passport.dispose();
    _iDNumber.dispose();
    super.dispose();
  }

  String? dropdownValue;
  List<String> genderOptions = [
    'Laki-laki',
    'Perempuan',
  ];

  Future <void> getItemAndNavigate (BuildContext context) async {
    final isValid = _identityKey.currentState!.validate();
    if(!isValid){
    } else {
      saveData();
      await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LivingAbroadDataPage(
          // name: _name.toString(),
          // passport: _passport.toString(),
          // idNumber: _iDNumber.toString(),
          // dob: _dOB.toString(), 
          // gender: dropdownValue.toString(),      
        )
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
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: FormBuilder(
                key: _identityKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BuildHeader(
                    pageName: 'Identitas',
                    opacity1: 1,
                    opacity2: 0.5,
                    opacity3: 0.5,
                    opacity4: 0.5,
                    changeColor1: Colors.white,
                    changeColor2: Colors.blue,
                    changeColor3: Colors.blue,
                    changeColor4: Colors.blue,
                    ),
                    SizedBox(height: 20,),
                    FormContainer(
                    labels: 'Nama Lengkap',
                    needsInfoButton: true,
                    isDataRequired: AutovalidateMode.onUserInteraction,
                    hintContents: '',
                    requiredDataChecker: true,
                    buttonContent: 'Diisi dengan nama depan, nama tengah, dan nama belakang (jika ada).\n\nContoh: \nArena Sri Viktoria',
                    valueConstraints: r'^[a-zA-Z]+$',   
                    controller: _name,                 
                    ),
                    SizedBox(height: 30,),
                    FormContainer(
                      labels: 'Tanggal Lahir',
                      needsInfoButton: false,
                      isDataRequired: AutovalidateMode.onUserInteraction,
                      hintContents: 'DD/MM/YYYY',
                      buttonContent: '',
                      requiredDataChecker: true,
                      valueConstraints: r'[a-zA-Z]+$',   
                      controller: _dOB,                 
                    ),
                    SizedBox(height: 20,),
                    FormContainer(
                      labels: 'Nomor Paspor',
                      needsInfoButton: true,
                      isDataRequired: AutovalidateMode.onUserInteraction,
                      hintContents: '',
                      requiredDataChecker: true,
                      buttonContent: 'Sesuai yang tertulis di paspor. \nTidak ada spasi.',
                      valueConstraints: r'[a-z A-Z 0-9]+$',  
                      controller: _passport,                  
                    ),
                    SizedBox(height: 20,),
                    FormContainer(
                      labels: 'NIK',
                      needsInfoButton: true,
                      isDataRequired: AutovalidateMode.disabled,
                      hintContents: '',
                      requiredDataChecker: false,
                      buttonContent: 'Jika ada, NIK bisa dilihat di KTP atau Kartu Keluarga',
                      valueConstraints: r'[0-9]+$',   
                      controller: _iDNumber,                 
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Jenis kelamin',
                      textAlign: TextAlign.left,
                      style: TextStyling.regularTextStyle,
                    ),

                    FormBuilderDropdown<String>(
                      name: "gender",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        (value){
                          if(value ==null || value =='' || value.isEmpty){
                            return 'Please select gender'; //TODO: Change prompt
                          }
                          return null;
                        }
                      ]),
                      onChanged: (String? newValue){
                        setState((){
                          dropdownValue = newValue!;
                          }
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Jenis Kelamin',
                      ),
                      items: genderOptions
                      .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                        )).toList()
                    ),
                    //TODO: Adjust button position
                    ElevatedButton(
                      child: const Text('Next'),
                      onPressed: () {
                        getItemAndNavigate(context);
                      }
                    ),
                  ],
                ),
              ),
            ),
          )
        );
      },
    );
  }
}
