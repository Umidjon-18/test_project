enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

extension CheckAuthentication on AuthenticationStatus {
  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
}