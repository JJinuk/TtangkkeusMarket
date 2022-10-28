import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

import 'package:ttangkkeusmarket/app/src/providers/bottom_nav_provider.dart';
import 'package:ttangkkeusmarket/app/src/modules/home/home_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/category/category_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/map/map_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/my_page/my_page_view.dart';
import 'package:ttangkkeusmarket/app/src/modules/search/search_view.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationProvier bottomNavigationBar =
        Provider.of<BottomNavigationProvier>(context);

    Widget navigationBody() {
      switch (bottomNavigationBar.currentPage) {
        case 0:
          return const HomeView();
        case 1:
          return const CategoryView();
        case 2:
          return const MapView();
        case 3:
          return SearchView();
        case 4:
          return const MyPageView();
      }
      return Container();
    }

    Widget bottomNavigationBarWidget() {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.mapMarker),
            label: '내 주변',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이페이지',
          ),
        ],
        currentIndex: bottomNavigationBar.currentPage,
        unselectedItemColor: const Color(0xFF161921),
        selectedItemColor: const Color(0xFFF6C544),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          bottomNavigationBar.updateCurrentPage(index);
          // provider navigation state;
        },
      );
    }

    return Scaffold(
      body: navigationBody(),
      bottomNavigationBar: bottomNavigationBarWidget(),
    );
  }
}
