import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'todo_provider.dart';

class TodoInput extends ConsumerWidget {
  const TodoInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();

    void addTodo() {
      final todoText = controller.text;
      if (todoText.isNotEmpty) {
        ref.read(todoProvider.notifier).addTodo(todoText);
        controller.clear(); // Clear the input field
      }
    }

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Enter a to-do',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: addTodo,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
