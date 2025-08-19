class ApiEndpoints {
  ////
  static const baseUrl = "https://with-prana-backend.onrender.com";
  // static const baseUrl = "https://ae47fa936e82.ngrok-free.app";

  ////Auth
  static const signIn = "$baseUrl/api/user/login";
  static const registerAccount = "$baseUrl/api/user/register";
  static const resendOtp = "$baseUrl/api/user/resend-otp";
  static const verifyOtp = "$baseUrl/api/user/verify";
}
