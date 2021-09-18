


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'member.dart';
import 'strings.dart' as strings;
class GithubFlutter extends StatefulWidget {


  GithubFlutter({Key? key}) : super(key: key);

  @override
  _GithubFlutterState createState() => _GithubFlutterState();
}

class _GithubFlutterState extends State<GithubFlutter> {
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Future<void> _loadData() async {
    const dataUrl = 'https://api.github.com/orgs/raywenderlich/members';
    final response = await http.get(Uri.parse(dataUrl));
    setState(() {
      final  datalist = json.decode(response.body) as List;
      for (final item in datalist) {
        final login = item['login'] as String? ?? '';
        final url = item['avatar_url'] as String? ?? '';
        final member = Member(login,url);
        _members.add(member);
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  Widget _buildRow(int i) {
    return ListTile(
      title: Text('${_members[i].login}', style: _biggerFont),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[i].avatarUrl),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.appTitle),
      ),
      body:  ListView.separated(

          padding: const EdgeInsets.all(16.0),
          itemCount: _members.length,

          itemBuilder: (BuildContext context, int position) {
            return _buildRow(position);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }),


    );
  }
}