import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  const CustomDropdownExample({super.key});

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  final SingleSelectController<String?> jobRoleCtrl = SingleSelectController<String?>(
    '',
  );

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String?>.searchRequest(
      futureRequest: getFakeRequestData,
      hintBuilder: (BuildContext context, String hint, bool enabled) {
        return Text(hint, style: const TextStyle(color: Colors.black));
      },
      hintText: 'Search job role',
      onChanged: (String? value) {},
      controller: jobRoleCtrl,
      searchHintText: 'Developer',
      futureRequestDelay: const Duration(seconds: 3),
    );
  }

  Future<List<String>> getFakeRequestData(String query) async {
    final List<String> data = <String>[
      'Developer',
      'Designer',
      'Consultant',
      'Student',
    ];

    return await Future<List<String>>.delayed(const Duration(seconds: 1), () {
      return data.where((String e) {
        return e.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
}
