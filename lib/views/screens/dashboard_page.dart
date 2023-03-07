import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/repository/service_api.dart';
import 'package:photo_app/views/widgets/photo_view_item.dart';
import '../../models/photo_resource.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final api = GetIt.instance.get<ServiceApi>();
  List<PhotoResource> photos = List.empty(growable: true);
  List<String> categories = [
    "Nature",
    "Animals",
    "City",
    "Countryside",
    "Oceans",
    "Sky",
    "Clouds",
    "Dessert",
    "Food"
  ];
  int selectedCategory = -1;

  @override
  void initState() {
    super.initState();
    api.getItemsPerCategory("nature").then((value) => {
          setState(() {
            photos = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.camera),
              SizedBox(
                width: 8.0,
              ),
              Text("Explore")
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Material(
                elevation: 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: _categoryItemBuilder,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                key: ObjectKey(photos),
                itemCount: photos.length,
                itemBuilder: _photoItemBuilder,
              ),
            ),
          ],
        ));
  }

  Widget _photoItemBuilder(BuildContext context, int index) {
    return PhotoViewItem(
      photoResource: photos.elementAt(index),
    );
  }

  Widget _categoryItemBuilder(BuildContext context, int index) {
    bool selected = selectedCategory == index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: (selected) ?
          MaterialStateProperty.all(Colors.green): null,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
        onPressed: () {
          setState(() {
            selectedCategory = index;
          });
          loadCategory(categories[index]);
        },
        child: Text(
          categories[index],
          style: (selected) ? TextStyle(color: Colors.white) : TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  void loadCategory(String category) {
    api.getItemsPerCategory(category).then((value) => {
          setState(() {
            photos = value;
          })
        });
  }
}
