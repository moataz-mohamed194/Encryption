import 'package:flutter/cupertino.dart';

class TextOfEncryption extends StatelessWidget{
  final String text;
  final dynamic encryption;
  const TextOfEncryption({Key key, this.text,this.encryption}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Text(
      '$text: $encryption',
      style: TextStyle(fontSize: 18),
    ),);
  }

}