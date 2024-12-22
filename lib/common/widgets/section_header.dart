import 'package:flutter/material.dart';
import 'package:new_store/models/section.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader({super.key, required this.section});
  Section? section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          '${section?.name}',
          textAlign: TextAlign.start,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
