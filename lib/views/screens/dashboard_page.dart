import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/models/photo_icon_action.dart';
import 'package:photo_app/models/photo_resource.dart';
import 'package:photo_app/views/widgets/category_item.dart';
import 'package:photo_app/views/widgets/photo_view_item.dart';
import '../../reporitory/photos_repository.dart';
import '../../utils.dart';
import '../widgets/comments_modal.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final photos = ref.watch(repositoryProvider);
    final categories = ref.watch(categoryProvider);
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
                  itemCount: categories.length,
                  itemBuilder: _categoryItemBuilder,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: ListView.builder(
                  key: ObjectKey(photos),
                  itemCount: photos.length,
                  itemBuilder: (ctx, index) => _photoItemBuilder(ctx, photos[index]),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _photoItemBuilder(BuildContext context, PhotoResource photoResource) {
    return PhotoViewItem(
      photoResource: photoResource,
      onActionDetected: (photoIconAction, photoId) => {
        if (photoIconAction == PhotoIconAction.LIKE)
          {
            //repository.photoLiked(photoId)
          }
        else if (photoIconAction == PhotoIconAction.COMMENT)
          {CommentsModal().showCommentsModal(ref, context, photoId)}
        else if (photoIconAction == PhotoIconAction.SHARE)
          {Utils.sharePhoto(photoId)}
      },
    );
  }

  Widget _categoryItemBuilder(BuildContext context, int index) {
    final categories = ref.watch(categoryProvider);
    bool selected = _selectedCategoryIndex == index;
    String name = categories[index];
    return CategoryItem(
      name: name,
      selected: selected,
      tapListener: () => {
        setState(() {
          _selectedCategoryIndex = index;
          ref.read(repositoryProvider.notifier).fetchPhotosBy(name);
        })
      },
    );
  }
}
