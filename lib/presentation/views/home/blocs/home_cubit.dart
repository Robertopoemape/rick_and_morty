import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../src/src.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    _getCharactersUseCase = GetIt.I<GetCharactersUseCase>();
    _searchCharactersUseCase = GetIt.I<SearchCharactersUseCase>();
    _scrollController.addListener(_onScroll);
    getCharacters();
  }
  late final GetCharactersUseCase _getCharactersUseCase;
  late final SearchCharactersUseCase _searchCharactersUseCase;

  final List<Character> _characters = [];
  String searchQuery = '';

  bool isSearching = false;
  int _currentPage = 1;
  bool _isFetching = false;
  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  void searchCharacters(String query) async {
    searchQuery = query;
    if (query.isEmpty) {
      getCharacters();
      return;
    }

    final result = await _searchCharactersUseCase(query);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (characters) => emit(HomeLoaded(characters.data!.results)),
    );
  }

  void toggleSearch() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchQuery = '';
      getCharacters();
    }
    searchCharacters('');
    emit(HomeSearchState(_characters, isSearching));
  }

  void getCharacters({int page = 1}) async {
    if (_isFetching) return;
    _isFetching = true;

    emit(HomeLoading(_characters));

    final result = await _getCharactersUseCase(page);
    result.fold((failure) {
      _isFetching = false;
      emit(HomeError(failure.message));
    }, (characters) {
      _characters.addAll(characters.data!.results);
      _currentPage = page;
      _isFetching = false;
      emit(HomeLoaded(List.from(_characters)));
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      loadNextPage();
    }
  }

  void loadNextPage() {
    getCharacters(page: _currentPage + 1);
  }

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }
}
