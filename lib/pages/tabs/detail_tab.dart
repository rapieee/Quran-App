import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/pages/detail_screen.dart';
import 'package:quran_app/viewmodel/ayah_viewmodel.dart';

class DetailTab extends StatelessWidget {
  static const routename = 'DetailTab';
  const DetailTab({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) { 
    final AyahViewModel _viewModel = AyahViewModel();
  return Scaffold(
    body: FutureBuilder(
      future: _viewModel.getListAyah(id), 
       builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
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
        })
        );
  }

   Widget _itemList({required BuildContext context, required Ayat ayat}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName, arguments: ayat.nomor.toString());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svg/nomor_surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        ayat.nomor.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    ayat.ar.toString(),
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Text(
                ayat.tr.toString(),
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      );
}
