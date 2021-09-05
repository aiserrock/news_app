class RequestParameters {
  final String apiKey;

  // query
  final String q;

  RequestParameters({
    this.q = '',
    required this.apiKey,
  });
}
