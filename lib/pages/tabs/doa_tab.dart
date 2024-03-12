import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/viewmodel/doa_viewmodal.dart';

class TabDoa extends StatelessWidget {
  const TabDoa({Key? key});

  @override
  Widget build(BuildContext context) {
    final DoaViewModel _viewModel = DoaViewModel();

    return Scaffold(
      body: FutureBuilder<List<DoaModel>>(
        future: _viewModel.getListDoa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("Tidak Ada Data"),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => _itemList(
                context: context,
                doa: snapshot.data![index],
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }

  Widget _itemList({required BuildContext context, required DoaModel doa}) =>
      InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            doa.title.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            doa.arabic.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            doa.latin.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            doa.translation.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 2530,
                            height: 25,
                          ),
                          Text(
                            doa.fawaid.toString(),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            width: 30,
                            height: 25,
                          ),
                          Text(
                            doa.source.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 30,
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
