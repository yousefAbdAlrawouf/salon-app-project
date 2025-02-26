import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salon_app/core/Dio/service_locator.dart';
import 'package:salon_app/core/app_manger/app_manager_cubit.dart';
import 'package:salon_app/core/app_manger/app_manager_state.dart';
import 'package:salon_app/core/routes/routes_path.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/pages/Order_details.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/failedAndSuccess.dart';
import 'package:salon_app/features/User_App/Home_user/Presentation/Pages/home_page.dart';
import 'package:salon_app/features/Provider_App/Home_provider/presentation/pages/home_page.dart';
import 'package:salon_app/features/Provider_App/auth/data/abstract_auth_remote.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/manger/authntication_cubit.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/CreateNewPassword.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/ForgettingPassword.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/OTP_Number.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/SplashPage.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/sign_in_page.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/sign_up_page.dart';
import 'package:salon_app/features/Provider_App/auth/presentation/pages/welcome_page.dart';
import 'package:salon_app/features/products_and_services/presentation/manager/Products_And_Services_Cubit.dart';
import 'package:salon_app/features/products_and_services/presentation/pages/AddProduct.dart';
import 'package:salon_app/features/products_and_services/presentation/pages/ShowProductsAndServices.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: RoutesPath.splash,
          builder: (context, state) => Splashpage(),
          routes: [
            GoRoute(
                path: RoutesPath.welcome,
                builder: (context, state) => WelcomePage()),
            GoRoute(
                path: RoutesPath.homeProvider,
                builder: (context, state) {
                  return BlocProvider.value(
                      value: (state.extra as AuthnticationCubit),
                      child: const HomePageProvider());
                }),
            GoRoute(
              path: RoutesPath.otpNumber,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>;

                return OTPNumberConfirm(
                  phoneNumber: extra['phoneNumber'],
                );
              },
            ),
            GoRoute(
              path: RoutesPath.changePassword,
              builder: (context, state) {
                final extra = state.extra as Map<String, dynamic>;

                return Changepassword(
                  code: extra['code'],
                  phoneNumber: extra['phoneNumber'],
                );
              },
            ),
            GoRoute(
                path: RoutesPath.signUp,
                builder: (context, state) {
                  return BlocProvider(
                      create: (context) => AuthnticationCubit(
                          getInstance<AuthRemoteDataSource>()),
                      child: SignUpPage());
                }),
            GoRoute(
                path: RoutesPath.splash,
                builder: (context, state) => Splashpage()),
            GoRoute(
                path: RoutesPath.forgetPassword,
                builder: (context, state) => ForgetPasswordPage()),
            GoRoute(
                path: RoutesPath.showproductsandservices,
                builder: (context, state) => Showproductsandservices()),
            GoRoute(
              path: RoutesPath.signIn,
              builder: (context, GoRouterState state) {
                return BlocBuilder<AppManagerCubit, AppManagerState>(
                    builder: (context, state) {
                  return state.authResponseModel == null
                      ? SignInPage()
                      : HomePage();
                });
              },
            ),
            GoRoute(
                path: RoutesPath.homeUser,
                builder: (context, state) => HomePage()),
            GoRoute(
                path: RoutesPath.faildAndSuccess,
                builder: (context, state) => FaildAndSuccess()),
            GoRoute(
                path: RoutesPath.orderDetails,
                builder: (context, state) => OrderDetails()),
            GoRoute(
                path: RoutesPath.addNewProduct,
                builder: (context, state) {
                  return BlocProvider.value(
                      value: (state.extra as ProductsAndServicesCubit),
                      child: Addproduct());
                }),
          ]),
    ],
  );
}
