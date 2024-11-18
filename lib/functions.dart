String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

String verifyLogin(bool loggedIn) {
  if (loggedIn) {
    return '/CatalogueScreen';
  }
  return '/LoginScreen';
}

