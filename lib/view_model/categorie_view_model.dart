import '../model/categorie.dart';
import '../repository/categorie_repo.dart';

class CategorieVM {
  final CategorieRepository categorieRepository;
  CategorieVM({
    required this.categorieRepository,
  });

  Future<List<Categorie>> fetchData() async {
    return await categorieRepository.getCategories();
  }
}
