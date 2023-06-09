import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/categories_model.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModel> categoriesList = [];
  late CategoriesModel categoriesModel;

  get throwList => null;

  Future<void> getCategories() async {
    List<CategoriesModel> newCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .doc("vvi9mHVj6IvwsCOknbuz")
        .collection("tea")
        .get();
    querySnapshot.docs.forEach((element) {
      categoriesModel = CategoriesModel(
        image: (element.data() as Map<String, dynamic>)['image'] ?? '',
        name: (element.data() as Map<String, dynamic>)['name'] ?? '', id: '',

      );
      print(categoriesModel.name);
      newCategoriesList.add(categoriesModel);
    });
    categoriesList = newCategoriesList;
    notifyListeners();
  }
}
