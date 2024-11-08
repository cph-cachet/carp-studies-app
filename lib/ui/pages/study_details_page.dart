part of carp_study_app;

class StudyDetailsPage extends StatelessWidget {
  static const String route = '/study_details';
  final StudyPageViewModel model;
  StudyDetailsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;

    String studyDescription() => '${locale.translate(model.description)}\n\n'
        '${locale.translate('widgets.study_card.title')}: "${locale.translate(model.title)}".\n'
        '${locale.translate('widgets.study_card.purpose')}: "${locale.translate(model.purpose)}".\n\n'
        '${locale.translate('widgets.study_card.responsibles')}:\n'
        '${locale.translate(model.piName)}, ${locale.translate(model.piTitle)}\n\n'
        '${locale.translate(model.piAffiliation)}\n'
        '${locale.translate(model.piAddress)}\n'
        '${locale.translate(model.piEmail)}\n';

    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CarpColors>()!.backgroundGray,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                  child: const CarpAppBar(hasProfileIcon: true),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 16),
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(CarpStudyAppState.homeRoute);
                        }
                      },
                    ),
                  ],
                ),
                Flexible(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    children: [
                      DetailsBanner(model.title, './assets/images/kids.png'),
                      _buildSectionCard(
                        context,
                        [
                          _buildActionListTile(
                            context: context,
                            leading: Icon(Icons.mail,
                                color: Theme.of(context).primaryColor),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: CACHET.GREY_6),
                            title: locale.translate('pages.profile.contact'),
                            onTap: () async {
                              _sendEmailToContactResearcher(
                                locale.translate(model.piEmail),
                                'Support for study: ${locale.translate(model.title)} - User: ${model.piName}',
                              );
                            },
                          ),
                          _buildActionListTile(
                            context: context,
                            leading: Icon(Icons.policy,
                                color: Theme.of(context).primaryColor),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: CACHET.GREY_6),
                            title:
                                locale.translate('pages.about.study.privacy'),
                            onTap: () async {
                              try {
                                launchUrl(
                                    Uri.parse(CarpBackend.carpPrivacyUrl));
                              } finally {}
                            },
                          ),
                          _buildActionListTile(
                            context: context,
                            leading: Icon(Icons.public,
                                color: Theme.of(context).primaryColor),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                color: CACHET.GREY_6),
                            title:
                                locale.translate('pages.about.study.website'),
                            onTap: () async {
                              try {
                                launchUrl(
                                    Uri.parse(CarpBackend.carpWebsiteUrl));
                              } finally {}
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale
                                  .translate('widgets.study_card.responsible'),
                              style: studyDetailsInfoTitle.copyWith(
                                  color: Theme.of(context)
                                      .extension<CarpColors>()!
                                      .grey900),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 8),
                              child: Text(
                                locale.translate(model.piName),
                                style: studyDetailsInfoMessage.copyWith(
                                    color: Theme.of(context)
                                        .extension<CarpColors>()!
                                        .grey700),
                              ),
                            ),
                            // 8
                            Text(
                              locale.translate(
                                  'widgets.study_card.participant_role'),
                              style: studyDetailsInfoTitle.copyWith(
                                  color: Theme.of(context)
                                      .extension<CarpColors>()!
                                      .grey900),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 8),
                              child: Text(
                                locale.translate(model.participantRole),
                                style: studyDetailsInfoMessage.copyWith(
                                    color: Theme.of(context)
                                        .extension<CarpColors>()!
                                        .grey700),
                              ),
                            ),
                            Text(
                              locale
                                  .translate('widgets.study_card.device_role'),
                              style: studyDetailsInfoTitle.copyWith(
                                  color: Theme.of(context)
                                      .extension<CarpColors>()!
                                      .grey900),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 8),
                              child: Text(
                                locale.translate(model.deviceRole),
                                style: studyDetailsInfoMessage.copyWith(
                                    color: Theme.of(context)
                                        .extension<CarpColors>()!
                                        .grey700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color:
                            Theme.of(context).extension<CarpColors>()!.grey300,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.translate(
                                  'widgets.study_card.study_description'),
                              style: studyDetailsInfoTitle.copyWith(
                                  color: Theme.of(context)
                                      .extension<CarpColors>()!
                                      .grey900),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 8),
                              child: Text(
                                locale.translate(model.description),
                                style: studyDetailsInfoMessage.copyWith(
                                    color: Theme.of(context)
                                        .extension<CarpColors>()!
                                        .grey700),
                              ),
                            ),
                            Text(
                              locale.translate(
                                  'widgets.study_card.study_purpose'),
                              style: studyDetailsInfoTitle.copyWith(
                                  color: Theme.of(context)
                                      .extension<CarpColors>()!
                                      .grey900),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, bottom: 8),
                              child: Text(
                                locale.translate(model.purpose),
                                style: studyDetailsInfoMessage.copyWith(
                                    color: Theme.of(context)
                                        .extension<CarpColors>()!
                                        .grey700),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(16),
                      //   child: Column(
                      //     children: [
                      //       Text(locale.translate(model.piAffiliation),
                      //           style: aboutCardSubtitleStyle.copyWith(
                      //               color: Theme.of(context).primaryColor)),
                      //       Text(
                      //         studyDescription(),
                      //         style: aboutCardContentStyle,
                      //         textAlign: TextAlign.justify,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // BIIIIG
                //
                //
                // COMMENT
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 30, top: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       InkWell(
                //         onTap: () async {
                //           String url = locale.translate(model.privacyPolicyUrl);
                //           try {
                //             await launchUrl(Uri.parse(url));
                //           } catch (error) {
                //             warning(
                //                 "Could not launch privacy policy URL - '$url'");
                //           }
                //         },
                //         child: Row(
                //           children: [
                //             Icon(Icons.policy_outlined,
                //                 color: Theme.of(context).primaryColor),
                //             Text(locale.translate('pages.about.study.privacy'),
                //                 style: aboutCardSubtitleStyle.copyWith(
                //                     color: Theme.of(context).primaryColor))
                //           ],
                //         ),
                //       ),
                //       const SizedBox(width: 15),
                //       InkWell(
                //         onTap: () async {
                //           String url =
                //               locale.translate(model.studyDescriptionUrl);
                //           try {
                //             await launchUrl(Uri.parse(url));
                //           } catch (error) {
                //             warning(
                //                 "Could not launch study description URL - '$url'");
                //           }
                //         },
                //         child: Row(
                //           children: [
                //             Icon(Icons.public_outlined,
                //                 color: Theme.of(context).primaryColor),
                //             Text(locale.translate('pages.about.study.website'),
                //                 style: aboutCardSubtitleStyle.copyWith(
                //                     color: Theme.of(context).primaryColor)),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            tiles: children,
            color: Theme.of(context).extension<CarpColors>()!.grey300,
          ).toList(),
        ),
      ),
    );
  }

// Helper method to build a ListTile for actions with an icon
  Widget _buildActionListTile({
    required BuildContext context,
    required Icon leading,
    required String title,
    Icon? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: leading,
      title: Text(title,
          style: profileActionStyle.copyWith(
              color: Theme.of(context).extension<CarpColors>()!.grey900)),
      trailing: trailing,
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    );
  }

  // Sends and email to the researcher with the name of the study + user id
  void _sendEmailToContactResearcher(String email, String subject) async {
    final url = Uri(
            scheme: 'mailto',
            path: email,
            queryParameters: {'subject': subject})
        .toString()
        .replaceAll("+", "%20");
    try {
      await launchUrl(Uri.parse(url));
    } finally {}
  }
}
