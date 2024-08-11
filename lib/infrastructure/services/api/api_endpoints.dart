class ApiEndpoints {
  static const String baseUrl =
      'http://localhost:3000/v1'; // Replace with your actual base URL
  static const String contentType = 'application/json';
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';

  // User endpoints
  static const String userProfile = '/user/profile';
  static const String updateProfile = '/user/update-profile';

  // Other endpoints
  // Add more endpoints as needed for your application
}
