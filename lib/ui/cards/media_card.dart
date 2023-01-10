part of carp_study_app;

class MediaCardWidget extends StatefulWidget {
  final List<TaskCardViewModel> modelsList;
  final List<Color> colors;
  const MediaCardWidget(this.modelsList,
      {super.key, this.colors = CACHET.COLOR_LIST});
  @override
  MediaCardWidgetState createState() => MediaCardWidgetState();
}

class MediaCardWidgetState extends State<MediaCardWidget> {
  // static List<charts.Series<TaskCount, String>> _createChartList(
  //         BuildContext context, TaskCardDataModel model, List<Color> colors) =>
  //     [
  //       charts.Series<TaskCount, String>(
  //         colorFn: (_, index) => charts.ColorUtil.fromDartColor(colors[index!]),
  //         // charts.MaterialPalette.blue.makeShades(min(7, model.samplingTable.length))[index],
  //         id: 'TotalTasks',
  //         data: model.taskCount.sublist(0, min(7, model.tasksTable.length)),
  //         domainFn: (TaskCount taskCount, _) => taskCount.title,
  //         measureFn: (TaskCount taskCount, _) => taskCount.size,
  //       )
  //     ];

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;
    var total = 0;
    for (var element in widget.modelsList) {
      total += element.tasksDone;
    }

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
                            Text('$total MEDIA', style: dataCardTitleStyle),
                            Column(
                                children: widget.modelsList
                                    .asMap()
                                    .entries
                                    .map((entry) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 15),
                                            Text(
                                              '${entry.value.tasksDone} ${locale.translate('cards.${entry.value.taskType}.title')}',
                                              style: dataCardTitleStyle
                                                  .copyWith(fontSize: 14),
                                            ),
                                            HorizontalBar(
                                                names: entry.value.taskCount
                                                    .map((task) => locale
                                                        .translate(task.title))
                                                    .toList(),
                                                values: entry.value.taskCount
                                                    .map((task) => task.size)
                                                    .toList(),
                                                colors: CACHET.COLOR_LIST,
                                                height: 18),
                                          ],
                                        ))
                                    .toList()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
