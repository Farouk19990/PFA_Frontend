import 'package:mall/repository/boutique_repo.dart';

import '../model/boutique.dart';


class BoutiqueVM {
  final BoutiqueRepository boutiqueRepository;
  BoutiqueVM({
    required this.boutiqueRepository,
  });

  Future<List<Boutique>> fetchData() async{
    return await boutiqueRepository.getBoutiques();
  }
}
