part of carp_study_app;

class HeartRateCardWidget extends StatefulWidget {
  final HeartRateCardViewModel model;
  static const colors = [
    Color.fromARGB(255, 243, 54, 32),
    Color.fromARGB(255, 179, 179, 181),
    Color.fromARGB(70, 0, 0, 0),
  ];

  HeartRateCardWidget(
    this.model,
  );

  factory HeartRateCardWidget.withSampleData(HeartRateCardViewModel model) =>
      HeartRateCardWidget(model);

  @override
  _HeartRateCardWidgetState createState() => _HeartRateCardWidgetState();
}

class _HeartRateCardWidgetState extends State<HeartRateCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds:
              1000 ~/ (((widget.model.currentHeartRate ?? 0) + 1) / 60)),
      lowerBound: 0.7,
      upperBound: 1.0,
    )..repeat(
        reverse: true,
      );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;

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
                stream: widget.model.heartRateEvents,
                builder: (context, AsyncSnapshot<DataPoint> snapshot) {
                  return Column(
                    children: [
                      ChartsLegend(
                          title: locale.translate('cards.heartrate.title'),
                          iconAssetName: Icon(Icons.monitor_heart,
                              color: Theme.of(context).primaryColor),
                          heroTag: 'HeartRate-card',
                          values: [],
                          colors: HeartRateCardWidget.colors),
                      getDailyRange,
                      Container(
                        height: 240,
                        child: barCharts,
                      ),
                      Container(
                        height: 80,
                        child: currentHeartRateWidget,
                      )
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

  Row get getDailyRange {
    RPLocalizations locale = RPLocalizations.of(context)!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, right: 2),
          child: Text(
            '${(widget.model.dayMinMax.min ?? 0).toInt()} - ${(widget.model.dayMinMax.max ?? 0).toInt()}',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            locale.translate('cards.heartrate.bpm'),
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w600,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }

  Widget get currentHeartRateWidget {
    RPLocalizations locale = RPLocalizations.of(context)!;

    var currentHeartRate = widget.model.currentHeartRate;

    var heartRateTextStyle = TextStyle(
      fontSize: 80,
      fontFamily: 'Barlow',
      fontWeight: FontWeight.w600,
      fontFamilyFallback: ['Roboto'],
      fontFeatures: [
        ui.FontFeature.tabularFigures(),
      ],
    );

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                child: currentHeartRate != null ||
                        (!widget.model.contactStatus &&
                            currentHeartRate != null)
                    ? Text(
                        currentHeartRate.toStringAsFixed(0),
                        style: heartRateTextStyle,
                      )
                    : Text('-', style: heartRateTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RepaintBoundary(
                      child: ScaleTransition(
                        // scale should be _animation if the isOnWrist is true otherwise it should be no scale
                        scale: !widget.model.contactStatus
                            ? Tween<double>(begin: 1, end: 1)
                                .animate(animationController)
                            : animation,
                        child: Icon(
                          !widget.model.contactStatus
                              ? Icons.favorite_outline_rounded
                              : Icons.favorite_rounded,
                          color: HeartRateCardWidget.colors[0],
                          size: 32,
                        ),
                      ),
                    ),
                    Text(
                      locale.translate('cards.heartrate.bpm'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Barlow',
                        color: HeartRateCardWidget.colors[0],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BarChart get barCharts {
    RPLocalizations locale = RPLocalizations.of(context)!;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Theme.of(context).primaryColorLight,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '',
                textAlign: TextAlign.start,
                children: [
                  TextSpan(
                    text:
                        locale.translate('cards.heartrate.range').toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "\n${rod.fromY.toInt()} - ${rod.toY.toInt()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: "${locale.translate('cards.heartrate.bpm')}\n",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.6),
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: "$groupIndex-${groupIndex + 1} ",
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
                const TextStyle(
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              getTitlesWidget: bottomTitles,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: rightTitles,
              //interval should be infinity, so that only the min and max shows
              interval: 100,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.grey.withOpacity(0.2),
                  strokeWidth: 1,
                ),
            checkToShowHorizontalLine: (value) => value % 100 == 0,
            getDrawingVerticalLine: (value) => FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
                dashArray: [3, 2]),
            verticalInterval: 1 / 24,
            checkToShowVerticalLine: (value) {
              if (value == 1 / 4) return true;
              if (value == 12 / 24) return true;
              if (value == 18 / 24) return true;
              if (value == 24 / 24) return true;
              return false;
            }),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        groupsSpace: 4,
        barGroups: getHeartRateBars(),
        minY: 0,
        maxY: 200,
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    var style = TextStyle(
      color: Colors.grey.withOpacity(0.6),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    String text;
    if (value == 0) {
      text = '00';
    } else if (value == 6) {
      text = '06';
    } else if (value == 12) {
      text = '12';
    } else if (value == 18) {
      text = '18';
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: AxisSide.right,
      space: 0,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget rightTitles(double value, TitleMeta meta) {
    final text = value.toInt().toString();
    var style = TextStyle(
      color: Colors.grey.withOpacity(0.6),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    return SideTitleWidget(
      axisSide: AxisSide.right,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  List<BarChartGroupData> getHeartRateBars() =>
      widget.model.hourlyHeartRate.entries
          .map((value) => BarChartGroupData(
                x: value.key,
                barRods: [
                  BarChartRodData(
                    fromY: value.value.min,
                    toY: value.value.max ?? 0,
                    color: HeartRateCardWidget.colors[0],
                    width: 6,
                  ),
                ],
              ))
          .toList();

  BarChartGroupData getSeparaterStick(xAxis, height) =>
      BarChartGroupData(x: xAxis, barsSpace: 0, barRods: [
        BarChartRodData(
          toY: height,
          fromY: 0,
          width: 1,
          color: HeartRateCardWidget.colors[2],
        )
      ]);
}

class HeartRateOuterStatefulWidget extends StatefulWidget {
  final HeartRateCardViewModel model;
  HeartRateOuterStatefulWidget(this.model);

  @override
  _HeartRateOuterStatefulWidgetState createState() =>
      _HeartRateOuterStatefulWidgetState();
}

class _HeartRateOuterStatefulWidgetState
    extends State<HeartRateOuterStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return HeartRateCardWidget.withSampleData(widget.model);
  }
}
