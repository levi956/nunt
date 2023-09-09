abstract interface class AuthenticationServiceInterface {
  Future<void> login({required String email, required String password});
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  Future<void> logout();
  Future<void> signInAnonymous();
}
