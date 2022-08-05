abstract class ApiConsumer {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}); // *
  Future<dynamic> post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}); // *
  Future<dynamic> put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}); // *
}

/// *
/**
    if you have this as a base url => http://quotes.stormconsultancy.co.uk/
    and you concatenate (for example) ?number=5 to it to become http://quotes.stormconsultancy.co.uk/?number=5
    in Dio it's a built-in feature and all what you need is to pass [queryParams] mentioned above
 */
