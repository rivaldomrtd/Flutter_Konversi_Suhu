import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "1461900135",
      home: Scaffold(
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController celciust = TextEditingController();
  TextEditingController farenheitt = TextEditingController();
  TextEditingController kelvint = TextEditingController();
  TextEditingController reamurt = TextEditingController();

  String _chosenValue = "Celcius";
  var c, f, k, r, hasil;

  final TextEditingController input = TextEditingController(
    text: '',
  );
  void hitung() {
    if (_chosenValue == "Celcius") {
      c = double.parse(input.text);
      r = c * (4 / 5);
      f = (c * 9 / 5) + 32;
      k = c + 273.15;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    } else if (_chosenValue == "Reamur") {
      r = double.parse(input.text);
      c = r * (4 / 5);
      f = (r * 9 / 4) + 32;
      k = (r * 5 / 4) + 273.16;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    } else if (_chosenValue == "Farenheit") {
      f = double.parse(input.text);
      c = (f * 5 / 9) - 32;
      r = (f * 4 / 9) - 32;
      k = (f - 32) * 5 / 9 + 273.16;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    } else if (_chosenValue == "Kelvin") {
      k = double.parse(input.text);
      c = k - 273.16;
      r = (k - 273.16) * 4 / 5;
      f = (k - 273.16) * 9 / 5 + 32;
      celciust.text = c.toString();
      farenheitt.text = f.toString();
      reamurt.text = r.toString();
      kelvint.text = k.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Val00s'), actions: <Widget>[]),
      body: Container(
        child: Container(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      child: TextField(
                        decoration: new InputDecoration(
                            labelText: "Suhu", hintText: "Masukan Suhu"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                        ],
                        controller: input, // Only numbers can be entered
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 24),
                      width: 120,
                      child: DropdownButton<String>(
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),

                        items: <String>[
                          'Celcius',
                          'Farenheit',
                          'Kelvin',
                          'Reamur',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "Pilih",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 5,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _chosenValue = value!;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text('Konversi Suhu'),
                      onPressed: () {
                        hitung();
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Celcius: ",
                    ),
                    Padding(padding: EdgeInsets.only(right: 30)),
                    Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: celciust,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "celcius",
                            hintText: '',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Reamur: ",
                    ),
                    Padding(padding: EdgeInsets.only(right: 30)),
                    Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: reamurt,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Reamur",
                            hintText: '',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Farenheit: ",
                    ),
                    Padding(padding: EdgeInsets.only(right: 21)),
                    Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: farenheitt,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Farenheit",
                            hintText: '',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Kelvin: ",
                    ),
                    Padding(padding: EdgeInsets.only(right: 40)),
                    Container(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: kelvint,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Kelvin",
                            hintText: '',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
