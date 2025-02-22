import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_store/models/section.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_store/models/section_items.dart';
import '../../common/widgets/section_header.dart';
import 'item_tile.dart';

class SectionGridView extends StatelessWidget {

  SectionGridView({super.key,required this.section});
  Section? section;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(section: section),
        //coluna grid view
        // TODO: FAZER GRID VIEW DEPOIS VER DOCUMENTACAO CIRCLE AVATA PROVISORIO
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
          shrinkWrap: true,
            itemCount: section!.items!.length,
            itemBuilder: (context,index){
              SectionItem item = section!.items![index];
              return ItemTile(item: item);

            }
        )
    ]

    );
  }
}
