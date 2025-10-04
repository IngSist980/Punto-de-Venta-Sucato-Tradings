import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? DashboardWidget() : CrearcuentaWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? DashboardWidget()
              : CrearcuentaWidget(),
        ),
        FFRoute(
          name: ADM001IniciarSesionWidget.routeName,
          path: ADM001IniciarSesionWidget.routePath,
          builder: (context, params) => ADM001IniciarSesionWidget(),
        ),
        FFRoute(
          name: CrearcuentaWidget.routeName,
          path: CrearcuentaWidget.routePath,
          builder: (context, params) => CrearcuentaWidget(),
        ),
        FFRoute(
          name: ADM002RecoveryPassWidget.routeName,
          path: ADM002RecoveryPassWidget.routePath,
          builder: (context, params) => ADM002RecoveryPassWidget(),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: CreateReadClientesWidget.routeName,
          path: CreateReadClientesWidget.routePath,
          builder: (context, params) => CreateReadClientesWidget(),
        ),
        FFRoute(
          name: CreateReadEmpleadosWidget.routeName,
          path: CreateReadEmpleadosWidget.routePath,
          builder: (context, params) => CreateReadEmpleadosWidget(),
        ),
        FFRoute(
          name: CreateReadInventarioWidget.routeName,
          path: CreateReadInventarioWidget.routePath,
          builder: (context, params) => CreateReadInventarioWidget(),
        ),
        FFRoute(
          name: CreateReadProveedorWidget.routeName,
          path: CreateReadProveedorWidget.routePath,
          builder: (context, params) => CreateReadProveedorWidget(),
        ),
        FFRoute(
          name: CreateReadIKitsWidget.routeName,
          path: CreateReadIKitsWidget.routePath,
          builder: (context, params) => CreateReadIKitsWidget(),
        ),
        FFRoute(
          name: ReadReporteWidget.routeName,
          path: ReadReporteWidget.routePath,
          builder: (context, params) => ReadReporteWidget(),
        ),
        FFRoute(
          name: CreateReadOrdenesProveedorWidget.routeName,
          path: CreateReadOrdenesProveedorWidget.routePath,
          builder: (context, params) => CreateReadOrdenesProveedorWidget(),
        ),
        FFRoute(
          name: TiendaWidget.routeName,
          path: TiendaWidget.routePath,
          builder: (context, params) => TiendaWidget(),
        ),
        FFRoute(
          name: CreatePedidoWidget.routeName,
          path: CreatePedidoWidget.routePath,
          builder: (context, params) => CreatePedidoWidget(),
        ),
        FFRoute(
          name: ReadPedidosWidget.routeName,
          path: ReadPedidosWidget.routePath,
          builder: (context, params) => ReadPedidosWidget(),
        ),
        FFRoute(
          name: ProductosEnOrdenWidget.routeName,
          path: ProductosEnOrdenWidget.routePath,
          builder: (context, params) => ProductosEnOrdenWidget(
            productosEnLaOrden: params.getParam<ProductosOrdenesClientesStruct>(
              'productosEnLaOrden',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ProductosOrdenesClientesStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: EditorProductosWidget.routeName,
          path: EditorProductosWidget.routePath,
          builder: (context, params) => EditorProductosWidget(
            produtosEnLaOrden: params.getParam<ProductosOrdenesClientesStruct>(
              'produtosEnLaOrden',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ProductosOrdenesClientesStruct.fromSerializableMap,
            ),
            refOrden: params.getParam(
              'refOrden',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['PuntoDeVenta', 'OdenCompra'],
            ),
          ),
        ),
        FFRoute(
          name: FacturaWidget.routeName,
          path: FacturaWidget.routePath,
          asyncParams: {
            'orden': getDoc(
                ['PuntoDeVenta', 'OdenCompra'], OdenCompraRecord.fromSnapshot),
          },
          builder: (context, params) => FacturaWidget(
            orden: params.getParam(
              'orden',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CreateReadRepartidorWidget.routeName,
          path: CreateReadRepartidorWidget.routePath,
          builder: (context, params) => CreateReadRepartidorWidget(),
        ),
        FFRoute(
          name: DespachosWidget.routeName,
          path: DespachosWidget.routePath,
          builder: (context, params) => DespachosWidget(),
        ),
        FFRoute(
          name: ReadDevolucionesWidget.routeName,
          path: ReadDevolucionesWidget.routePath,
          builder: (context, params) => ReadDevolucionesWidget(),
        ),
        FFRoute(
          name: ReporteDeVentasWidget.routeName,
          path: ReporteDeVentasWidget.routePath,
          builder: (context, params) => ReporteDeVentasWidget(),
        ),
        FFRoute(
          name: ReporteDeVentasPendientesWidget.routeName,
          path: ReporteDeVentasPendientesWidget.routePath,
          builder: (context, params) => ReporteDeVentasPendientesWidget(),
        ),
        FFRoute(
          name: ReporteProductosMasVendidosWidget.routeName,
          path: ReporteProductosMasVendidosWidget.routePath,
          builder: (context, params) => ReporteProductosMasVendidosWidget(),
        ),
        FFRoute(
          name: ReporteInventarioWidget.routeName,
          path: ReporteInventarioWidget.routePath,
          builder: (context, params) => ReporteInventarioWidget(),
        ),
        FFRoute(
          name: ReporteComprasProveedoresWidget.routeName,
          path: ReporteComprasProveedoresWidget.routePath,
          builder: (context, params) => ReporteComprasProveedoresWidget(),
        ),
        FFRoute(
          name: CajaCerradaWidget.routeName,
          path: CajaCerradaWidget.routePath,
          builder: (context, params) => CajaCerradaWidget(
            refAjustesApp: params.getParam(
              'refAjustesApp',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['AjustesApp'],
            ),
          ),
        ),
        FFRoute(
          name: ReporteDeVentasHoyWidget.routeName,
          path: ReporteDeVentasHoyWidget.routePath,
          builder: (context, params) => ReporteDeVentasHoyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/crearcuenta';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
