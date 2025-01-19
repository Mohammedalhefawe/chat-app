import 'package:apiproject/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Position/Select_Your_Position.dart';
import '../../add/addinformation.dart';
import '../../chat/modules/chat_page.dart';
import '../../features/freelance/ui/detail_freelance.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/home/ui/splashScreen.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/widgets/log.dart';
import '../../features/posts/logic/home_cubit.dart';
import '../../features/posts/ui/detail_job_screen.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';
import '../../features/suggestion_post/ui/detail_suggestion.dart';
import '../../savepost/ui/detail_save_freelance.dart';
import '../../suggestion_freelance/ui/detail_suggestion_freelance.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      // case Routes.introScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const IntroScreen(),
      //   );
      //
      // case Routes.welcomeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const WelcomeScreen(),
      //   );
      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const ChatPage(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.addinformation:
        return MaterialPageRoute(
          builder: (_) => const AddInformation(),
        );

      case Routes.typesjoblist:
        return MaterialPageRoute(
          builder: (_) => const SelectPositionScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getSpecializations(),
            child: Home_Screen(),
          ),
        );

      case Routes.detailJob:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailJobScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case Routes.detailfreelance:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailFreelanceScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case Routes.detailJobSuggestionScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailSuggestionScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case Routes.detailFreelanceSuggestionScreen:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailSuggestionFreelanceScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case Routes.detailsavefreelance:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailSaveFreelanceScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
