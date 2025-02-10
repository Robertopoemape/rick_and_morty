import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../src/src.dart';
import 'blocs.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial()) {
    _toggleFavoriteUseCase = GetIt.I<ToggleFavoriteUseCase>();
    _loadFavorites();
  }

  List<int> _favorites = [];
  final List<Character> _characters = [];
  late final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  void toggleFavorite(Character character) async {
    final result = await _toggleFavoriteUseCase(character, _favorites);
    result.fold(
      (failure) => emit(DetailError(failure.message)),
      (updatedFavorites) {
        _favorites = updatedFavorites;
        emit(DetailLoaded(_characters, _favorites));
      },
    );
  }

  bool isFavorite(int characterId) {
    return _favorites.contains(characterId);
  }

  void _loadFavorites() async {
    final favorites = await _toggleFavoriteUseCase.getFavorites();
    _favorites = favorites;
  }
}
