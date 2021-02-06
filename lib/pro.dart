import 'package:get/get.dart';
import 'dart:math';

class Encryption extends GetxController {
  var monoalphabetic;
  var caesar;
  var vigenere;
  var playFair;
  var railFence;


  //monoalphabetic
  void monoalphabeticFunction(String plaintext) {
    if(plaintext.length>0) {
      String word = "";
      var alphabet = [
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z"
      ];
      var alphabet0 = [
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z"
      ];
      var o = shuffle(alphabet);

      for (int i = 0; i < plaintext.length; i++) {
        int k = (alphabet0.indexOf(plaintext[i]));
        try {
          word = word + o[k];
        } catch (e) {
          word = word + " ";
        }
      }
      print("monoalphabetic: $word");
      monoalphabetic = word;
      update();
    }else{
      monoalphabetic = "";
      update();
    }
  }
  List shuffle(List items) {
    var random = new Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  //caesar
  void caesarFunction(String plaintext) {
    if(plaintext.length>0) {
      int key = 3;
      String word = "";
      var alphabet = [
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z"
      ];
      for (int i = 0; i < plaintext.length; i++) {
        if (plaintext[i] == " ") {
          word = word + " ";
        } else {
          int k = (alphabet.indexOf(plaintext[i]) + key) % 26;
          word = word + "${alphabet[k]}";
        }
      }
      print("caesar:$word");
      caesar = word;
      update();
    }else{
      caesar = "";
      update();
    }
  }

  //vigenere
  void vigenereFunction(String plaintext) {
    if(plaintext.length>0) {
      String key = 'hi';
      String word = "";
      var alphabet = [
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z"
      ];
      var textPosition = new List();
      var keyPosition = new List();
      for (int i = 0; i < plaintext.length; i++) {
        textPosition.add(alphabet.indexOf(plaintext[i]));
      }
      for (int i = 0; i < key.length; i++) {
        keyPosition.add(alphabet.indexOf(key[i]));
      }
      OUTER:
      for (int i = 0; i < plaintext.length;) {
        int k = 0;
        for (int j = 0; j < key.length;) {
          if (i < plaintext.length) {
            if (textPosition[i] != -1) {
              k = (textPosition[i] + (keyPosition[j])) % 26;
              word = word + "${alphabet[k]}";
              j = j + 1;
              i++;
            } else {
              word = word + " ";
              i++;
            }
          } else {
            break OUTER;
          }
        }
      }
      print("vigenere:$word");
      vigenere = word;
      update();
    }else{
      vigenere = "";
      update();
    }
  }
  //playFair
  List<List> data0;
  void playFairFunction(String input) {
    if(input.length>0) {
      String keyString = "hello";
      String alphabet = keyString + "abcdefghiklmnopqrstuvwxyz";
      List playfairTable = List.generate(5, (i) => List(5));
      Set numberSet = new Set();
      for (int i = 0; i < alphabet.length; i++) {
        numberSet.add(alphabet[i]);
      }
      int count = 0;
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          playfairTable[i][j] = numberSet.elementAt(count);
          count++;
        }
      }
      int length = 0;
      String mainText = input;
      length = (input.length / 2 + input.length % 2).toInt();
      List inputToList = input.split('');
      for (int i = 0; i < inputToList.length; i++) {
        if (inputToList[i] == " ") {
          inputToList.removeAt(i);
        }
      }
      for (int i = 0; i < (length - 1); i++) {
        if (input[2 * i] == input[2 * i + 1]) {
          inputToList.insert(2 * i + 1, 'x');
          length = (input.length / 2 + input.length % 2).toInt();
        }
      }

      input = '';
      inputToList.forEach((item) {
        input = input + item;
      });
      length = (input.length / 2 + input.length % 2).toInt();

      var digraph = new List(length);

      for (int j = 0; j < length; j++) {
        if (j == (length - 1) && (input.length / 2).toInt() == (length - 1)) {
          input = input + "x";
        }
        digraph[j] = input[2 * j] + "" + input[2 * j + 1];
      }
      var out = "";
      var encDigraphs = encodeDigraph(digraph, length, playfairTable);
      int j = 0;
      List outList = [];
      for (int i = 0; i < encDigraphs.length; i++) {
        outList.add(encDigraphs[i][0]);
        outList.add(encDigraphs[i][1]);
      }
      for (int i = 0; i < mainText.length; i++) {
        if (mainText[i] == " ") {
          out = out + " ";
        } else {
          out = out + "${outList[j]}";
          j++;
        }
      }
      out = out + "${outList[j]}";
      print("playFair: $out");
      playFair = out;
      update();
    }else{
      playFair = "";
      update();
    }
  }
  encodeDigraph(var di, int length,var table){
    var enc = new List(length);
    for(int i = 0; i < length; i++){
      var a = di[i][0];
      var b = di[i][1];
      int r1 =  getPoint(a,table).x.toInt();
      int r2 = getPoint(b,table).x.toInt();
      int c1 =  getPoint(a,table).y.toInt();
      int c2 = getPoint(b,table).y.toInt();

      if(r1 == r2){
        c1 = (c1 + 1) % 5;
        c2 = (c2 + 1) % 5;

      }else if(c1 == c2){
        r1 = (r1 + 1) % 5;
        r2 = (r2 + 1) % 5;
      }else{
        int temp = c1;
        c1 = c2;
        c2 = temp;
      }

      enc[i] = table[r1][c1] + "" + table[r2][c2];
    }
    return enc;
  }
  Point getPoint(String c,var table){
    Point pt = new Point(0,0);
    for(int i = 0; i < 5; i++)
      for(int j = 0; j < 5; j++)
        if(c == table[i][j][0])
          pt = new Point(i,j);
    return pt;
  }

  //railFence
  void railFenceFunction(String data) {
    if(data.length>0) {
      int numRails = 2;

      var encrypted = new List(data.length);

      int n = 0;

      for (int k = 0; k < numRails; k++) {
        int index = k;
        bool down = true;
        while (index < data.length) {
          encrypted[n++] = data[index];
          if (k == 0 || k == numRails - 1) {
            index = index + 2 * (numRails - 1);
          } else if (down) {
            index = index + 2 * (numRails - k - 1);
            down = !down;
          } else {
            index = index + 2 * k;
            down = !down;
          }
        }
      }
      String word = "";
      for (String i in encrypted) {
        word = word + i;
      }
      print("railFence:$word");
      railFence = word;
      update();
    }else{
      railFence = "";
      update();
    }
  }


}
