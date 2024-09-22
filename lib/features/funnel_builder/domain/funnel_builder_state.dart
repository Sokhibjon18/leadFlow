part of 'funnel_builder_cubit.dart';

@freezed
class FunnelBuilderState with _$FunnelBuilderState {
  const factory FunnelBuilderState.initial() = _Initial;

  const factory FunnelBuilderState.currentScreenParams(List<ComponentParams> params, [int? randomNumber]) =
      _CurrentScreenParams;

  const factory FunnelBuilderState.publishing() = _Publishing;

  const factory FunnelBuilderState.published(
    intaLink,
    teleLink,
    facebookLink,
    twitterLink,
  ) = _Published;

  const factory FunnelBuilderState.failed() = _PublishingFailed;
}
