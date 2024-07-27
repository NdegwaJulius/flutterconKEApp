import 'package:flutter/material.dart';

import '../../features/splash/splash_screen.dart';
import '../../common/widgets/text_scale_factor.dart';
import '../../features/dashboard/ui/dashboard_screen.dart';
import 'main_navigation.dart';
import 'route_names.dart';

part 'main_navigator_state.dart';

/// The MainNavigator class is a StatefulWidget that serves as the primary
/// navigator for the application. It manages the navigation stack and routes.
///
/// The MainNavigator widget contains a child widget that is displayed within
/// its navigation context.
class MainNavigator extends StatefulWidget {
  final Widget? child;

  const MainNavigator({
    this.child,
    super.key,
  });

  @override
  MainNavigatorState createState() => MainNavigatorState();

  /// A static method to retrieve the nearest MainNavigationMixin instance
  /// from the provided [context]. This is useful for performing navigation
  /// operations within the application.
  ///
  /// The [rootNavigator] parameter determines whether to search from the
  /// root ancestor or the nearest ancestor.
  ///
  /// Throws a [FlutterError] if no MainNavigationMixin is found in the
  /// widget tree.
  static MainNavigationMixin of(BuildContext context,
      {bool rootNavigator = false}) {
    final navigator = rootNavigator
        ? context.findRootAncestorStateOfType<MainNavigationMixin>()
        : context.findAncestorStateOfType<MainNavigationMixin>();
    assert(() {
      if (navigator == null) {
        throw FlutterError(
            'MainNavigation operation requested with a context that does not include a MainNavigation.\n'
            'The context used to push or pop routes from the MainNavigation must be that of a '
            'widget that is a descendant of a MainNavigator widget.');
      }
      return true;
    }());
    return navigator!;
  }
}
