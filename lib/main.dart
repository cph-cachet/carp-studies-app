library carp_study_app;

import 'dart:async';
import 'dart:math';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart' hide TimeOfDay;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:expandable/expandable.dart';
import 'package:intl/intl.dart';
import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:collection/collection.dart' show IterableExtension;

import 'package:carp_mobile_sensing/carp_mobile_sensing.dart';
import 'package:carp_audio_package/audio.dart';
//import 'package:carp_health_package/health_package.dart';
//import 'package:carp_connectivity_package/connectivity.dart';
//import 'package:carp_communication_package/communication.dart';
import 'package:carp_context_package/context.dart';
import 'package:carp_survey_package/survey.dart';

import 'package:carp_webservices/carp_services/carp_services.dart';
import 'package:carp_webservices/carp_auth/carp_auth.dart';
import 'package:carp_backend/carp_backend.dart';
import 'package:carp_core/carp_common/carp_core_common.dart';
import 'package:carp_core/carp_protocols/carp_core_protocols.dart';
import 'package:carp_core/carp_deployment/carp_core_deployment.dart';
import 'package:carp_core/carp_data/carp_core_data.dart';

import 'package:research_package/research_package.dart';

part 'blocs/app_bloc.dart';
part 'blocs/common.dart';

part 'data/carp_backend.dart';
part 'data/message_manager.dart';
part 'data/localization_loader.dart';

part 'sensing/local_surveys.dart';
part 'sensing/local_study_protocol_manager.dart';
part 'sensing/sensing.dart';

part 'models/data_model.dart';
part 'models/tasklist_page_model.dart';
part 'models/study_page_model.dart';
part 'models/profile_page_model.dart';
part 'models/data_viz_page_model.dart';
part 'models/cards/activity_data_model.dart';
part 'models/cards/mobility_data_model.dart';
part 'models/cards/steps_data_model.dart';
part 'models/cards/measures_data_model.dart';
part 'models/cards/task_data_model.dart';
part 'models/cards/study_progress_data_model.dart';

part 'models/audio_user_task.dart';
part 'data/local_resource_manager.dart';

part 'carp_study_app.dart';
part 'app_home.dart';
part 'ui/pages/informed_consent_page.dart';
part 'ui/pages/home_page.dart';

part 'ui/widgets/carp_app_bar.dart';
part 'ui/carp_study_style.dart';
part 'ui/colors.dart';
part 'ui/pages/data_viz_page.dart';
part 'ui/pages/study_page.dart';
part 'ui/pages/task_list_page.dart';
part 'ui/pages/contact_page.dart';
part 'ui/pages/profile_page.dart';
part 'ui/pages/audio_task_page.dart';
part 'ui/pages/timer_task_page.dart';
part 'ui/pages/question.dart';
part 'ui/pages/failed_login_page.dart';

part 'ui/widgets/study_banner.dart';
part 'ui/widgets/card_header.dart';
part 'ui/widgets/study_card.dart';
part 'ui/widgets/horizontal_bar.dart';

part 'ui/cards/steps_card.dart';
part 'ui/cards/activity_card.dart';
part 'ui/cards/mobility_card.dart';
part 'ui/cards/measures_card.dart';
part 'ui/cards/task_card.dart';
part 'ui/cards/scoreboard_card.dart';
part 'ui/cards/study_progress_card.dart';

late CarpStudyApp app;
void main() async {
  app = CarpStudyApp();
  runApp(app);
}

/// The singleton BLoC.
///
/// Configure the debug level and deployment mode here before running the app
/// or deploying it.
final bloc = StudyAppBLoC(
  debugLevel: DebugLevel.DEBUG,
  deploymentMode: DeploymentMode.LOCAL,
  forceSignOutAndStudyReload: true,
);
