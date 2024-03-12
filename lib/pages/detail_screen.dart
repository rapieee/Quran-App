import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/viewmodel/ayah_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String id;
  const DetailScreen({super.key, required this.id});


  @override
  Widget build(BuildContext context) {
    final AyahViewModel _viewmodel = AyahViewModel();
    return Scaffold(
      body: FutureBuilder(
        future: _viewmodel.getListAyah(id), 
        builder: ( context, AsyncSnapshot<AyahModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                    context: context,
                    ayat: snapshot.data!.ayat!.elementAt(index),
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.ayat!.length);
          } else {
            return Center(child: Text('No data available'));
          }
        }
     ),
    );
  }

  Widget _itemList({required BuildContext context, required Ayat ayat}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName, arguments: ayat.nomor.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/svg/nomor_surah.svg'),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Center(
                            child: Text(
                              ayat.nomor.toString(),
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Text(
                ayat.ar.toString(),
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                      textAlign: TextAlign.end,
                ),
              ),
                ],
              ),
              SizedBox(height: 16,),
              Text(
                       ayat.idn.toString(),
                         style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                           fontSize: 14),
                           textAlign: TextAlign.left,
                     ),  
            ],
            
          ),
        ),
      );
}