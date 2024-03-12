import 'package:quran_app/model/dzikir_model.dart';
import 'package:quran_app/repository/dzikir_repo.dart';

class PetangViewModel {
  
final DzikirRepository _repository = DzikirRepository();

Future<List<Dzikir>> getListPetang() async {
return await _repository.getListPetang();
  }
}