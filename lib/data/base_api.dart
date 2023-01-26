class BaseApi {
  static const baseScheme = "https";
  static const baseDomain = "dog.ceo";
  static const basePath = "/api/";

  static const baseDomainPath = baseDomain + basePath;
  static const baseDomainUrl = "$baseScheme://$baseDomain";
  static const baseUrl = "$baseScheme://$baseDomainPath";

  static Uri appUri(String endPoint, {Map<String, dynamic>? queries}) {
    var noNullQuery = queries;
    noNullQuery?.removeWhere((key, value) => value == null);
    noNullQuery =
        noNullQuery?.map((key, value) => MapEntry(key, value.toString()));

    if (noNullQuery?.isEmpty ?? false) noNullQuery = null;

    return Uri(
      scheme: baseScheme,
      host: baseDomain,
      path: basePath + endPoint,
      queryParameters: noNullQuery,
    );
  }
}
