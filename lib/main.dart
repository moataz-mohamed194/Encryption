import 'package:aber/pro.dart';
import 'package:aber/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/TextOfEncryption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Encryption',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Encryption'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final controller = Get.put(Encryption());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryption"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    GetBuilder<Encryption>(
                        builder: (_) => TextOfEncryption(
                              text: 'monoalphabetic',
                              encryption: _.monoalphabetic,
                            )),
                    GetBuilder<Encryption>(
                        builder: (_) => TextOfEncryption(
                              text: 'caesar',
                              encryption: _.caesar,
                            )),
                    GetBuilder<Encryption>(
                        builder: (_) => TextOfEncryption(
                              text: 'vigenere',
                              encryption: _.vigenere,
                            )),
                    GetBuilder<Encryption>(
                        builder: (_) => TextOfEncryption(
                              text: 'railFence',
                              encryption: _.railFence,
                            )),
                    GetBuilder<Encryption>(
                        builder: (_) => TextOfEncryption(
                              text: 'playFair',
                              encryption: _.playFair,
                            )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFileLogin(
                  hintText: "Text",
                  textIcon: Icon(
                    Icons.text_fields,
                    color: Theme.of(context).textSelectionColor,
                  ),
                  cursorColor: Theme.of(context).textSelectionColor,
                  borderSideColor: Theme.of(context).primaryColor,
                  textStyleColor: Theme.of(context).textSelectionColor,
                  textChange: (vals) {
                    controller.caesarFunction(vals);
                    controller.vigenereFunction(vals);
                    controller.monoalphabeticFunction(vals);
                    controller.railFenceFunction(vals);
                    controller.playFairFunction(vals);
                  },
                  inputType: TextInputType.text,
                  hintStyle:
                      TextStyle(color: Theme.of(context).textSelectionColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
