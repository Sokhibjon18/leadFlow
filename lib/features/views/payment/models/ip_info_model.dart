import 'package:json_annotation/json_annotation.dart';

part 'ip_info_model.g.dart';

@JsonSerializable()
class IpInfoModel {
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
  final dynamic postal;
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

  IpInfoModel({
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
  });

  IpInfoModel.empty()
      : ip = '',
        network = '',
        version = '',
        city = '',
        region = '',
        regionCode = '',
        country = '',
        countryName = '',
        countryCode = '',
        countryCodeIso3 = '',
        countryCapital = '',
        countryTld = '',
        continentCode = '',
        inEu = false,
        postal = null,
        latitude = 0.0,
        longitude = 0.0,
        timezone = '',
        utcOffset = '',
        countryCallingCode = '',
        currency = '',
        currencyName = '',
        languages = '',
        countryArea = 0,
        countryPopulation = 0,
        asn = '',
        org = '';

  factory IpInfoModel.fromJson(Map<String, dynamic> json) => _$IpInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$IpInfoModelToJson(this);
}
