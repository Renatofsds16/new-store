import 'package:flutter/material.dart';
import 'package:new_store/common/widgets/item_tile.dart';
import 'package:new_store/models/section.dart';

import '../../common/widgets/section_header.dart';

class SectionList extends StatelessWidget {
  SectionList({super.key,required this.section});
  Section? section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SectionHeader(section: section),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  final item = section!.items![index];
                  return ItemTile(item: item);
                },
                separatorBuilder: (_,__)=>const SizedBox(width: 4,),
                itemCount: section!.items!.length
            ),
          )
        ],
      ),
    );
  }
}
