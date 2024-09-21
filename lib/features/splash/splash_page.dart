import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/core/di/injection.dart';
import 'package:lead_flow/core/router/app_router.gr.dart';
import 'package:lead_flow/features/splash/data/splash_repository.dart';
import 'package:lead_flow/utils/extensions.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    @pathParam this.id,
  });

  final String? id;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashRepository repository = getIt<SplashRepository>();
  String? platform;
  String? uid;
  String? project;

  @override
  void initState() {
    super.initState();
    final settingsUri = Uri.base.toString();
    log(settingsUri);
    var splitId = widget.id?.split('&');
    if((splitId?.length ?? 0) < 3) {
      context.router.replace(const AuthRoute());
      return;
    }
    uid = splitId?[0];
    project = splitId?[1];
    platform = splitId?[2];
    checkDestination();
  }

  Future checkDestination() async {
    if (platform != null && uid != null && project != null) {
      log('message 1');
      var body = await repository.getClientFunnel(uid!, project!, platform!);
      if (body == null) {
        context.router.replace(const AuthRoute());
        return;
      }
      context.router.replace(
        FunnelRoute(
          bodyDTO: body,
          ownerUid: uid!,
          project: project!,
        ),
      );
    } else {
      log('message 3');
      context.router.replace(const AuthRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
