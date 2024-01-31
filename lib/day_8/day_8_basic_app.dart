import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Day8BasicApp extends StatefulWidget {
  const Day8BasicApp({super.key});

  @override
  State<Day8BasicApp> createState() => _Day8BasicAppState();
}

class _Day8BasicAppState extends State<Day8BasicApp> {
  late TextEditingController _controller;
  List<Results> _results = [];
  bool isAPICalled = false;
  bool isLoading = false;
  bool hasError = false;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter the name of a Star Wars character here!',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          isAPICalled = true;
                          isLoading = true;
                          setState(() {});
                          _results = await _getCharacter(_controller.text).then((value) {
                            hasError = false;
                            setState(() {});
                            return value;
                          }).catchError((e) {
                            hasError = true;
                            setState(() {});
                            return <Results>[];
                          });
                          isLoading = false;
                          setState(() {});
                        },
                  child: const Text('Search!'),
                ),
              ),
            ),
          ),
          Expanded(
            child: !isAPICalled
                ? const SizedBox()
                : hasError
                    ? const Center(
                        child: Text('API Call Failed!'),
                      )
                    : isLoading
                        ? const Center(
                            child: Text('Loading...'),
                          )
                        : _results.isEmpty
                            ? const Center(
                                child: Text('No Results Found!'),
                              )
                            : ListView.builder(
                                itemCount: _results.length,
                                itemBuilder: (context, index) {
                                  final result = _results[index];
                                  return Card(
                                    margin: const EdgeInsets.all(16),
                                    color: Colors.grey[200],
                                    child: Column(
                                      children: [
                                        Text(result.name ?? ''),
                                        Text('${result.height ?? ''} / ${result.mass ?? ''}'),
                                        Text('Hair Color: ${result.hairColor ?? ''} | Skin Color: ${result.skinColor ?? ''}'),
                                      ],
                                    ),
                                  );
                                },
                              ),
          ),
        ],
      ),
    );
  }

  Future<List<Results>> _getCharacter(String name) async {
    final url = Uri.https('swapi.dev', '/api/people/', {'search': name});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final results = jsonResponse['results'] as List<dynamic>;
      return results.map((e) => Results.fromMap(e as Map<String, dynamic>)).toList();
    } else {
      return <Results>[];
    }
  }
}

class Results {
  String? name;
  String? height;
  String? mass;
  String? hairColor;
  String? skinColor;

  Results({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
  });

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      name: map['name'] != null ? map['name'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
      mass: map['mass'] != null ? map['mass'] as String : null,
      hairColor: map['hair_color'] != null ? map['hair_color'] as String : null,
      skinColor: map['skin_color'] != null ? map['skin_color'] as String : null,
    );
  }

  factory Results.fromJson(String source) => Results.fromMap(json.decode(source) as Map<String, dynamic>);
}
