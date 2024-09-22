import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lead_flow/data/dto/body_dto.dart';
import 'package:lead_flow/data/dto/component_dto.dart';
import 'package:lead_flow/data/dto/screen_dto.dart';
import 'package:lead_flow/data/models/component_params.dart';
import 'package:lead_flow/features/splash/model/client_data.dart';
import 'package:lead_flow/utils/logger.dart';

part 'funnel_builder_cubit.freezed.dart';
part 'funnel_builder_state.dart';

class FunnelBuilderCubit extends Cubit<FunnelBuilderState> {
  Map<int, List<ComponentParams>> params = {0: []};
  int selectedScreenIndex = 0;
  String appName = "";

  FunnelBuilderCubit() : super(const FunnelBuilderState.initial());

  addScreen() {
    params[params.length] = [];
  }

  removeScreen(int index) {}

  addComponentParams(ComponentParams param) {
    params[selectedScreenIndex]?.add(param);
    appLog(params.toString());
    emit(FunnelBuilderState.currentScreenParams(params[selectedScreenIndex] ?? []));
  }

  removeComponentParams() {}

  publish(String appName) {
    var screens = <ScreenDTO>[];
    params.forEach((key, value) {
      screens.add(
        ScreenDTO(
          components: value.map((e) => ComponentDTO.fromParams(e, appName)).toList(),
          name: key.toString(),
        ),
      );
    });
    var body = BodyDTO(screens: screens, appName: appName);
    var data =
        ClientData(form: body.toJson(), instagramCount: 0, telegramCount: 0, twitterCount: 0);

    var uid = FirebaseAuth.instance.currentUser?.uid ?? 'notAuthorized';
    FirebaseFirestore.instance.collection(uid).doc(appName).set(data.toMap());
  }
}
