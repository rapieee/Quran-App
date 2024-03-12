
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/dzikir_model.dart';
import 'package:quran_app/pages/detail_screen.dart';
import 'package:quran_app/viewmodel/dzikir_viewmodel.dart';
import 'package:quran_app/viewmodel/petang_viewmodel.dart';


class DzikirScreen extends StatelessWidget {
  static String routeName = 'dzikir_screen';
  late String mode;  
  DzikirScreen({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    if (mode=='pagi') {
      return DzikirPagi(); 
    } else {
      return PetangView();
    }   
  }
  

  Widget DzikirPagi() { 
    DzikirViewModel _viewModel = DzikirViewModel();
    return Scaffold(
      body: FutureBuilder<List<Dzikir>>(
        future: _viewModel.getListDzikir(), 
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) => _itemModel(
              context: context, 
              dzikir: snapshot.data!.elementAt(index),
              i: index + 1
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              itemCount: snapshot.data!.length);
        }),
    );
  }

   Widget PetangView() { 
    // ignore: no_leading_underscores_for_local_identifiers
    PetangViewModel _viewModel = PetangViewModel();
    return Scaffold(
      body: FutureBuilder<List<Dzikir>>(
        future: _viewModel.getListPetang(), 
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Tidak ada data"),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) => _itemModel(
              context: context, 
              dzikir: snapshot.data!.elementAt(index),
              i: index + 1
              ),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              itemCount: snapshot.data!.length);
        }),
    );
  }

  Widget _itemModel ({required BuildContext context, required Dzikir dzikir , i}) { 
   return InkWell(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen.routeName,arguments: dzikir.title.toString());
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
                              i.toString(),
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
                dzikir.arabic.toString(),
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
                       dzikir.translation.toString(),
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
     
}