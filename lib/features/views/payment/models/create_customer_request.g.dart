// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCustomerRequest _$CreateCustomerRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCustomerRequest(
      email: json['email'] as String,
      appId: json['app_id'] as String,
      cookies: Cookies.fromJson(json['cookies'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCustomerRequestToJson(
        CreateCustomerRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'app_id': instance.appId,
      'cookies': instance.cookies.toJson(),
    };

Cookies _$CookiesFromJson(Map<String, dynamic> json) => Cookies(
      ip: json['ip'] as String,
      network: json['network'] as String,
      version: json['version'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      regionCode: json['region_code'] as String,
      country: json['country'] as String,
      countryName: json['country_name'] as String,
      countryCode: json['country_code'] as String,
      countryCodeIso3: json['country_code_iso3'] as String,
      countryCapital: json['country_capital'] as String,
      countryTld: json['country_tld'] as String,
      continentCode: json['continent_code'] as String,
      inEu: json['in_eu'] as bool,
      postal: json['postal'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timezone: json['timezone'] as String,
      utcOffset: json['utc_offset'] as String,
      countryCallingCode: json['country_calling_code'] as String,
      currency: json['currency'] as String,
      currencyName: json['currency_name'] as String,
      languages: json['languages'] as String,
      countryArea: (json['country_area'] as num).toInt(),
      countryPopulation: (json['country_population'] as num).toInt(),
      asn: json['asn'] as String,
      org: json['org'] as String,
      eventSourceUrl: json['event_source_url'] as String,
      pixelId: json['pixel_id'] as String,
      fbc: json['fbc'] as String,
      fbps: json['fbps'] as String,
      userAgent: json['userAgent'] as String,
    );

Map<String, dynamic> _$CookiesToJson(Cookies instance) => <String, dynamic>{
      'ip': instance.ip,
      'network': instance.network,
      'version': instance.version,
      'city': instance.city,
      'region': instance.region,
      'region_code': instance.regionCode,
      'country': instance.country,
      'country_name': instance.countryName,
      'country_code': instance.countryCode,
      'country_code_iso3': instance.countryCodeIso3,
      'country_capital': instance.countryCapital,
      'country_tld': instance.countryTld,
      'continent_code': instance.continentCode,
      'in_eu': instance.inEu,
      'postal': instance.postal,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'utc_offset': instance.utcOffset,
      'country_calling_code': instance.countryCallingCode,
      'currency': instance.currency,
      'currency_name': instance.currencyName,
      'languages': instance.languages,
      'country_area': instance.countryArea,
      'country_population': instance.countryPopulation,
      'asn': instance.asn,
      'org': instance.org,
      'event_source_url': instance.eventSourceUrl,
      'pixel_id': instance.pixelId,
      'fbc': instance.fbc,
      'fbps': instance.fbps,
      'userAgent': instance.userAgent,
    };
