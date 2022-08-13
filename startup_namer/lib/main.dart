import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Welcome to Flutter',
    debugShowCheckedModeBanner: false,
    home: RandomWords(),
  );
 }       
}
class RandomWords extends StatefulWidget {
    _RandomWordsState createState() => _RandomWordsState();
  }
  @override
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18, color: Colors.black);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de Nomes de Startups'),
        ),
        body: _buildsugestions(),
      );
    }
Widget _buildsugestions() {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemBuilder: /*1*/ (context, i) {
      if (i.isOdd) return const Divider(); /*2*/
        final index = i ~/ 2; /*3*/
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      },
  );
}
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}