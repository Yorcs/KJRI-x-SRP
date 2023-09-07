import 'package:flutter/material.dart';
import 'package:self_report_application/styling.dart';

class BuildHeader extends StatelessWidget{
  const BuildHeader({
    super.key,
    required this.pageName,
    required this.opacity1,
    required this.opacity2,
    required this.opacity3,
    required this.opacity4,
    required this.changeColor1,
    required this.changeColor2,
    required this.changeColor3,
    required this.changeColor4,
  });

  final double opacity1;
  final double opacity2;
  final double opacity3;
  final double opacity4;

  final Color changeColor1;
  final Color changeColor2;
  final Color changeColor3;
  final Color changeColor4;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextHeader(
          pageName: pageName
        ),
        LinePath(
          opacity1: opacity1,
          opacity2: opacity2,
          opacity3: opacity3,
          opacity4: opacity4,
          changeColor1: changeColor1,
          changeColor2: changeColor2,
          changeColor3: changeColor3,
          changeColor4: changeColor4,
        ),
      ],
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.pageName,
  });

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage('images/logo.png'),
          width: 97,
          height: 97,
          fit: BoxFit.contain
          ),
        Text(
          'Lapor Diri',
          textAlign: TextAlign.left,
        ),
        Text(
          pageName,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}



class LinePath extends StatelessWidget {
  const LinePath({
    super.key,
    required this.opacity1,
    required this.opacity2,
    required this.opacity3,
    required this.opacity4,
    required this.changeColor1,
    required this.changeColor2,
    required this.changeColor3,
    required this.changeColor4,
  });

  final double opacity1;
  final double opacity2;
  final double opacity3;
  final double opacity4;

  final Color changeColor1;
  final Color changeColor2;
  final Color changeColor3;
  final Color changeColor4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAndLabel(
          labelName: "Identitas",
          pageNumber: '1',
          opacity: opacity1,
          changeColor: changeColor1,),
        SizedBox(width: 20,),
        CircleAndLabel(
          labelName: "Data Luar Negeri",
          pageNumber: '2',
          opacity: opacity2,
          changeColor: changeColor2,),
        SizedBox(width: 20,),
        CircleAndLabel(
          labelName: "Tujuan",
          pageNumber: '3',
          opacity: opacity3,
          changeColor: changeColor3,),
        SizedBox(width: 30,),
        CircleAndLabel(
          labelName: "Kontak",
          pageNumber: '4',
          opacity: opacity4,
          changeColor: changeColor4,),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
      height: 0,
      thickness: 2,
      indent: 0,
      endIndent: 0,
    );
  }
}

class CircleAndLabel extends StatelessWidget {
  const CircleAndLabel({
    super.key,
    required this.labelName,
    required this.pageNumber,
    required this.opacity,
    required this.changeColor,
  });

  final String labelName;
  final String pageNumber;
  final double opacity;
  final Color changeColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Circles(
          pageNumber: pageNumber,
          opacity: opacity,
          changeColor: changeColor,),
        Text(
          labelName,
          style: TextStyle(
            color: Colors.blue.withOpacity(opacity)
          ),
        )
      ],
    );
  }
}

//TODO: Change Color
class Circles extends StatelessWidget {
  const Circles({
    super.key,
    required this.pageNumber,
    required this.opacity,
    required this.changeColor,
  });

  final String pageNumber;
  final double opacity;
  final Color changeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          pageNumber,
          style: TextStyle(
            color: changeColor.withOpacity(opacity)
          )
        )
      )
    );
  }
}