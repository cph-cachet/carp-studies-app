part of carp_study_app;

class StudyCard extends StatelessWidget {
  final StudyPageModel studyPageModel = StudyPageModel();

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;

    String studyDescription() => '${locale.translate(studyPageModel.description)}\n\n'
        '${locale.translate('widgets.study_card.title')}: \"${locale.translate(studyPageModel.title)}\".\n'
        '${locale.translate('widgets.study_card.purpose')}: \"${locale.translate(studyPageModel.purpose)}\".\n\n'
        '${locale.translate('widgets.study_card.responsibles')}:\n'
        '${locale.translate(studyPageModel.piName)}, ${locale.translate(studyPageModel.piTitle)}\n\n'
        '${locale.translate(studyPageModel.piAffiliation)}\n'
        '${locale.translate(studyPageModel.piAddress)}\n'
        '${locale.translate(studyPageModel.piEmail)}\n';

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row(children: [
          //   Expanded(
          //       child: Container(
          //     height: MediaQuery.of(context).size.height * 0.1,
          //     color: Color(0xFFF1F9FF),
          //     child: Image.asset('assets/images/books.png', fit: BoxFit.fitHeight),
          //   ))
          // ]),
          ExpansionTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 40),
                SizedBox(width: 40),
                Text(locale.translate(studyPageModel.title),
                    style: aboutCardTitleStyle.copyWith(color: Theme.of(context).primaryColor)),
                SizedBox(width: 40),
                SizedBox(width: 40),
              ],
            ),
            subtitle: Text("Tap to learn more", style: aboutCardInfoStyle),
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Text(locale.translate(studyPageModel.piAffiliation),
                            style: aboutCardSubtitleStyle.copyWith(color: Theme.of(context).primaryColor)),
                        Text(
                          studyDescription(),
                          style: aboutCardContentStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () async {
                    if (await canLaunch(locale.translate(studyPageModel.studyDescriptionUrl))) {
                      await launch(locale.translate(studyPageModel.studyDescriptionUrl));
                    } else {
                      throw 'Could not launch project URL';
                    }
                  },
                  child: Text(locale.translate('pages.about.study.website'),
                      style: aboutCardInfoStyle.copyWith(decoration: TextDecoration.underline),
                      textAlign: TextAlign.start)),
              InkWell(
                onTap: () async {
                  if (await canLaunch(locale.translate(studyPageModel.privacyPolicyUrl))) {
                    await launch(locale.translate(studyPageModel.privacyPolicyUrl));
                  } else {
                    throw 'Could not launch privacy policy URL';
                  }
                },
                child: Text(locale.translate('pages.about.study.privacy'),
                    style: aboutCardInfoStyle.copyWith(decoration: TextDecoration.underline),
                    textAlign: TextAlign.start),
              ),
            ],
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(5),
    );
  }
}
