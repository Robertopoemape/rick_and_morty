import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/errors/failure.dart';
import '../../../core/storage/local_storage.dart';
import '../entities/entities.dart';

class ToggleFavoriteUseCase {
  final LocalStorage _localStorage = GetIt.instance<LocalStorage>();

  Future<Either<Failure, List<int>>> call(
      Character character, List<int> currentFavorites) async {
    final updatedFavorites = [...currentFavorites];

    if (updatedFavorites.contains(character.id)) {
      updatedFavorites.remove(character.id);
    } else {
      updatedFavorites.add(character.id);
    }

    await _localStorage.saveFavorites(updatedFavorites);
    return Right(updatedFavorites);
  }

  Future<List<int>> getFavorites() async {
    return await _localStorage.getFavorites();
  }
}
