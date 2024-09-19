import 'package:flutter/material.dart';

class Agreements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Agreement'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator
                        .of(context)
                        .pop('User Agreed');
                  },
                  child: Text('AGREE',
                      style: Theme
                          .of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.white))),
            ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
                child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(pdfText),
          ),
        )));
  }
}