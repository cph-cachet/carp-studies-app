part of carp_study_app;

class MeasuresCardWidget extends StatefulWidget {
  final MeasuresCardDataModel model;
  MeasuresCardWidget(this.model);
  _MeasuresCardWidgetState createState() => _MeasuresCardWidgetState();
}

class _MeasuresCardWidgetState extends State<MeasuresCardWidget> {
  int hexOfRGBA(int r, int g, int b, {double opacity = 1}) {
    r = (r < 0) ? -r : r;
    g = (g < 0) ? -g : g;
    b = (b < 0) ? -b : b;
    opacity = (opacity < 0) ? -opacity : opacity;
    opacity = (opacity > 1) ? 255 : opacity * 255;
    r = (r > 255) ? 255 : r;
    g = (g > 255) ? 255 : g;
    b = (b > 255) ? 255 : b;
    int a = opacity.toInt();
    return int.parse(
        '#${a.toRadixString(16)}${r.toRadixString(16)}${g.toRadixString(16)}${b.toRadixString(16)}');
  }

  static List<charts.Series<Measures, String>> _createChartList(
    BuildContext context,
    MeasuresCardDataModel model,
  ) =>
      [
        charts.Series<Measures, String>(
          colorFn:
              (_, index) => //charts.Color.(hexOfRGBA(CACHET.COLOR_LIST[index].red,CACHET.COLOR_LIST[index].green,CACHET.COLOR_LIST[index].blue, CACHET.COLOR_LIST[index].opacity)),
                  charts.MaterialPalette.blue.makeShades(min(7, model.samplingTable.length))[index],
          id: 'TotalMeasures',
          data: model.measures.sublist(0, min(7, model.samplingTable.length)),
          domainFn: (Measures datum, _) => datum.measure,
          measureFn: (Measures datum, _) => datum.size,
        )
      ];

  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);

    // Get the measures with more events to prioritize which ones to show
    widget.model.orderedMeasures();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: widget.model.measureEvents,
                builder: (context, AsyncSnapshot<Datum> snapshot) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('${locale.translate('Hello')} ${bloc.user.firstName}',
                                      style: aboutCardTitleStyle),
                                  Text(
                                      locale.translate(
                                          'Thank you for participating in this study. This a summary of your contribution to the study.'),
                                      style: aboutCardSubtitleStyle),
                                  SizedBox(height: 10),
                                  Text('${widget.model.samplingSize} ' + locale.translate('MEASURES'),
                                      //textAlign: TextAlign.center,
                                      style: dataCardTitleStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            charts.PieChart(
                              _createChartList(context, widget.model),
                              animate: true,
                              behaviors: [
                                charts.DatumLegend(
                                  position: charts.BehaviorPosition.end,
                                  desiredMaxRows: 7,
                                  //entryTextStyle: charts.TextStyleSpec(fontSize: 10),
                                  cellPadding: EdgeInsets.only(right: 3.0, bottom: 2.0),
                                  showMeasures: true,
                                  legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                                  measureFormatter: (num value) {
                                    return value == null ? '-' : '$value';
                                  },
                                ),
                              ],
                              defaultRenderer: charts.ArcRendererConfig(
                                arcWidth: 20,
                              ),
                            ),
                            /* Positioned(
                              left: 92,
                              child: Text(
                                '${widget.model.samplingSize} \nmeasures',
                                textAlign: TextAlign.center,
                                style: measuresStyle.copyWith(color: Theme.of(context).primaryColor),
                              ),
                            ), */
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
