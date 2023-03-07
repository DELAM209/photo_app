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
  final getIt = GetIt.instance;
  List<PhotoResource> photos = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    final api = getIt.get<ServiceApi>();
    api.getPhotoResources().then((value) => {
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
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: _photoItemBuilder,
      ),
    );
  }

  Widget _photoItemBuilder(BuildContext context, int index) {
    return PhotoViewItem(
      photoResource: photos.elementAt(index),
    );
  }
}
