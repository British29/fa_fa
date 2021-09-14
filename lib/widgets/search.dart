import 'package:flutter/material.dart';

class CooperativeSearch extends SearchDelegate {
  List<String> fetchAllCooperativeData;
  String selectedResult;

  CooperativeSearch(this.fetchAllCooperativeData, this.selectedResult);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestedCooperative = [];
    query.isEmpty
        ? suggestedCooperative = fetchAllCooperativeData
        : suggestedCooperative.addAll(fetchAllCooperativeData.where(
            (element) => element.toLowerCase().contains(query.toLowerCase()),
          ));

    return ListView.builder(
        itemCount: suggestedCooperative.length,
        itemBuilder: (context, position) => ListTile(
              title: Text(suggestedCooperative[position]),
            ));
  }
}
