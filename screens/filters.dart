import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const RouteName = "/filter";
  Map<String, bool> filterData;
  final Function setFilters;

  Filters(this.filterData, this.setFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool is_gluten = false;
  bool is_lactose = false;
  bool is_vegitarian = false;
  bool is_vegan = false;

  @override
  initState() {
    is_gluten = widget.filterData['is_gluten'] as bool;
    is_lactose = widget.filterData['is_lactose'] as bool;
    is_vegitarian = widget.filterData['is_vegitarian'] as bool;
    is_vegan = widget.filterData['is_vegan'] as bool;

    super.initState();
  }

  Widget build_Switch_list(String _title, String _subtitile, bool currentVal,
      Function? valSelector(bool)) {
    return SwitchListTile(
      title: Text(_title),
      subtitle: Text(_subtitile),
      value: currentVal,
      onChanged: valSelector,
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> userSelectedFilterData = {
      'is_gluten': is_gluten,
      'is_lactose': is_lactose,
      'is_vegitarian': is_vegitarian,
      'is_vegan': is_vegan
    };

    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  widget.setFilters(userSelectedFilterData);
                  Navigator.of(context).pushNamed("/");
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust Your Meal Selection",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                build_Switch_list(
                    "Gluten-Free", "Only include Gluten-Free meals", is_gluten,
                    (value) {
                  setState(() {
                    is_gluten = value;
                  });
                }),
                build_Switch_list("Lactose-Free",
                    "Only include Lactose-Free meals", is_lactose, (value) {
                  setState(() {
                    is_lactose = value;
                  });
                }),
                build_Switch_list("Vegetarian", "Only include Vegetarian meals",
                    is_vegitarian, (value) {
                  setState(() {
                    is_vegitarian = value;
                  });
                }),
                build_Switch_list("Vegan", "Only include Vegan meals", is_vegan,
                    (value) {
                  setState(() {
                    is_vegan = value;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
