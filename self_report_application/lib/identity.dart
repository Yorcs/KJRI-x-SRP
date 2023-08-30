import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_report_application/styling.dart';
import 'package:self_report_application/requirements_page.dart';

//Requirements Page
class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IdentityForm();
  }
}

class IdentityForm extends StatefulWidget {
  @override
  _IdentityFormState createState() => _IdentityFormState();
}

class _IdentityFormState extends State<IdentityForm> {
  final identityKey = GlobalKey<FormState>();

  String? dropdownValue;
  var items = [
    'Laki-laki',
    'Perempuan',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            //TODO: Readjust margin and padding
            body: Container(
          child: Form(
            key: identityKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextsForm(labels: 'a'),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Nama Lengkap'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                      return "Invalid input"; //TODO: Please change prompt
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Tanggal Lahir',
                      hintText: 'DD/MM/YYYY'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Invalid input"; //TODO: Please change prompt
                    } else {
                      return null;
                    }
                  },
                ),
                TextsForm(labels: 'aaaaaaaaaaaaaaaaaaaaaaaa'),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Nomor Paspor'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value!)) {
                      return "Invalid input"; //TODO: Please change prompt
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'NIK'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[0-9]+$').hasMatch(value!)) {
                      return "Invalid input"; //TODO: Please change prompt
                    } else {
                      return null;
                    }
                  },
                ),
                DropdownButton(
                  value: dropdownValue,
                  hint: Text('Jenis Kelamin'),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}

class TextsForm extends StatelessWidget {
  const TextsForm({
    super.key,
    String? labels,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: 'nama lengkap'),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return "Invalid input"; //TODO: Please change prompt
        } else {
          return null;
        }
      },
    );
  }
}
