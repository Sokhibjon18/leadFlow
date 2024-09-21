
class ClientData {
  final Map<String, dynamic> form;
  final int instagramCount;
  final int telegramCount;
  final int twitterCount;

  ClientData({
    required this.form,
    required this.instagramCount,
    required this.telegramCount,
    required this.twitterCount,
  });

  factory ClientData.fromMap(Map<String, dynamic> map) {
    return ClientData(
      form: map['form'] as Map<String, dynamic>? ?? {},
      instagramCount: map['instagramCount'] as int? ?? 0,
      telegramCount: map['telegramCount'] as int? ?? 0,
      twitterCount: map['twitterCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'form': form,
      'instagramCount': instagramCount,
      'telegramCount': telegramCount,
      'twitterCount': twitterCount,
    };
  }

  ClientData copyWith({
    Map<String, dynamic>? form,
    int? instagramCount,
    int? telegramCount,
    int? twitterCount,
  }) {
    return ClientData(
      form: form ?? this.form,
      instagramCount: instagramCount ?? this.instagramCount,
      telegramCount: telegramCount ?? this.telegramCount,
      twitterCount: twitterCount ?? this.twitterCount,
    );
  }
}