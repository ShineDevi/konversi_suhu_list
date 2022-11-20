import 'package:flutter/material.dart';

class tombolKonversi extends StatelessWidget {
  const tombolKonversi({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: const Text("Konversi Suhu"),
          ),
        ),
      ],
    );
  }
}
