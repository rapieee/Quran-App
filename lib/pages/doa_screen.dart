import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/viewmodel/doa_viewmodal.dart';

class DoaScreen extends StatelessWidget {
  static String routeName = 'doa_screen';
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final DoaViewModel _viewModel = DoaViewModel();

    return FutureBuilder<List<DoaModel>>(
        future: _viewModel.getListDoa(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                    context: context,
                    doa: snapshot.data!.elementAt(index),
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  ),
              itemCount: snapshot.data!.length);
        });
  }


  Widget _itemList({required BuildContext context, required DoaModel doa}) =>
      InkWell(
        onTap: () {
          Navigator.pushNamed(context,  DoaScreen.routeName );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     doa.title.toString(),
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    
                  ],
                ),
              ),
              Text(
                doa.title.toString(),
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