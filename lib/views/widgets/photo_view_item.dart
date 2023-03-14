import 'package:flutter/material.dart';
import 'package:photo_app/models/photo_icon_action.dart';
import 'package:photo_app/models/photo_resource.dart';

class PhotoViewItem extends StatelessWidget {
  final PhotoResource photoResource;
  final Function(PhotoIconAction, dynamic) onActionDetected;

  const PhotoViewItem({super.key, required this.photoResource, required this.onActionDetected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            children: [
              buildUserInfo(),
              SizedBox(height: 16),
              buildImage(),
              SizedBox(height: 16),
              buildActions(),
              SizedBox(height: 16),
              buildFooter(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(photoResource.photographerUrl),
          backgroundColor: Color.fromARGB(255, 80, 80, 120),
        ),
        SizedBox(width: 8.0),
        Text(
          photoResource.photographer,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        topRight: Radius.circular(25),
        topLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
      child: Image.network(
        photoResource.url,
        fit: BoxFit.cover,
        height: 280,
        width: double.infinity, // Set width to 100% of the parent
      ),
    );
  }

  buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => {onActionDetected(PhotoIconAction.LIKE, photoResource.id)},
          child: Icon(
            (photoResource.liked) ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.purple,
            size: 25.0,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => {
            onActionDetected(PhotoIconAction.COMMENT, photoResource.id)
          },
          child: Icon(
            Icons.comment_outlined,
            color: Colors.purple,
            size: 25.0,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => {onActionDetected(PhotoIconAction.SHARE, photoResource.url)},
          child: Icon(
            Icons.share_outlined,
            color: Colors.purple,
            size: 25.0,
          ),
        ),
      ],
    );
  }

  buildFooter() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(photoResource.alt, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15)),
    );
  }
}
