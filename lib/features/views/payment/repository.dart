// import 'dart:convert';
// import 'dart:html' as html;
// import 'dart:js' as js;
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// class PaymentRepository {
//   final Dio _dio = Dio();
//   // final SupabaseClient _client = Supabase.instance.client;
//
//   static String customerId = '';
//   static String email = '';
//
//   String host = kDebugMode ? 'https://apidev.appverse.me' : 'https://appverse-adapty.herokuapp.com';
//
//   Map<String, dynamic> _getFacebookPixelParams() {
//     final jsonString = js.context.callMethod('getFacebookPixelParams');
//
//     final Map<String, dynamic> result = json.decode(jsonString);
//
//     return {
//       'fbc': result['fbc'] as String? ?? '',
//       'fbps': (result['fbps'] as List<dynamic>?)?.cast<String>() ?? [],
//     };
//   }
//
//   Future<bool> isUserSubscribed() async {
//     try {
//       var tableName = kDebugMode ? 'sub_state_debug' : 'sub_state';
//       var data = await _client.from(tableName).select('premium').eq('email', email);
//
//       if (data.isEmpty) return false;
//
//       var isPremium = data[0]['premium'] ?? false;
//
//       appLog('User isPremium: $isPremium');
//
//       return isPremium;
//     } catch (e) {
//       appLog('isUserPremium: $e');
//       return false;
//     }
//   }
//
//   Future getCustomerId(String email) async {
//     PaymentRepository.email = email;
//     var ipInfo = await _getIpInfo();
//     var createCustomerRequest = CreateCustomerRequest.fromIpInfo(
//       email: email,
//       appId: ScreenBuilder.appId,
//       pixelId: ScreenBuilder.pixelId,
//       ipInfo: ipInfo,
//       eventSourceUrl: Uri.base.toString(),
//       facebookPixelParams: _getFacebookPixelParams(),
//       userAgent: html.window.navigator.userAgent,
//     );
//
//     appLog(jsonEncode(createCustomerRequest.toJson()));
//
//     var result = await _dio.post(
//       '$host/webfunnel/create-customer',
//       data: jsonEncode(createCustomerRequest.toJson()),
//     );
//
//     appLog(result);
//     customerId = result.data['customer_id'];
//   }
//
//   Future<String> getClientSecret(String priceId) async {
//     try {
//       var resultSubscription = await _dio.post(
//         '$host/webfunnel/create-subscription',
//         data: jsonEncode({
//           "app_id": ScreenBuilder.appId,
//           "price_id": priceId,
//           "customer_id": customerId,
//         }),
//       );
//       appLog(resultSubscription);
//
//       return resultSubscription.data['clientSecret'] ?? '';
//     } catch (e) {
//       appLog(e);
//       return '';
//     }
//   }
//
//   Future<IpInfoModel> _getIpInfo() async {
//     try {
//       final response = await _dio.get('https://ipapi.co/json/');
//
//       if (response.statusCode == 200) {
//         return IpInfoModel.fromJson(response.data);
//       } else {
//         appLog('Failed to load IP info');
//         return IpInfoModel.empty();
//       }
//     } catch (e) {
//       appLog('Error fetching IP info: $e');
//       return IpInfoModel.empty();
//     }
//   }
// }
