import 'package:flutter/material.dart';
import 'package:new_store/models/section.dart';

import '../../common/widgets/section_header.dart';

class SectionList extends StatelessWidget {
  SectionList({super.key,required this.section});
  Section? section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          SectionHeader(section: section),
        ],
      ),
    );
  }
}
