import 'package:flutter/material.dart';
import 'package:self_report_application/header.dart';
import 'package:self_report_application/form_container.dart';
import 'package:self_report_application/living_abroad_data_continue.dart';
import 'package:self_report_application/styling.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Living Abroad First Page
class LivingAbroadDataPage extends StatelessWidget {
  const LivingAbroadDataPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return LivingAbroadDataForm();
  }
}

class LivingAbroadDataForm extends StatefulWidget {
  const LivingAbroadDataForm({super.key});

  @override
  State<LivingAbroadDataForm> createState() => _LivingAbroadDataFormState();
}

class _LivingAbroadDataFormState extends State<LivingAbroadDataForm> {
  final _livingAbroadDataKey = GlobalKey<FormBuilderState>();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  late String provinceDropdownValue;
  late String cityDropdownValue;

  List<String> provinces = [
    'Alberta',
    'British Columbia',
  ];

  List<String>  cities = [
    'Burnaby',
    'Coquitlam',
    'Surrey',
  ];

  late String addressString;
  late String countryString;
  late String postalCodeString;
  late String provinceDropdownValueString;
  late String cityDropdownValueString;

  Future<(String, String, String, String, String)> getSharedPrefs() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    addressString = prefs.getString('Alamat Lengkap di Luar Negeri') ?? '';
    countryString = prefs.getString('Negara') ??'';
    postalCodeString = prefs.getString('Kode Pos') ?? '';
    provinceDropdownValueString = prefs.getString('Provinsi') ?? '';
    cityDropdownValueString = prefs.getString('Kota') ?? '';

    setState(() {
      _address.text = addressString;
      _country.text = countryString;
      _postalCode.text = postalCodeString;
      provinceDropdownValue = provinceDropdownValueString;
      cityDropdownValue = cityDropdownValueString;
    });

    return (addressString, countryString, postalCodeString, provinceDropdownValueString, cityDropdownValueString);
  }

  Future<void> saveData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Alamat Lengkap di Luar Negeri', _address.text);
    await prefs.setString('Negara', _country.text);
    await prefs.setString('Kode Pos', _postalCode.text);
    await prefs.setString('Provinsi', provinceDropdownValue.toString());
    await prefs.setString('Kota', cityDropdownValue.toString());
  }

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
    _address.addListener(() {
      final String text = _address.text;
      _address.value = _address.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _country.addListener(() {
      final String text = _country.text;
      _country.value = _country.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });

    _postalCode.addListener(() {
      final String text = _postalCode.text;
      _postalCode.value = _postalCode.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing:  TextRange.empty,
      );
    });
  }

  @override
  void dispose(){
    _address.dispose();
    _country.dispose();
    _postalCode.dispose();
    super.dispose();
  }


  goBack(BuildContext context)=> Navigator.pop(context);
    Future <void> getItemAndNavigate (BuildContext context) async {
      final isValid = _livingAbroadDataKey.currentState!.validate();
      if(!isValid){
      } else {
        saveData();
        await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LivingAbroadDataContinuePage()
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
                key: _livingAbroadDataKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BuildHeader(
                    pageName: 'Data di Luar negeri',
                    opacity1: 0.5,
                    opacity2: 1,
                    opacity3: 0.5,
                    opacity4: 0.5,
                    changeColor1: Colors.blue,
                    changeColor2: Colors.white,
                    changeColor3: Colors.blue,
                    changeColor4: Colors.blue,
                    ),
                    SizedBox(height: 30,),
                    FormContainer(
                    labels: 'Alamat Lengkap di Luar Negeri',
                    needsInfoButton: false,
                    isDataRequired: AutovalidateMode.onUserInteraction,
                    hintContents: '',
                    buttonContent: '',
                    valueConstraints: r'^[a-z A-Z 0-9]+$', 
                    controller: _address, 
                    requiredDataChecker: true,                   
                    ),
                    SizedBox(height: 30,),
                    FormContainer(
                      labels: 'Negara',
                      needsInfoButton: false,
                      isDataRequired: AutovalidateMode.onUserInteraction,
                      hintContents: 'Kanada',
                      buttonContent: '',
                      valueConstraints: r'^[a-z A-Z]+$',  
                      controller: _country,     
                      requiredDataChecker: true,             
                    ),
                    SizedBox(height: 30,),
                    Text(
                      'Propinsi',
                      style: TextStyling.regularTextStyle,
                    ),
                    FormBuilderDropdown<String>(
                      name: "province",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        (value){
                          if(value ==null || value =='' || value.isEmpty){
                            return 'Please select province'; //TODO: Change prompt
                          }
                          return null;
                        }
                      ]),
                      onChanged: (String? newValue){
                        setState((){
                          provinceDropdownValue = newValue!;
                          }
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Propinsi',
                      ),
                      items: provinces
                      .map((provinces) => DropdownMenuItem(
                        value: provinces,
                        child: Text(provinces),
                        )).toList()
                    ),
                    SizedBox(height: 30,),
                    Text(
                      'Kota',
                      style: TextStyling.regularTextStyle,
                    ),
                    FormBuilderDropdown<String>(
                      name: "cities",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        (value){
                          if(value ==null || value =='' || value.isEmpty){
                            return 'Please select city'; //TODO: Change prompt
                          }
                          return null;
                        }
                      ]),
                      onChanged: (String? newValue){
                        setState((){
                          cityDropdownValue = newValue!;
                          }
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Pilih Kota',
                      ),
                      items: cities
                      .map((cities) => DropdownMenuItem(
                        value: cities,
                        child: Text(cities),
                        )).toList()
                    ),
                    SizedBox(height: 30,),
                    FormContainer(
                      labels: 'Kode Pos',
                      needsInfoButton: false,
                      isDataRequired: AutovalidateMode.onUserInteraction,
                      hintContents: '',
                      buttonContent: '',
                      valueConstraints: r'^[a-z A-Z 0-9]+$',
                      controller: _postalCode,   
                      requiredDataChecker: true,                 
                    ),
                    //TODO: Adjust button position
                    Row(
                      children: [
                        ElevatedButton(
                          child: const Text('Back'),
                          onPressed: () => goBack(context),
                        ),
                        // TODO: Adjust button position
                        ElevatedButton(
                          child: const Text('Next'),
                          onPressed: () {
                            getItemAndNavigate(context);
                          }
                        ),
                      ],
                    )                  
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
