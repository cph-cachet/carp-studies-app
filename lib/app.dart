part of carp_study_app;

class CARPStudyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: CARPStudyAppHome(key: key),
    );
  }
}

class CARPStudyAppHome extends StatefulWidget {
  CARPStudyAppHome({Key key}) : super(key: key);

  CARPStudyAppState createState() => CARPStudyAppState();
}

class CARPStudyAppState extends State<CARPStudyAppHome> {
  int _selectedIndex = 0;

  final _pages = [
    StudyVisualization(),
    TaskList(),
    DataVisualization(),
  ];

  void initState() {
    super.initState();
    settings.init();
    bloc.init();
    bloc.start();
  }

  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Study'),
          BottomNavigationBarItem(icon: Icon(Icons.spellcheck), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Data'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _restart,
//        tooltip: 'Restart study & probes',
//        child: bloc.isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
//      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _stop() {
    setState(() {
      if (bloc.isRunning) bloc.stop();
    });
  }

  void _restart() {
    setState(() {
      if (bloc.isRunning)
        bloc.pause();
      else
        bloc.resume();
    });
  }
}
