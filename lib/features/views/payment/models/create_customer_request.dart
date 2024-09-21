import 'package:json_annotation/json_annotation.dart';
import 'ip_info_model.dart';

part 'create_customer_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateCustomerRequest {
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "app_id")
  final String appId;
  @JsonKey(name: "cookies")
  final Cookies cookies;

  CreateCustomerRequest({
    required this.email,
    required this.appId,
    required this.cookies,
  });

  CreateCustomerRequest.fromIpInfo({
    required this.email,
    required this.appId,
    required IpInfoModel ipInfo,
    required String eventSourceUrl,
    required String pixelId,
    required String userAgent,
    required Map<String, dynamic> facebookPixelParams,
  }) : cookies = Cookies.fromIpInfoModel(
          ipInfo,
          eventSourceUrl: eventSourceUrl,
          pixelId: pixelId,
          fbps: facebookPixelParams['fbps'].join(' '),
          fbc: facebookPixelParams['fbc'],
          userAgent: userAgent,
        );

  factory CreateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomerRequestToJson(this);
}

@JsonSerializable()
class Cookies {
  @JsonKey(name: "ip")
  final String ip;
  @JsonKey(name: "network")
  final String network;
  @JsonKey(name: "version")
  final String version;
  @JsonKey(name: "city")
  final String city;
  @JsonKey(name: "region")
  final String region;
  @JsonKey(name: "region_code")
  final String regionCode;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "country_name")
  final String countryName;
  @JsonKey(name: "country_code")
  final String countryCode;
  @JsonKey(name: "country_code_iso3")
  final String countryCodeIso3;
  @JsonKey(name: "country_capital")
  final String countryCapital;
  @JsonKey(name: "country_tld")
  final String countryTld;
  @JsonKey(name: "continent_code")
  final String continentCode;
  @JsonKey(name: "in_eu")
  final bool inEu;
  @JsonKey(name: "postal")
  final String postal;
  @JsonKey(name: "latitude")
  final double latitude;
  @JsonKey(name: "longitude")
  final double longitude;
  @JsonKey(name: "timezone")
  final String timezone;
  @JsonKey(name: "utc_offset")
  final String utcOffset;
  @JsonKey(name: "country_calling_code")
  final String countryCallingCode;
  @JsonKey(name: "currency")
  final String currency;
  @JsonKey(name: "currency_name")
  final String currencyName;
  @JsonKey(name: "languages")
  final String languages;
  @JsonKey(name: "country_area")
  final int countryArea;
  @JsonKey(name: "country_population")
  final int countryPopulation;
  @JsonKey(name: "asn")
  final String asn;
  @JsonKey(name: "org")
  final String org;
  @JsonKey(name: "event_source_url")
  final String eventSourceUrl;
  @JsonKey(name: "pixel_id")
  final String pixelId;
  @JsonKey(name: "fbc")
  final String fbc;
  @JsonKey(name: "fbps")
  final String fbps;
  @JsonKey(name: "userAgent")
  final String userAgent;

  Cookies({
    required this.ip,
    required this.network,
    required this.version,
    required this.city,
    required this.region,
    required this.regionCode,
    required this.country,
    required this.countryName,
    required this.countryCode,
    required this.countryCodeIso3,
    required this.countryCapital,
    required this.countryTld,
    required this.continentCode,
    required this.inEu,
    required this.postal,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.utcOffset,
    required this.countryCallingCode,
    required this.currency,
    required this.currencyName,
    required this.languages,
    required this.countryArea,
    required this.countryPopulation,
    required this.asn,
    required this.org,
    required this.eventSourceUrl,
    required this.pixelId,
    required this.fbc,
    required this.fbps,
    required this.userAgent,
  });

  Cookies.fromIpInfoModel(
    IpInfoModel ipInfo, {
    required this.eventSourceUrl,
    required this.pixelId,
    required this.fbps,
    required this.fbc,
    required this.userAgent,
  })  : ip = ipInfo.ip,
        network = ipInfo.network,
        version = ipInfo.version,
        city = ipInfo.city,
        region = ipInfo.region,
        regionCode = ipInfo.regionCode,
        country = ipInfo.country,
        countryName = ipInfo.countryName,
        countryCode = ipInfo.countryCode,
        countryCodeIso3 = ipInfo.countryCodeIso3,
        countryCapital = ipInfo.countryCapital,
        countryTld = ipInfo.countryTld,
        continentCode = ipInfo.continentCode,
        inEu = ipInfo.inEu,
        postal = ipInfo.postal?.toString() ?? '',
        latitude = ipInfo.latitude,
        longitude = ipInfo.longitude,
        timezone = ipInfo.timezone,
        utcOffset = ipInfo.utcOffset,
        countryCallingCode = ipInfo.countryCallingCode,
        currency = ipInfo.currency,
        currencyName = ipInfo.currencyName,
        languages = ipInfo.languages,
        countryArea = ipInfo.countryArea,
        countryPopulation = ipInfo.countryPopulation,
        asn = ipInfo.asn,
        org = ipInfo.org;

  factory Cookies.fromJson(Map<String, dynamic> json) => _$CookiesFromJson(json);

  Map<String, dynamic> toJson() => _$CookiesToJson(this);
}
