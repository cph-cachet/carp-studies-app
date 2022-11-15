part of carp_study_app;

class ChartsLegend extends StatelessWidget {
  final Icon? iconAssetName;
  final String? title;
  final List<String>? values;
  final String? heroTag;
  final String? routeName;
  final List<Color>? colors;

  const ChartsLegend({this.heroTag, this.iconAssetName, this.title, this.values, this.routeName, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          /* Expanded(
            flex: 1,
            child: Padding(padding: const EdgeInsets.only(right: 8.0), child: iconAssetName),
          ), */
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title!.toUpperCase(), style: dataCardTitleStyle),
                const SizedBox(height: 10),
                Row(
                  children: values!
                      .asMap()
                      .entries
                      .map(
                        (entry) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.circle, color: colors![entry.key], size: 12.0),
                            Text(' ${entry.value} ', style: legendStyle),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
