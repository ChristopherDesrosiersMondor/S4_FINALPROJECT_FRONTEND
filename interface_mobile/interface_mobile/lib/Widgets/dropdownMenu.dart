import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';

/// Sources:
/// https://api.flutter.dev/flutter/material/DropdownButton-class.html

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({Key? keyDropdown, required this.list})
      : super(key: keyDropdown);

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return DropdownMenuExample(
      list: list,
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key, required this.list});

  final List<String> list;

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 59, 58, 58),
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color.fromARGB(255, 59, 58, 58),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              elevation: 16,
              style: Configuration.textForApp(Colors.white, 16),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )),
    );
  }
}
