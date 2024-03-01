import 'package:apex_mobile/src/app/presentation/auth/login_view.dart';
import 'package:apex_mobile/src/app/presentation/face_id_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_router.gr.dart';

// Instance of [AppRouter] to be provided to the app.
final appRouter = Provider<AppRouter>((ref) => AppRouter());

/// The main router for the app
@AutoRouterConfig(
  replaceInRouteName:
      "View,Route", // Replaces the words "View" and "Route" in route names
)
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType =>
      const RouteType.cupertino(); // Sets the default route type to Cupertino

  /// The list of routes for the app
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SignInRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: FaceIdRoute.page,
        ),
      ];
}
