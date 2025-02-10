import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../core/errors/errors.dart';
import '../../data/models/rick_and_morty_response.dart';
import '../repositories/character_repository.dart';

class SearchCharactersUseCase {
  final CharacterRepository repository = GetIt.instance<CharacterRepository>();

  Future<Either<Failure, RickAndMortyResponseModel>> call(String name) async {
    return repository.searchCharacters(name);
  }
}
