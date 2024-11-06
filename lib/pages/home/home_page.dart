import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/add_note/add_note_page.dart';
import 'package:todo_app/pages/home/provider/home_provider.dart';
import 'package:todo_app/pages/home/widgets/add_note_fab.dart';
import 'package:todo_app/pages/home/widgets/empty_state_widget.dart';
import 'package:todo_app/pages/home/widgets/notes_list.dart';
import 'package:todo_app/util/show_toast.dart';

import '../../util/app_colors.dart';
import '../../util/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().populateNotes();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            title: const Text('To-Do App'),
          ),

          // ADD NOTE BUTTON
          floatingActionButton: AddNoteFab(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNotePage())).then((_) {
              if (context.mounted) {
                context.read<HomeProvider>().populateNotes();
              }
            });
          }),

          body: Consumer<HomeProvider>(builder: (context, provider, _) {

            // LOADING STATE
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // EMPTY/ERROR STATE
            if (provider.hasError) {
              return const EmptyStateWidget();
            }

            // LOADED STATE
            return Column(
              children: [
                const Text('Long press to delete a note'),
                Expanded(child: NotesList(list: provider.notesList!)),
              ],
            );

          }),
        ));
  }
}
