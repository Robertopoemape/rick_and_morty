import 'package:rick_and_morty/src/domain/entities/error.dart';

import 'rick_and_morty_model.dart';

class RickAndMortyResponseModel {
  final RickAndMortyModel? data;
  final ErrorData? error;

  RickAndMortyResponseModel({this.data, this.error});

  factory RickAndMortyResponseModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("error")) {
      return RickAndMortyResponseModel(error: json["error"]);
    } else {
      return RickAndMortyResponseModel(data: RickAndMortyModel.fromJson(json));
    }
  }
}
