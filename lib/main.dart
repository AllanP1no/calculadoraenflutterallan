import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora bien ',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '0';
  double num1 = 0;
  double num2 = 0;
  String op = '';
  bool clear = false;

  void btnClicked(String btnVal) {
    setState(() {
      if (btnVal == 'C') {
        text = '0';
        num1 = 0;
        num2 = 0;
        op = '';
      } else if (btnVal == '+' ||
          btnVal == '-' ||
          btnVal == 'x' ||
          btnVal == '/') {
        num1 = double.parse(text);
        op = btnVal;
        text = '0';
      } else if (btnVal == '=') {
        num2 = double.parse(text);

        if (op == '+') {
          text = (num1 + num2).toString();
        }
        if (op == '-') {
          text = (num1 - num2).toString();
        }
        if (op == 'x') {
          text = (num1 * num2).toString();
        }
        if (op == '/') {
          text = (num1 / num2).toString();
        }
      } else if (btnVal == '%') {
        text = (double.parse(text) / 100).toString();
      } else if (btnVal == '+/-') {
        if (!text.contains('-')) {
          text = '-' + text;
        } else {
          text = text.substring(1);
        }
      } else {
        if (text == '0') {
          text = btnVal;
        } else {
          text = text + btnVal;
        }
      }
    });
  }

  Widget button(String text, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
          ),
          onPressed: () => btnClicked(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Bien'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              button('C', Colors.grey),
              button('+/-', Colors.grey),
              button('%', Colors.grey),
              button('/', Colors.orange),
            ],
          ),
          Row(
            children: [
              button('7', Colors.black54),
              button('8', Colors.black54),
              button('9', Colors.black54),
              button('x', Colors.orange),
            ],
          ),
          Row(
            children: [
              button('4', Colors.black54),
              button('5', Colors.black54),
              button('6', Colors.black54),
              button('-', Colors.orange),
            ],
          ),
          Row(
            children: [
              button('1', Colors.black54),
              button('2', Colors.black54),
              button('3', Colors.black54),
              button('+', Colors.orange),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.all(20),
                    ),
                    onPressed: () => btnClicked('0'),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              button('.', Colors.black54),
              button('=', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre mi progenitor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Calculadora bien', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Icon(Icons.code, size: 50),
            SizedBox(height: 20),
            Text('Ft.Flutter'),
            SizedBox(height: 20),
            Text('por Allan'),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
