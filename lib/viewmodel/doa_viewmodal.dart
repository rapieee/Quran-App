import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/repository/doa_repo.dart';

class DoaViewModel {
  
final DoaRepository _repository = DoaRepository();

Future<List<DoaModel>> getListDoa() async {
return await _repository.getListDoa();
  }
}