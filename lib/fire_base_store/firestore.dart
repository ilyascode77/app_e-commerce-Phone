

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/categories_model.dart';

class FirebaseFirestoreH{
  static FirebaseFirestoreH instance = FirebaseFirestoreH();
  FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  Future<List<CategoriesModel>> getCategories()async{

    try{
   QuerySnapshot<Map<String,dynamic>> querySnapshot =
      await _firebaseFirestore.collection("categories").get();
       List<CategoriesModel>categoriesList =
       await querySnapshot.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();

    return categoriesList;
    }catch (e){
    return[];
    }
}
}