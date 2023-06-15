import 'package:flutter/material.dart';

import '../all/custome_text_field.dart';

class HomeFields extends StatelessWidget {
  const HomeFields({
    super.key,
    required this.titleController,
    required this.contentController,
  });

  final TextEditingController titleController;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        TextFieldCustom(
          hint: "Title",
          label: "Title",
          controller: titleController,
          icon: Icons.read_more,
        ),
        TextFieldCustom(
            minLines: 3,
            maxLines: 10,
            hint: "content",
            label: "content",
            controller: contentController,
            icon: Icons.content_copy),
      ],
    );
  }
}
