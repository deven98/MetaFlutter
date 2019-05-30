import 'package:flutter/material.dart';
import 'package:flutter_app_builder/utils/color_utils.dart';
import 'package:flutter_app_builder/widget_builder_utilities/model_widget.dart';

class SelectWidgetDialog extends StatefulWidget {
  @override
  _SelectWidgetDialogState createState() => _SelectWidgetDialogState();
}

class _SelectWidgetDialogState extends State<SelectWidgetDialog> {
  TextEditingController _searchController = TextEditingController();

  String searchParam = "";

  @override
  Widget build(BuildContext context) {
    List<WidgetType> types = [];

    if (searchParam.trim() == "") {
      types = WidgetType.values;
    } else {
      WidgetType.values.forEach((type) {
        if(type.toString().toLowerCase().contains(searchParam.toLowerCase())) {
          types.add(type);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Widget"),
      ),
      body: ListView(
        children: <Widget>[
          _buildSearchBar(),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.0),
            itemBuilder: (context, position) {
              ColorPair pair = getColorPair(
                  getNewModelFromType(WidgetType.values[WidgetType.values.indexOf(types[position])]));

              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: pair.backgroundColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context,
                          getNewModelFromType(WidgetType.values[WidgetType.values.indexOf(types[position])]));
                    },
                    child: Center(
                      child: Text(
                        types[position].toString().split(".")[1],
                        style: TextStyle(
                            color: pair.textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: types.length,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 60.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Search"),
              ),
            ),
            flex: 4,
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  searchParam = _searchController.text.trim();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
