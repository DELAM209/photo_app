import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/models/photo_comment.dart';
import '../../network/comments_api.dart';

class CommentsModal {
  // Using a future builder, since this is not really a widget
  late Future<List<PhotoComment>> futureComments;

  showCommentsModal(WidgetRef ref, BuildContext context, int photoId) {
    futureComments = ref.read(commentsApiProvider).getCommentsForMedia(photoId);
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

  WidgetBuilder _modalBuilder() => (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets.copyWith(left: 16, top: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<List<PhotoComment>>(
                  future: futureComments,
                  builder: (context, comments) {
                    return Expanded(
                      child: (comments.hasData)
                          ? ListView.builder(
                              key: ObjectKey(comments.data),
                              itemCount: comments.data!.length,
                              itemBuilder: (context, index) => _photoCommentBuilder(comments.data![index]),
                            )
                          : Text("Loading..."),
                    );
                  },
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
                ),
              ],
            ),
          ),
        );
      };

  Widget? _photoCommentBuilder(PhotoComment photoComment) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            photoComment.userName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(photoComment.comment),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
