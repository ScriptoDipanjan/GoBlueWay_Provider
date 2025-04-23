String apiUrl = "https://service.goblueway.net/api";
String paymentUrl =
    "Your Payment Url if it is same as apiUrl base url paste it here";

Map<String, String>? headersToken(token, language) => {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
      // "Accept-Language": language
    };

Map<String, String>? get headers =>
    {'Accept': 'application/json', 'Content-Type': 'application/json'};
