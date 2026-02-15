import 'package:flutter/material.dart';
import '../utils/text_input_formatters.dart';
import '../providers/pet_provider.dart';

class FeedPetDialog extends StatelessWidget {
  final PetProvider petProvider;

  const FeedPetDialog({required this.petProvider});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(
      text: UnorderedListFormatter.bullet,
    );
    
    // Set cursor position to end of bullet after dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    });

    return AlertDialog(
      title: const Text('Feed Your Pet'),
      content: SizedBox(
        width: double.maxFinite,
        height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                autofocus: true,
                inputFormatters: [UnorderedListFormatter()],
                decoration: InputDecoration(
                  filled: false,
                  hintText: 'Write anything here',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              petProvider.feedPet();
              Navigator.pop(context);
            }
          },
          child: const Text('Feed'),
        ),
      ],
    );
  }
}
