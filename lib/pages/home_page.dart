import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:university_app_with_bloc/bloc/cubit.dart';
import 'package:university_app_with_bloc/pages/uni_page.dart';

import '../bloc/state.dart';
import '../university_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  Box<University>? box;

  hiveInit() async {
    box = await Hive.openBox('country');
  }

  @override
  void initState() {
    hiveInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        BlocProvider.value(
                          value: BlocProvider.of<MainCubit>(context),
                          child: UniPage(),
                        )));
          },
          child: Container(
            height: 100,
            width: 270,
            decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: BlocBuilder<MainCubit, MainState>(
                builder: (context, state) {
                  return Text(controller.text,
                    style: TextStyle(color: Colors.white, fontSize: 20),);
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context1) {
                return AlertDialog(
                  title: Text("Name"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: controller,
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<MainCubit>()
                              .getUniversity(controller.text);
                          Navigator.pop(context);
                        },
                        child: Text("Save"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
