class ApiEndpoints {
  ////
  static const baseUrl = "https://with-prana-backend-1.onrender.com";
  // static const baseUrl =
  //     "https://sd-bottle-possibility-early.trycloudflare.com";

  ////Auth
  static const signIn = "$baseUrl/api/user/login";
  static const registerAccount = "$baseUrl/api/user/register";
  static const resendOtp = "$baseUrl/api/user/resend-otp";
  static const verifyOtp = "$baseUrl/api/user/verify";

  ////Category
  static const categoryEndpoint = "$baseUrl/api/category";
  static const subCategoryEndpoint = "$baseUrl/api/category";
}
