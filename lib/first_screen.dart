part of carp_study_app;

class CARPStudyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en'),
        Locale('da'),
        Locale('es'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        RPLocalizations.delegate,
        // Built-in localization of basic text for Cupertino widgets
        GlobalCupertinoLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      localeListResolutionCallback: (locales, supportedLocales) {
        return null;
      },
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Work around for:
        // https://github.com/flutter/flutter/issues/39032
        if (locale == null) {
          Intl.defaultLocale = supportedLocales.first.languageCode;
          return supportedLocales.first;
        }

        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode
              /* && supportedLocale.countryCode == locale.countryCode */
              ) {
            Intl.defaultLocale = supportedLocale.languageCode;
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        Intl.defaultLocale = supportedLocales.first.languageCode;
        return supportedLocales.first;
      },
      theme: carpStudyTheme,
      darkTheme: carpStudyDarkTheme,
      home: SplashScreen(),
      routes: {
        '/HomePage': (context) => CARPStudyAppHome(),
        '/ConsentPage': (context) => InformedConsentPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// This methods is used to set up the entire app, including:
  ///  * initialize the bloc
  ///  * authenticate the user
  ///  * get the invitation
  ///  * get the study
  ///  * initialize sensing
  ///  * start sensing
  Future<bool> init(BuildContext context) async {
    await bloc.init();
    await bloc.backend.authenticate(context);
    await bloc.backend.getStudyInvitation(context);

    await bloc.getMessages();
    await bloc.initializeSensing();

    // wait 10 sec and the start sampling
    // TODO - legally, we should not start sensing before informed consent is accepted...
    Timer(Duration(seconds: 10), () => bloc.start());

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(context),
        builder: (context, snapshot) => (!snapshot.hasData)
            ? Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [CircularProgressIndicator()],
                )))
            : Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: (bloc.hasInformedConsentBeenAccepted) ? CARPStudyAppHome() : InformedConsentPage(),
              ));
  }

  // TODO - Not used right now - should we?
  Widget get _splashImage => Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Center(
            child: new Hero(
          tag: "tick",
          child: new Image.asset('assets/images/splash_cachet.png', width: 150.0, height: 150.0, scale: 1.0),
        )),
      );
}
