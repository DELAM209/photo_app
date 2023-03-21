import 'package:flutter/material.dart';
import 'package:photo_app/models/photo_icon_action.dart';
import 'package:photo_app/view_models/dashboard_viewmodel.dart';
import 'package:photo_app/views/widgets/category_item.dart';
import 'package:photo_app/views/widgets/photo_view_item.dart';
import 'package:provider/provider.dart';

import '../../utils.dart';
import '../widgets/comments_modal.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardViewModel _dashboardViewModel = DashboardViewModel();
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _dashboardViewModel.loadPhotosBy("nature");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
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
                elevation: 3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _dashboardViewModel.categories.length,
                  itemBuilder: _categoryItemBuilder,
                ),
              ),
            ),
            ChangeNotifierProvider<DashboardViewModel>.value(
              value: _dashboardViewModel,
              child: Consumer<DashboardViewModel>(
                builder: (context, viewModel, _) {
                  return Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        key: ObjectKey(_dashboardViewModel.photos),
                        itemCount: _dashboardViewModel.photos.length,
                        itemBuilder: _photoItemBuilder,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  Widget _photoItemBuilder(BuildContext context, int index) {
    return PhotoViewItem(
      photoResource: _dashboardViewModel.photos.elementAt(index),
      onActionDetected: (photoIconAction, photoId) => {
        if (photoIconAction == PhotoIconAction.LIKE)
          {_dashboardViewModel.photoLiked(photoId)}
        else if (photoIconAction == PhotoIconAction.COMMENT)
          {CommentsModal().showCommentsModal(context, photoId)}
        else if (photoIconAction == PhotoIconAction.SHARE)
          {Utils.sharePhoto(photoId)}
      },
    );
  }

  Widget _categoryItemBuilder(BuildContext context, int index) {
    bool selected = _selectedCategoryIndex == index;
    String name = _dashboardViewModel.getCategoryName(index);
    return CategoryItem(
      name: name,
      selected: selected,
      tapListener: () => {
        setState(() {
          _selectedCategoryIndex = index;
          _dashboardViewModel
              .loadPhotosBy(_dashboardViewModel.categories[index]);
        })
      },
    );
  }
}
