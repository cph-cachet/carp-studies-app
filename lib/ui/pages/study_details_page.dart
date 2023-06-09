part of carp_study_app;

class StudyDetailsPage extends StatelessWidget {
  final StudyPageViewModel studyPageModel = StudyPageViewModel();

  StudyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;

    String studyDescription() =>
        '${locale.translate(studyPageModel.description)}\n\n'
        '${locale.translate('widgets.study_card.title')}: "${locale.translate(studyPageModel.title)}".\n'
        '${locale.translate('widgets.study_card.purpose')}: "${locale.translate(studyPageModel.purpose)}".\n\n'
        '${locale.translate('widgets.study_card.responsibles')}:\n'
        '${locale.translate(studyPageModel.piName)}, ${locale.translate(studyPageModel.piTitle)}\n\n'
        '${locale.translate(studyPageModel.piAffiliation)}\n'
        '${locale.translate(studyPageModel.piAddress)}\n'
        '${locale.translate(studyPageModel.piEmail)}\n';

    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height * 0.3,
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.replace('/tasks'),
                    icon: const Icon(Icons.close))
              ]),
              Flexible(
                child: CustomScrollView(
                  slivers: [
                    //CarpBanner(),
                    DetailsBanner(
                        studyPageModel.title, './assets/images/kids.png'),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Text(locale.translate(studyPageModel.piAffiliation),
                                style: aboutCardSubtitleStyle.copyWith(
                                    color: Theme.of(context).primaryColor)),
                            const SizedBox(height: 5),
                            Text(
                              studyDescription(),
                              style: aboutCardContentStyle,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        String url =
                            locale.translate(studyPageModel.privacyPolicyUrl);
                        try {
                          await launchUrl(Uri.parse(url));
                        } catch (error) {
                          warning(
                              "Could not launch privacy policy URL - '$url'");
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.policy_outlined,
                              color: Theme.of(context).primaryColor),
                          Text(locale.translate('pages.about.study.privacy'),
                              style: aboutCardSubtitleStyle.copyWith(
                                  color: Theme.of(context).primaryColor))
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () async {
                        String url = locale
                            .translate(studyPageModel.studyDescriptionUrl);
                        try {
                          await launchUrl(Uri.parse(url));
                        } catch (error) {
                          warning(
                              "Could not launch study description URL - '$url'");
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.public_outlined,
                              color: Theme.of(context).primaryColor),
                          Text(locale.translate('pages.about.study.website'),
                              style: aboutCardSubtitleStyle.copyWith(
                                  color: Theme.of(context).primaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
