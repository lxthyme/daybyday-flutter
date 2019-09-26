import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      // title: 'Welcome to Flutter',
      title: 'Startup Name Generator',
      // home: Scaffold(
      //   appBar: AppBar(
      //   title: Text('Welcome to Flutter'),
      // ),
      // body: Center(
      //   // child: Text(wordPair.asPascalCase),
      //   child: RandomWords(),
      // ),
      // ),
      home: RandomWords(),
    );
  }}


class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();

}
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  Widget _buildRow(prefix0.WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if(i.isOdd) return Divider();

        final idx = i ~/ 2;
        if(idx >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[idx]);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

}
