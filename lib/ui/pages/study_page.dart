part of carp_study_app;

class StudyPage extends StatefulWidget {
  final StudyPageViewModel model;
  const StudyPage(this.model, {super.key});

  @override
  StudyPageState createState() => StudyPageState();
}

class StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    final Message studyDescription = Message(
      id: '00000000-0000-0000-0000-000000000000',
      title: widget.model.title,
      message: widget.model.description,
      type: MessageType.announcement,
      timestamp: DateTime.now(),
      image: 'assets/images/kids.png',
    );

    // reverse the ordering of the messages
    widget.model.messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CarpAppBar(),
            Flexible(
              child: StreamBuilder<int>(
                  stream: widget.model.messageStream,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        await bloc.refreshMessages();
                      },
                      child: ListView.builder(
                        itemCount: bloc.messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return _aboutStudyCard(
                              context,
                              studyDescription,
                              onTap: () {
                                context.push('/studyDetails');
                              },
                            );
                          }

                          return _aboutStudyCard(
                              context, widget.model.messages[index - 1]);
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _aboutStudyCard(BuildContext context, Message message,
      {Function? onTap}) {
    RPLocalizations locale = RPLocalizations.of(context)!;

    // Initialization the language of the tiemago package
    timeago.setLocaleMessages('da', timeago.DaMessages());
    timeago.setLocaleMessages('es', timeago.EsMessages());

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          } else {
            context.push('/message/${message.id}');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (message.image != null && message.image != '')
                Center(
                  child: Container(
                    height: 150.0,
                    color: Theme.of(context)
                        .colorScheme
                        .secondary, //Color(0xFFF1F9FF),
                    child: widget.model.getMessageImage(message.image),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(locale.translate(message.title!),
                    style: aboutCardTitleStyle.copyWith(
                        color: Theme.of(context).primaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    '${locale.translate(message.type.toString().split('.').last.toLowerCase())} - ${timeago.format(
                      DateTime.now().copyWithAdditional(
                          years: -DateTime.now().year + message.timestamp.year,
                          months:
                              -DateTime.now().month + message.timestamp.month,
                          days: -DateTime.now().day + message.timestamp.day,
                          hours: -DateTime.now().hour + message.timestamp.hour,
                          minutes: -DateTime.now().minute +
                              message.timestamp.minute),
                      locale: Localizations.localeOf(context).languageCode,
                    )}',
                    style: aboutCardSubtitleStyle.copyWith(
                        color: Theme.of(context).primaryColor)),
              ),
              if (message.subTitle != null && message.subTitle!.isNotEmpty)
                Row(children: [
                  Expanded(
                      child: Text(locale.translate(message.subTitle!),
                          style: aboutCardContentStyle.copyWith(
                              color: Theme.of(context).primaryColor))),
                ]),
              if (message.message != null &&
                  message.message != null &&
                  message.message!.isNotEmpty)
                Row(children: [
                  Expanded(
                      child: Text(
                    "${locale.translate(message.message!).substring(0, (message.message!.length > 150) ? 150 : null)}...",
                    style: aboutCardContentStyle,
                    textAlign: TextAlign.justify,
                  )),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}

extension CopyWithAdditional on DateTime {
  DateTime copyWithAdditional({
    int years = 0,
    int months = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) {
    return DateTime(
      year + years,
      month + months,
      day + days,
      hour + hours,
      minute + minutes,
      second + seconds,
      millisecond + milliseconds,
      microsecond + microseconds,
    );
  }
}
