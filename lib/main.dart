import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu_list/widget/dropdown.dart';
import 'package:konversi_suhu_list/widget/hitungKonversi.dart';
import 'package:konversi_suhu_list/widget/input.dart';
import 'package:konversi_suhu_list/widget/riwayatHitung.dart';
import 'package:konversi_suhu_list/widget/tombol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konverter Suhu Shine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController data = TextEditingController();
  List<String> listSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectedDropdown = "Kelvin";
  double konversi = 0.0;
  List<String> listHistory = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  void hitungKonversi() {
    setState(() {
      if (data.text.isNotEmpty) {
        switch (selectedDropdown) {
          case "Kelvin":
            konversi = int.parse(data.text) + 273;
            break;
          case "Fahrenheit":
            konversi = (int.parse(data.text) * 9 / 5) + 32;
            break;
          case "Reamur":
            konversi = int.parse(data.text) * 4 / 5;
            break;
        }
        listHistory.add(selectedDropdown + ": " + konversi.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          // horizontal).
          children: [
            input(data: data),
            const SizedBox(height: 8),
            dropdownSuhu(
                selectedDropdown: selectedDropdown,
                listSuhu: listSuhu,
                onDropdownChanged: onDropdownChanged),
            const SizedBox(height: 10),
            const Text("Hasil", style: TextStyle(fontSize: 18)),
            perhitunganKonversi(konversi: konversi),
            const SizedBox(height: 10),
            tombolKonversi(onPressed: hitungKonversi),
            SizedBox(height: 10),
            Text("Riwayat Konversi", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            history(listHistory: listHistory),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
