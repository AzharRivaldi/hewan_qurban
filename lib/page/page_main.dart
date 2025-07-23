import 'package:flutter/material.dart';
import 'package:hewan_qurban/page/page_history.dart';
import 'package:hewan_qurban/page/page_home.dart';

class PageMain extends StatefulWidget {
  const PageMain({super.key});

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {

  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: Image.asset('assets/images/ic_profile.png'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: Icon(Icons.info_outline,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: false,
        titleSpacing: 10,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assalamualaikum,",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14
              ),
            ),
            Text(
              "Azhar Rivaldi",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          Center(
            child: PageHome(),
          ),
          Center(
            child: PageHistory(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff3ba5d7),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Riwayat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}