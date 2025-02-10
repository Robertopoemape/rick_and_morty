import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/errors/failure.dart';

import '../../../core/decorator/decorator.dart';
import '../../../core/network/api_service.dart';
import '../../domain/repositories/character_repository.dart';
import 'package:dio/dio.dart';
import '../models/rick_and_morty_response.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final ApiService _apiService = GetIt.instance<ApiService>();

  @override
  Future<Either<Failure, RickAndMortyResponseModel>> getCharacters(
      int page) async {
    try {
      final response = await _apiService.getCharacters(page);
      return Right(RickAndMortyResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(mapDioErrorToFailure(e));
    }
  }

  @override
  Future<Either<Failure, RickAndMortyResponseModel>> searchCharacters(
      String name) async {
    try {
      final response = await _apiService.searchCharacters(name);
      return Right(RickAndMortyResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(mapDioErrorToFailure(e));
    }
  }
}
