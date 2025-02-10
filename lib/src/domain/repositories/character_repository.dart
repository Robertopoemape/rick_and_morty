import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../data/models/rick_and_morty_response.dart';

abstract class CharacterRepository {
  Future<Either<Failure, RickAndMortyResponseModel>> getCharacters(int page);
  Future<Either<Failure, RickAndMortyResponseModel>> searchCharacters(
      String name);
}
