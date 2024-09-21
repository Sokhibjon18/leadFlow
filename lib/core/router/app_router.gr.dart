// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:lead_flow/data/dto/body_dto.dart' as _i7;
import 'package:lead_flow/features/auth/presentation/auth_page.dart' as _i1;
import 'package:lead_flow/features/funnel/funnel_page.dart' as _i2;
import 'package:lead_flow/features/home/home_page.dart' as _i3;
import 'package:lead_flow/features/splash/splash_page.dart' as _i4;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.FunnelPage]
class FunnelRoute extends _i5.PageRouteInfo<FunnelRouteArgs> {
  FunnelRoute({
    _i6.Key? key,
    required _i7.BodyDTO bodyDTO,
    required String ownerUid,
    required String project,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          FunnelRoute.name,
          args: FunnelRouteArgs(
            key: key,
            bodyDTO: bodyDTO,
            ownerUid: ownerUid,
            project: project,
          ),
          initialChildren: children,
        );

  static const String name = 'FunnelRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FunnelRouteArgs>();
      return _i2.FunnelPage(
        key: args.key,
        bodyDTO: args.bodyDTO,
        ownerUid: args.ownerUid,
        project: args.project,
      );
    },
  );
}

class FunnelRouteArgs {
  const FunnelRouteArgs({
    this.key,
    required this.bodyDTO,
    required this.ownerUid,
    required this.project,
  });

  final _i6.Key? key;

  final _i7.BodyDTO bodyDTO;

  final String ownerUid;

  final String project;

  @override
  String toString() {
    return 'FunnelRouteArgs{key: $key, bodyDTO: $bodyDTO, ownerUid: $ownerUid, project: $project}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i6.Key? key,
    String? id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SplashRouteArgs>(
          orElse: () => SplashRouteArgs(id: pathParams.optString('id')));
      return _i4.SplashPage(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    this.id,
  });

  final _i6.Key? key;

  final String? id;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, id: $id}';
  }
}
