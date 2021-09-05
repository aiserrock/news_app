class RequestParameters {
  final String apiKey;
  // query
  final String q;

  RequestParameters(
    String q, {
    required this.apiKey,
  }) : q = '';
}
