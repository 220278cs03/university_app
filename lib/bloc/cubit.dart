import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_app_with_bloc/bloc/state.dart';
import 'package:http/http.dart'as http;

import '../university_model.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit() : super(MainState());

  getUniversity(String country) async {
    var res = await http.get(Uri.parse(
        "http://universities.hipolabs.com/search?country=${country}"));
    var data = universityFromJson(res.body);
    emit(MainState(listOfUniversity: data));
  }
}