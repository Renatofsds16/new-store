import 'package:flutter/material.dart';
import 'package:new_store/models/page_manager.dart';
import 'package:provider/provider.dart';

class Drawertile extends StatelessWidget {
  const Drawertile({super.key, required this.iconData, required this.title,required this.page});
  final IconData iconData;
  final String title;
  final int page;


  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final int currentPage = context.watch<PageManager>().page;
    return InkWell(
      onTap: (){
          debugPrint('toquei $page');
          context.read<PageManager>().setPage(page);
        },
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: currentPage == page? primaryColor : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(color: currentPage == page? primaryColor : Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
