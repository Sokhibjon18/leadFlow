// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:lead_flow/features/auth/presentation/auth_page.dart' as _i1;
import 'package:lead_flow/features/funnel_builder/presentation/funnel_builder_page.dart'
    as _i2;
import 'package:lead_flow/features/home/home_page.dart' as _i3;

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthPage();
    },
  );
}

/// generated route for
/// [_i2.FunnelBuilderPage]
class FunnelBuilderRoute extends _i4.PageRouteInfo<FunnelBuilderRouteArgs> {
  FunnelBuilderRoute({
    _i5.Key? key,
    required String projectName,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          FunnelBuilderRoute.name,
          args: FunnelBuilderRouteArgs(
            key: key,
            projectName: projectName,
          ),
          initialChildren: children,
        );

  static const String name = 'FunnelBuilderRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FunnelBuilderRouteArgs>();
      return _i2.FunnelBuilderPage(
        key: args.key,
        projectName: args.projectName,
      );
    },
  );
}

class FunnelBuilderRouteArgs {
  const FunnelBuilderRouteArgs({
    this.key,
    required this.projectName,
  });

  final _i5.Key? key;

  final String projectName;

  @override
  String toString() {
    return 'FunnelBuilderRouteArgs{key: $key, projectName: $projectName}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}
