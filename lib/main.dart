import 'package:flutter/material.dart';

void main() {
  runApp(EventManagerApp());
}

class EventManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Manager',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 0, 0),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Colors.grey.shade700,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EventPage()),
                );
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventLocationController =
      TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _eventTimeController = TextEditingController();

  List<String> _events = [];

  @override
  void initState() {
    super.initState();
  }

  _addEvent() {
    setState(() {
      _events.add(_eventNameController.text);
    });
    _eventNameController.clear();
    _eventLocationController.clear();
    _eventDateController.clear();
    _eventTimeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _eventNameController,
              decoration: const InputDecoration(labelText: 'Nome do Evento:'),
            ),
            TextField(
              controller: _eventLocationController,
              decoration: const InputDecoration(labelText: 'Local:'),
            ),
            TextField(
              controller: _eventDateController,
              decoration: const InputDecoration(labelText: 'Data'),
            ),
            TextField(
              controller: _eventTimeController,
              decoration: const InputDecoration(labelText: 'Hora:'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addEvent,
              child: const Text('Adicionnar evento'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_events[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
