import 'package:flutter/material.dart';
import 'package:focus_app/model/focus.dart';
import 'package:focus_app/pages/add_activity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FocusAct> _focusList = [];

  void _addActivity() async {
    final newActivity =
        await Navigator.of(context).push<FocusAct>(MaterialPageRoute(
      builder: (context) => const AddAct(),
    ));
    if (newActivity == null) {
      return;
    }
    setState(() {
      _focusList.add(newActivity);
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget content;
    _focusList.isNotEmpty
        ? content = ListView.builder(
            itemCount: _focusList.length,
            itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction) {
                _focusList.removeAt(index);
              },
              key: ValueKey(_focusList[index]),
              child: ListTile(
                title: Text(_focusList[index].title),
                subtitle: Text(_focusList[index].description),
              ),
            ),
          )
        : content = const Center(
            child: Text("Belum ada aktifitas.\nAyo produktif hari ini!"),
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus App'),
      ),
      body: content,
      floatingActionButton: IconButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
        onPressed: _addActivity,
        icon: const Icon(Icons.add),
      ),
    );
  }
}
