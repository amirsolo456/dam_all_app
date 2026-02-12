import 'package:flutter/material.dart';
import 'package:khatoon_container/src/core/components/custom_information_card/section_card.dart';

class SharedWidgets {
  Padding getSectionHeader(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 16.0, right: 16, top: 16),
    child: SectionCard(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    ),
  );
}
