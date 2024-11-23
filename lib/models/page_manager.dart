import 'package:flutter/cupertino.dart';

class PageManager{
  PageManager({required this.pageController});
  late final PageController pageController;
  int page = 0;

  void setPage(int value){
    if(page == value) return;
    page = value;
    pageController.jumpToPage(value);

  }
}