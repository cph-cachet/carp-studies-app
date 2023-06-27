part of carp_study_app;

class DetailsBanner extends StatelessWidget {
  const DetailsBanner(this.title, this.imagePath,
      {super.key, this.isCarpBanner = false});
  final String title;
  final String? imagePath;
  final bool isCarpBanner;

  @override
  Widget build(
    BuildContext context,
  ) {
    RPLocalizations locale = RPLocalizations.of(context)!;
    return SliverAppBar(
      expandedHeight: 150.0,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.only(top: 15),
        background: imagePath != null && imagePath!.isNotEmpty
            ? ClipRRect(
                child: ImageFiltered(
                    imageFilter: ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: bloc.data.studyPageViewModel.getMessageImage(imagePath)),
              )
            : const SizedBox.shrink(),
        title: InkWell(
          onTap: () {
            if (isCarpBanner) {
              context.push('/studyDetails');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Stack(
                  children: [
                    Text(
                      locale.translate(title),
                      style: studyNameStyle.copyWith(
                          // color: Theme.of(context).primaryColor,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      locale.translate(title),
                      style: studyNameStyle.copyWith(
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                isCarpBanner
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.touch_app,
                              color: Theme.of(context).primaryColor, size: 15),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
