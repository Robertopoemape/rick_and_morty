import 'dart:convert';

import '../../domain/entities/entities.dart';

RickAndMortyModel rickAndMortyModelFromJson(String str) =>
    RickAndMortyModel.fromJson(json.decode(str));

String rickAndMortyModelToJson(RickAndMortyModel data) =>
    json.encode(data.toJson());

class RickAndMortyModel {
  RickAndMortyModel({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Character> results;

  factory RickAndMortyModel.fromJson(Map<String, dynamic> json) =>
      RickAndMortyModel(
        info: Info.fromJson(json["info"]),
        results: (json["results"] as List)
            .map((x) => Character.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": results.map((x) => x.toJson()).toList(),
      };
}
