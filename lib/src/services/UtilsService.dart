class UtilsService {
  static extractMapValues(Map<String, dynamic> map, String key, defaultValue) {
    return map == null || map[key] == null ? defaultValue : map[key];
  }
}
