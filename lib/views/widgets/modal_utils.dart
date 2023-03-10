import 'package:flutter/material.dart';
import 'package:photo_app/models/photo_comment.dart';

class ModalUtils {
  static List<PhotoComment> photoComments = [
    PhotoComment(12345, "Bella Ramsey", "Great scenario"),
    PhotoComment(12345, "Troy Baker", "Such an amazing view"),
    PhotoComment(12345, "Pedro Pascal", "I've been there, the food is great! :)"),
    PhotoComment(12345, "Ashley Johnson", "I wish I could be there now"),
  ];

  // TODO receive the photo comments list here
  static showMessageModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: _modalBuilder(),
    );
  }

  static WidgetBuilder _modalBuilder() => (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets.copyWith(left: 16, top: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    key: ObjectKey(photoComments),
                    itemCount: photoComments.length,
                    itemBuilder: _photoCommentBuilder,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    hintText: 'Comment this post...',
                  ),
                ),
                SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        );
      };

  static Widget? _photoCommentBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            photoComments[index].userName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(photoComments[index].comment),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
