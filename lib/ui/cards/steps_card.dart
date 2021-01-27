part of carp_study_app;

class StepsCardWidget extends StatefulWidget {
  final StepsCardDataModel model;
  StepsCardWidget(this.model);

  _StepsCardWidgetState createState() => _StepsCardWidgetState();
}

class _StepsCardWidgetState extends State<StepsCardWidget> {
  final List<Color> colors = [Color.fromRGBO(12, 70, 128, 1)];

  List<charts.Series<Steps, String>> _createChartList(BuildContext context, StepsCardDataModel model) {
    List<Steps> _steps = model._weeklySteps.entries.map((entry) => Steps(entry.key, entry.value)).toList();
    return [
      charts.Series<Steps, String>(
        colorFn: (d, i) => charts.ColorUtil.fromDartColor(colors[0]),
        id: 'DailyStepsList',
        data: _steps,
        domainFn: (Steps datum, _) => datum.toString(),
        measureFn: (Steps datum, _) => datum.steps,
      )
    ];
  }

  // Render settings of the axis
  charts.RenderSpec<num> renderSpecNum = AxisTheme.axisThemeNum();
  charts.RenderSpec<String> renderSpecString = AxisTheme.axisThemeOrdinal();

  final _myState = new charts.UserManagedState<String>();
  int _selectedSteps = 0;

  @override
  void initState() {
    // Get current day steps
    _selectedSteps = widget.model._weeklySteps[DateTime.now().weekday];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: widget.model._controller.events,
                builder: (context, AsyncSnapshot<Datum> snapshot) {
                  return Column(
                    children: [
                      CardHeader(
                        title: 'Steps',
                        iconAssetName: Icon(Icons.directions_walk, color: Theme.of(context).primaryColor),
                        heroTag: 'steps-card',
                        values: ['$_selectedSteps steps'],
                        colors: colors,
                      ),
                      Container(
                        height: 160,
                        child: charts.BarChart(
                          _createChartList(context, widget.model),
                          animate: true,
                          defaultRenderer: charts.BarRendererConfig<String>(
                            cornerStrategy: const charts.ConstCornerStrategy(2),
                          ),
                          domainAxis: charts.OrdinalAxisSpec(
                            renderSpec: renderSpecString,
                          ),
                          primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: renderSpecNum),
                          //userManagedState: _myState,
                          defaultInteractions: false,
                          selectionModels: [
                            charts.SelectionModelConfig(
                                type: charts.SelectionModelType.info,
                                /* updatedListener: (charts.SelectionModel model) {
                                  _myState.selectionModels[charts.SelectionModelType.info] =
                                      charts.UserManagedSelectionModel(model: model);
                                }, */
                                changedListener: _infoSelectionModelChanged)
                          ],
                          behaviors: [
                            charts.SelectNearest(),
                            charts.DomainHighlighter(charts.SelectionModelType.action)
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

  void _infoSelectionModelChanged(charts.SelectionModel model) {
    if (model.hasDatumSelection)
      setState(() {
        _selectedSteps = model.selectedSeries[0].measureFn(model.selectedDatum[0].index);
      });
    else
      setState(() {
        _selectedSteps = widget.model._lastStep.stepCount;
      });
  }
}
