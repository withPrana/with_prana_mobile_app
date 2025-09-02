class ApiEndpoints {
  ////
  static const baseUrl = "https://with-prana-backend-1.onrender.com";
  // static const baseUrl =
  //     "https://sd-bottle-possibility-early.trycloudflare.com";

  ////Auth
  static const signInEndpoint = "$baseUrl/api/user/login";
  static const registerAccountEndpoint = "$baseUrl/api/user/register";
  static const resendOtpEndpoint = "$baseUrl/api/user/resend-otp";
  static const verifyOtpEndpoint = "$baseUrl/api/user/verify";

  ////user
  static const getUserByIdEndpoint = "$baseUrl/api/admin/users";

  ////Category
  static const categoryEndpointEndpoint = "$baseUrl/api/category";
  static const subCategoryEndpointEndpoint = "$baseUrl/api/category";

  ////Liked content
  static const addLikeEndpoint = "$baseUrl/api/liked/like";
  static const dislikeEndpoint = "$baseUrl/api/liked/dislike";
  static const getLikedContentsEndpoint = "$baseUrl/api/liked/user";
}
