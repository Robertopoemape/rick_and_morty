import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/errors/failure.dart';

import '../../data/models/rick_and_morty_response.dart';
import '../repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository = GetIt.instance<CharacterRepository>();

  Future<Either<Failure, RickAndMortyResponseModel>> call(int page) async {
    return repository.getCharacters(page);
  }
}
