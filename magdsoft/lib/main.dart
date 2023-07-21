import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsoft/business_logic/ProductCubit/products_cubit.dart';
import 'package:magdsoft/business_logic/bloc_observer.dart';
import 'package:magdsoft/business_logic/helpcubit/help_cubit_cubit.dart';
import 'package:magdsoft/business_logic/loginCubit/cubit/login_cubit.dart';
import 'package:magdsoft/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/shared/HomeScreen.dart';
import 'package:magdsoft/presentation/screens/shared/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'business_logic/global_cubit/global_cubit.dart';
import 'presentation/widget/toast.dart';

late LocalizationDelegate delegate;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () async {
      DioHelper.init();
      await CacheHelper.init();
      final locale =
          CacheHelper.getDataFromSharedPreference(key: 'language') ?? "ar";
      delegate = await LocalizationDelegate.create(
        fallbackLocale: locale,
        supportedLocales: ['ar', 'en'],
      );
      await delegate.changeLocale(Locale(locale));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var phoneNumber = prefs.getString("phoneNumber");
      runApp(MyApp(
        appRouter: AppRouter(),
        isUserLoggedIn: phoneNumber != null,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  final bool isUserLoggedIn;

  const MyApp({
    required this.appRouter,
    this.isUserLoggedIn = false,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = delegate.currentLocale.languageCode;

    delegate.onLocaleChanged = (Locale value) async {
      try {
        setState(() {
          Intl.defaultLocale = value.languageCode;
        });
      } catch (e) {
        showToast(e.toString());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
        BlocProvider(
          create: ((context) => LoginCubit()),
        ),
        BlocProvider(
          create: ((context) => HelpCubitCubit()),
        ),
        BlocProvider(
          create: ((context) => ProductsCubit()),
        ),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LocalizedApp(
                delegate,
                LayoutBuilder(builder: (context, constraints) {
                  return MediaQuery(
                    data: MediaQueryData.fromWindow(
                        WidgetsBinding.instance!.window),
                    child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'Werash',
                      localizationsDelegates: [
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        delegate,
                      ],
                      locale: delegate.currentLocale,
                      supportedLocales: delegate.supportedLocales,
                      onGenerateRoute: widget.appRouter.onGenerateRoute,
                      theme: ThemeData(
                        fontFamily: 'cairo',
                        //scaffoldBackgroundColor: AppColors.white,
                        appBarTheme: const AppBarTheme(
                          elevation: 0.0,
                          systemOverlayStyle: SystemUiOverlayStyle(
                            //statusBarColor: AppColors.transparent,
                            statusBarIconBrightness: Brightness.dark,
                          ),
                        ),
                      ),
                      home: Scaffold(
                        body: widget.isUserLoggedIn
                            ? const HomeScreen()
                            : Splash_screen(),
                      ),
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}
