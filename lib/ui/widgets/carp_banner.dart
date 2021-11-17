part of carp_study_app;

class CarpBanner extends StatelessWidget {
  final StudyPageModel studyPageModel = StudyPageModel();

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;
    return SliverAppBar(
      expandedHeight: 150.0,
      backgroundColor: Theme.of(context).accentColor,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(top: 15),
        title: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => StudyExpandedPage()));
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              locale.translate(studyPageModel.title),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        background: Container(
            height: 150.0,
            color: Theme.of(context).accentColor,
            child: Image.asset(
              './assets/images/kids.png',
              fit: BoxFit.fitHeight,
            )),
      ),
    );
  }
}
