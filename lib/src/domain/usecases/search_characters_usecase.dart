import 'package:dartz/dartz.dart';

import '../../../core/errors/errors.dart';
import '../../data/models/rick_and_morty_response.dart';
import '../repositories/character_repository.dart';

class SearchCharactersUseCase {
  final CharacterRepository repository;

  SearchCharactersUseCase(this.repository);

  Future<Either<Failure, RickAndMortyResponseModel>> call(String name) async {
    return repository.searchCharacters(name);
  }
}
