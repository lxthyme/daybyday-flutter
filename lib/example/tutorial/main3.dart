import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWordsScreen extends StatefulWidget {
  final String title;

  const RandomWordsScreen({Key key, this.title}) : super(key: key);

  @override
  _RandomWordsScreenState createState() => _RandomWordsScreenState();

}
class _RandomWordsScreenState extends State<RandomWordsScreen> {
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
        title: Text('${widget.title} Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

}
