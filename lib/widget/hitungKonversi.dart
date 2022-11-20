import 'package:flutter/material.dart';

class perhitunganKonversi extends StatelessWidget {
  const perhitunganKonversi({
    Key? key,
    required this.konversi,
  }) : super(key: key);

  final double konversi;

  @override
  Widget build(BuildContext context) {
    return Text("$konversi", style: TextStyle(fontSize: 32));
  }
}
