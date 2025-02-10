import 'package:dartz/dartz.dart';
import 'package:rick_and_morty/core/errors/failure.dart';

import '../../data/models/rick_and_morty_response.dart';
import '../repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase(this.repository);

  Future<Either<Failure, RickAndMortyResponseModel>> call(int page) async {
    return repository.getCharacters(page);
  }
}
