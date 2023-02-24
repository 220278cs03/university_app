import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_app_with_bloc/bloc/cubit.dart';
import 'package:university_app_with_bloc/bloc/state.dart';

class UniPage extends StatefulWidget {
  const UniPage({Key? key}) : super(key: key);

  @override
  State<UniPage> createState() => _UniPageState();
}

class _UniPageState extends State<UniPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Universities"),
        centerTitle: true,
      ),
      body: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount:state.listOfUniversity?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.pink.withOpacity(0.5)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.listOfUniversity?[index].name ?? "", style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("${state.listOfUniversity?[index].webPages ?? " "}", style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("${state.listOfUniversity?[index].alphaTwoCode ?? ""}", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
