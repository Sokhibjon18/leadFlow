part of 'funnel_builder_cubit.dart';

@freezed
class FunnelBuilderState with _$FunnelBuilderState {
  const factory FunnelBuilderState.initial() = _Initial;
  const factory FunnelBuilderState.currentScreenParams(List<ComponentParams> params) = _CurrentScreenParams;
}
