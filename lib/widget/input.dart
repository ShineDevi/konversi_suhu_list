import 'package:flutter/material.dart';

class input extends StatelessWidget {
  const input({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TextEditingController data;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: data,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Masukkan Suhu Celcius',
        hintText: 'Masukkan Suhu Celcius',
      ),
    );
  }
}
