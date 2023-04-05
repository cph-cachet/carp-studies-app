part of carp_study_app;

class InvitationListPage extends StatelessWidget {
  final InvitationsListViewModel model;

  const InvitationListPage(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24.0),
          child: FutureBuilder<List<ActiveParticipationInvitation>>(
              future: model.invitations,
              builder: (context, snapshot) {
                Widget child;

                child = snapshot.hasData
                    ? child = SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 16.0),
                              child: InvitationCard(
                                invitation: snapshot.data![index],
                              ),
                            );
                          },
                          childCount: snapshot.data!.length,
                        ),
                      )
                    : const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                return CustomScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        locale.translate('invitation.invitations'),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    child,
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class InvitationCard extends StatelessWidget {
  final ActiveParticipationInvitation invitation;

  const InvitationCard({
    super.key,
    required this.invitation,
  });

  @override
  Widget build(BuildContext context) => Card(
        child: InkWell(
          onTap: () {
            context.push('/invitation/${invitation.participation.participantId}');
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  invitation.invitation.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  (invitation.invitation.description ?? ''),
                  style: const TextStyle(fontSize: 16.0),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      );
}
