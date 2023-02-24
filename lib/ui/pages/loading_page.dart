part of carp_study_app;

class LoadingPage extends StatefulWidget {
  final String? redirectionOrigin;

  const LoadingPage({super.key, this.redirectionOrigin});

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    // configure the BLOC if not already done or in progress
    // note that this build() method can be called several time, but we only
    // want the bloc to be configured once.
    //
    // the only reason to call it here - instead of in the initState() method -
    // is to have a handle to the context object, which is to be used in the
    // pop-up windows from CARP
    if (!bloc.isConfiguring) {
      bloc.configure(context).then((_) {
        // when the configure is done, the localizations should have been downloaded
        // and we can ask the app to reload the translations
        CarpStudyApp.reloadLocale(context);

        var redirectTo = widget.redirectionOrigin ?? 'tasks';
        // navigate to the right screen
        context.go((bloc.shouldInformedConsentBeShown) ? '/ConsentPage' : '/$redirectTo');
      });
    }

    // If the user has left the study it is still logged in and should be redirected to invitation screen

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [CircularProgressIndicator()],
        )));
  }
}