import 'dart:developer';

import 'package:hive/hive.dart';

class LocalStorage {
  static const String favoritesBox = 'favorites';
  static const String appDataBox = 'appData';
  static const String sessionBox = 'session';
  Future<void> saveLastSearch(String query) async {
    var box = await Hive.openBox(appDataBox);
    await box.put('lastSearch', query);
  }

  Future<String?> getLastSearch() async {
    var box = await Hive.openBox(appDataBox);
    return box.get('lastSearch');
  }

  Future<void> saveFavorites(List<int> ids) async {
    final box = await Hive.openBox<List<int>>(favoritesBox);
    log('Guardado en favoritos: $ids');
    await box.put('favorite_ids', ids);
  }

  Future<List<int>> getFavorites() async {
    final box = await Hive.openBox<List<int>>(favoritesBox);
    final favorites = box.get('favorite_ids', defaultValue: []) ?? [];
    log('Recuperando favoritos: $favorites');
    return favorites;
  }

  Future<bool> isSessionValid() async {
    final box = await Hive.openBox(sessionBox);
    final token = box.get('token');

    return token != null && token.isNotEmpty;
  }

  Future<void> saveToken(String token) async {
    final box = await Hive.openBox(sessionBox);
    if (token.isNotEmpty) {
      await box.put('token', token);
      log('Token guardado: $token');
    } else {
      log('Token inválido: $token');
    }
  }

  Future<void> removeToken() async {
    final box = await Hive.openBox(sessionBox);
    await box.delete('token');
  }
}
