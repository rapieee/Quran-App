import 'package:flutter/material.dart';
import 'package:quran_app/pages/dzikir_screen.dart';

class TabDzikr extends StatelessWidget {
  static String routeName = 'dzikir_screen';

  const TabDzikr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildDzikirContainer(
            context,
            title: 'Dzikir Pagi',
            color: Colors.blue,
            argument: 'pagi',
          ),
          SizedBox(height: 10),
          _buildDzikirContainer(
            context,
            title: 'Dzikir Petang',
            color: Color.fromARGB(255, 224, 41, 31), 
            argument: 'sore',
          ),
        ],
      ),
    );
  }

  Widget _buildDzikirContainer(BuildContext context,
      {required String title, required Color color, required String argument}) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DzikirScreen.routeName, arguments: argument);
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12), // Membuat sudut tidak tajam
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
