import 'package:flutter/material.dart';

class dropdownSuhu extends StatelessWidget {
  const dropdownSuhu({
    Key? key,
    required this.selectedDropdown,
    required this.listSuhu,
    required this.onDropdownChanged,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSuhu;
  final Function onDropdownChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: selectedDropdown,
        items: listSuhu.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          onDropdownChanged(value);
        });
  }
}
