abstract class StorageService {
  Future<String> getMobileToken();
  Future<bool> setMobileToken(String token);
}
