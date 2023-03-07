import 'package:flutter/material.dart';
import 'package:photo_app/models/photo_resource.dart';

class PhotoViewItem extends StatelessWidget {
  final PhotoResource photoResource;

  const PhotoViewItem({super.key, required this.photoResource});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          buildUserInfo(),
          SizedBox(height: 16),
          buildImage(),
          SizedBox(height: 16),
          buildActions(),
          SizedBox(height: 16),
          buildFooter(),
          Divider(
            thickness: 1,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }

  buildUserInfo() {
    print("TEST=----------------");
    print(photoResource.photographerUrl);
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
        Icon(Icons.favorite_border_outlined, color: Colors.purple, size: 25.0),
        SizedBox(width: 10),
        Icon(Icons.comment_outlined, color: Colors.purple, size: 25.0),
        SizedBox(width: 10),
        Icon(Icons.share_outlined, color: Colors.purple, size: 25.0),
      ],
    );
  }

  buildFooter() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(photoResource.alt,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15)),
    );
  }
}
