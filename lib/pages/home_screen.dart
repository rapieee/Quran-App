import 'package:flutter/material.dart'; 
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:google_fonts/google_fonts.dart'; 
import 'package:quran_app/components/tab_item.dart';
import 'package:quran_app/pages/tabs/doa_tab.dart'; 
import 'package:quran_app/pages/tabs/dzikir_tab.dart'; 
import 'package:quran_app/pages/tabs/surah_tab.dart';
import 'package:quran_app/theme.dart';

class HomeScreen extends StatelessWidget {
  static String routName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.white,
  items: [
    _bottomNavigationBarItem(
    icon: 'assets/svg/quran_icon.svg',
    label: 'Quran'),
    _bottomNavigationBarItem(
    icon: 'assets/svg/doa_icon.svg',
    label: 'Doa'),
    _bottomNavigationBarItem(
    icon: 'assets/svg/bookmark_icon.svg',
    label: 'Bookmark')
  ],
);
BottomNavigationBarItem _bottomNavigationBarItem({required String icon,
label }) => BottomNavigationBarItem(
  icon: SvgPicture.asset(icon, color: secondary),
  activeIcon: SvgPicture.asset(icon, color: primary),
  label: label
);
AppBar _appBar()=> AppBar(
  centerTitle: true,
  
  backgroundColor: Colors.white,

  automaticallyImplyLeading: false,
  elevation: 0,
  leading: IconButton(
    onPressed: (){}, 
    icon: SvgPicture.asset('assets/svg/menu_icon.svg'),
    ),
    title: Text(
      'Ngaji Bang',
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
    ),

    actions: [
      IconButton
      (onPressed: (){}, 
      icon: SvgPicture.asset('assets/svg/search_icon.svg')
      )
      ],
    
);

DefaultTabController _body() => DefaultTabController(
  length: 3, 
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: NestedScrollView(
      headerSliverBuilder:
       (BuildContext contex, bool  innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: _salam(),
        ),
        SliverAppBar(
          pinned: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          shape: Border(
            bottom: BorderSide(
              width: 3,
              color: Colors.grey.withOpacity(0.1),
            )
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child:  TabBar(
              labelColor: primary,
              indicatorColor: primary,
              indicatorWeight: 3,
              tabs: [
              itemTab(label: "Surah"),
              itemTab(label: "Dzikir"),
              itemTab(label: "Doa"),
            ],
            ),
          ),
          
        ),
        
      ],
       body :const TabBarView(
        children: [TabSurah(),TabDzikr(),TabDoa()],
       )),
    ),
    );


    Column _salam() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600, 
            color: secondary,
          ),
        ),
        const SizedBox(
          height: 4,
        ),

        Text(
          'Rapieee',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                colors:[ Color.fromARGB(255, 6, 184, 254), Color.fromARGB(255, 10, 137, 163)],
          
           )
         ),
        ),
        
        Positioned(
          child: SvgPicture.asset('assets/svg/quran_banner.svg'),
          bottom: 0,
          right: 0,
           ),
           Padding(
             padding: const EdgeInsets.all(20),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                  children: [
                    SvgPicture.asset('assets/svg/book.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                     Text(
                      "Last Read", 
                      style: GoogleFonts.poppins(
                      fontSize: 16, 
                      fontWeight: FontWeight.w500,
                      color: Colors.white ),
                     )
                  ],
                 ),
                 const SizedBox(
                  height: 20),
                  Text(
                      "Al-Fatihah", 
                      style: GoogleFonts.poppins(
                      fontSize: 16, 
                      fontWeight: FontWeight.w500,
                      color: Colors.white ),
                     ),
                     const SizedBox(
                  height: 4),
                     Text(
                      "Ayat No: 1", 
                      style: GoogleFonts.poppins(
                      fontSize: 14, 
                      fontWeight: FontWeight.w500,
                      color: Colors.white ),
                     )
                  ],
             ),
           )        
      ],    
    )
  ],
);
