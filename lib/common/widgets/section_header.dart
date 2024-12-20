import 'package:flutter/material.dart';
import 'package:new_store/models/section.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader({super.key,required this.section});
  Section? section;

  @override
  Widget build(BuildContext context) {
    return Text('${section?.name}');
  }
}
