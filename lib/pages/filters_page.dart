import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  //This is a WIDGET CLASS or simple words Class(TO access its arguments in STATE we use "widget" Keyword)
  static const routeName = '/filters_page';
  final Function saveFilters;
  final Map<String, bool> currentfilters;
  FiltersPage(this.currentfilters, this.saveFilters);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  //THis is a STATE CLASS
  var _isglutenfree = false;
  var _islactosefree = false;
  var _isv = false;
  var _isnv = false;

  @override
  void initState() {
    _isglutenfree = widget.currentfilters['gluten'] as bool;
    _islactosefree = widget.currentfilters['lactose'] as bool;
    _isv = widget.currentfilters['veg'] as bool;
    _isnv = widget.currentfilters['nonveg'] as bool;
    super.initState();
  }

  Widget _buildSwtiches(String filterName, String filterDescription,
      bool currentValue, Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(
        filterName,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(filterDescription),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _isglutenfree,
                    'lactose': _islactosefree,
                    'veg': _isv,
                    'nonveg': _isnv,
                  };
                  widget.saveFilters(
                      selectedFilters); //Here this "widget" keyword allows us to access the function made in Class instead of STATE
                },
                icon: Icon(Icons.save))
          ],
          title: Text('Filters',
              style: TextStyle(
                fontSize: 25,
              ))),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Choose Filters to shortlist your Meals...',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
          Expanded(
            child: ListView(
              children: [
                _buildSwtiches('Gluten-Free', "Ensure your meal is Gluten free",
                    _isglutenfree, (newValue) {
                  setState(() {
                    _isglutenfree = newValue;
                  });
                }),
                _buildSwtiches(
                    'Lactose-Free',
                    "Ensure your meal is Lactose free",
                    _islactosefree, (newValue) {
                  setState(() {
                    _islactosefree = newValue;
                  });
                }),
                _buildSwtiches('Vegeterian', "Ensure your meal is Veg", _isv,
                    (newValue) {
                  setState(() {
                    _isv = newValue;
                  });
                }),
                _buildSwtiches(
                    'Non-Vegeterian', "Ensure your meal is Non-Veg", _isnv,
                    (newValue) {
                  setState(() {
                    _isnv = newValue;
                  });
                }),
                Center(
                  heightFactor: 10,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(115, 127, 119, 119),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: Text(
                      'Don\'t forget to save the Changes!',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
