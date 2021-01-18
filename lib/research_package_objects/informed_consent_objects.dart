import 'package:research_package/model.dart';

RPConsentSection overviewSection = RPConsentSection.withParams(
    RPConsentSectionType.Custom)
  ..title = "DiaFocus"
  ..summary =
      "To understand how the DiaFocus system can be used to collect diabetes-related information, we will ask you to use it for up to two months and complete simple surveys. We will investigate the usefulness of the system and the data collected."
  ..content =
      "You are being asked to take part in a research test. Before you decide to participate in this test, it is important that you understand why the research is being done and what it will involve. Please read the following information carefully. Please ask if there is anything that is not clear or if you need more information.\n\nThe purpose of this test is to investigate the technical and clinical feasibility of the DiaFocus system for diabetes monitoring. This means that we want to understand the usefulness and usability of using wearable and mobile technology for collection of diabetes-related data.\n\nYou will be asked to use the DiaFocus smartphone app for up to two months. During this period, the system will collect different kinds of data related to your glucose levels, your movement, mood and emotions, sleep, and ask you to enter details on events you might experience. You will also be asked to fill in different questionnaires.\n\n\nThe title of the test is: \"Feasibility Test of the DiaFocus System\"\n\nThe Principle Investigator (PI) is:\n\n•Jakob E. Bardram, professor, MSc., PhD\n\n•Department of Health Technology\n\n•Technical University of Denmark\n\n•Richard Pedersens Plads, DK-2800 Lyngby\n\n•email:\tjakba@dtu.dk\n\n\nYou can contact the project manager if you have any questions.";

RPConsentSection dataGatheringSection = RPConsentSection.withParams(
    RPConsentSectionType.DataGathering)
  ..summary =
      "To get a full picture of your diabetes health, we will collect data on blood glucose, which diabetes-related challenges you want to address, and information about you behavior (such as movement and sleep patterns)."
  ..content =
      "The DiaFocus system collects and stores the following type of personal data:\n\n•Personal information:\tthis includes your full name, email address, and phone number.\n\n•Demographic information:\tthis includes your age, health status (like smok-ing and drinking habits), gender, height, weight.\n\n•Diabetes information:\tthis includes blood glucose levels.\n\n•Behavioral information:\tthis includes activity, location and weather information.\n\n•Survey:\thealth-related surveys on your life style, emotional distress, well-being, food habits, sleep patterns, depression and anxiety, and medication habits.";

RPConsentSection dataUseSection = RPConsentSection.withParams(
    RPConsentSectionType.DataUse)
  ..summary =
      "Data will be used for scientific purposes only. Data will be shared with medical researchers at the Steno Diabetes Center Copenhagen (SDCC) and published in an anonymized format."
  ..content =
      "The test is hosted at the Copenhagen Center for Health Technology (CACHET), which involves researchers from DTU as well as from the Steno Diabetes Center Copenhagen (SDCC) in the Capital Region of Denmark (Danish: Region Hoved-staden). Data collected from this test will be analyzed and shared by researchers at DTU and medical researchers in SDCC.\n\nResults from this test will be published in an anonymized format in scientific journals and other scientific places, and may be presented at scientific conferences. This dissemination of the research results will be completely anonymous and will NOT contain any person-identifiable information. We strive for open-access publication, which means that access to the research results is available for all for free.";

RPConsentSection privacySection = RPConsentSection.withParams(
    RPConsentSectionType.Privacy)
  ..summary =
      "The Technical University of Denmark (DTU) is the data responsible of this test and all data will be collected and stored on secure servers, protecting your privacy"
  ..content =
      "The Technical University of Denmark (DTU) is the data responsible of this test. Data is collected and stored on secure servers operated by DTU.\n\nThe Data Protection Officer (DPO) at DTU is:\n\n•name:\tAne Sandager\n\n•email:\tanesa@dtu.dk\n\n•telephone:\t+45 9351 1439\n\nYou can contact the DPO for any questions you may have regarding the data processing of this test.\nYou can get a digital copy of the data being collected by you in this test by contacting the principle investigator.";

RPConsentSection studyTaskAndTimeCommitmentSection = RPConsentSection.withParams(
    RPConsentSectionType.Custom)
  ..title = "Test Tasks and Time Commitment"
  ..summary =
      "To get a good picture of your diabetes health we will ask you to use the DiaFocus system on a daily basis for two months"
  ..content =
      "This test consists of three main activities.\n\nFirst, you will join for a start up meeting. Here you will be introduced to the system, the test, and then spend some time on becoming familiar with the DiaFocus smartphone app. The start up meeting will last approx. two hours and will take place at either Steno Diabetes Center Copenhagen (SDCC) or Center for Diabetes (CFD).\n\nSecond, you should use the DiaFocus system on a daily basis for one two months. Daily use means that you should use the blood glucose monitor. Daily, you should fill other kind of data, such as how many cigarettes you smoke, etc. On a weekly basis, you will be asked to fill in questionnaires on the phone. The daily time commitment to these tasks about 10-15 minutes.\n\nThird, you should complete a digital questionnaire during a closing meeting. Then there will be a small interview asking for you experience from using the DiaFocus smartphone app. This closing meeting will take approx. two hours and will take place at either SDCC or CFD.";

RPConsentSection clinicalInformationSection = RPConsentSection.withParams(
    RPConsentSectionType.Custom)
  ..title = "Clinical Information"
  ..summary =
      "This is NOT a clinical test and you will NOT receive any clinical feedback on the recordings done as part of this test. If you in any way feel uncomfortable or ill during the test, you should contact your regular healthcare professional"
  ..content =
      "This test is NOT a clinical test. The purpose of this test is to investigate the technical feasibility of the DiaFocus system, including its usefulness for continuous monitoring and its usability in everyday use. You will NOT receive any clinical feed-back on the recordings being done, and the is NO doctor looking at these recordings.\nIF YOU IN ANY WAY FEEL UNCOMFORTABLE OR ILL DURING THE TEST, YOU SHOULD CONTACT YOUR REGULAR HEALTHCARE PROFESSIONAL.\n\nAfter the test, data will be analyzed in cooperation with our collaborating medical researchers at Steno Diabetes Center Copenhagen. If the medical researchers finds relevant diabetes complications in the collected data they may contact you.";

RPConsentSection voluntarySection = RPConsentSection.withParams(
    RPConsentSectionType.Custom)
  ..title = "Voluntary Participation"
  ..summary =
      "Your participation in this test is voluntary and you can withdraw at any time and without giving a reason"
  ..content =
      "Your participation in this test is voluntary.\n\nIt is up to you to decide whether or not to take part in this test. If you decide to take part in this test, you will now be asked to sign a consent form. But, after you sign the consent form, you are still free to withdraw at any time and without giving a reason. Withdrawing from this test will not affect the relationship you have, if any, with the researchers or medical doctors conducting the test.";

RPConsentSignature signature = RPConsentSignature.withIdentifier("signatureID");

RPConsentDocument consentDocument = RPConsentDocument.withParams('DiaFocus', [
  overviewSection,
  dataGatheringSection,
  dataUseSection,
  privacySection,
  studyTaskAndTimeCommitmentSection,
  clinicalInformationSection,
  voluntarySection,
])
  ..addSignature(signature);

RPConsentReviewStep consentReviewStep = RPConsentReviewStep(
    "consentreviewstepID", consentDocument)
  ..reasonForConsent =
      "I have read and I understand the provided information and have had the opportunity to ask questions. I understand that my participation is voluntary and that I am free to withdraw at any time, without giving a reason and without cost. I understand that I will be given a copy of this consent form. I voluntarily agree to take part in this test."
  ..text = "Agree?"
  ..title = "Consent";

RPVisualConsentStep consentVisualStep =
    RPVisualConsentStep("visualStep", consentDocument);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Thank you!"
  ..text = "We saved your consent document.";

RPOrderedTask informedConsentTask = RPOrderedTask(
  "consentTaskID",
  [
    consentVisualStep,
    consentReviewStep,
    completionStep,
  ],
  closeAfterFinished: false,
);