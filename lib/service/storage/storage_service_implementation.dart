import 'package:ticketing_app/service/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImplementation implements StorageService {
  // the storage key for the token
  static const String _storageKeyMobileToken = "token";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String> getMobileToken() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(_storageKeyMobileToken) ?? '';
  }

  @override
  Future<bool> setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(_storageKeyMobileToken, token);
  }
}
