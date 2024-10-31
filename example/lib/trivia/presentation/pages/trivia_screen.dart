import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:example/trivia/presentation/manager/get_trivia_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_list_trivia.dart';

class TriviaScreen extends StatelessWidget {
  const TriviaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<GetTriviaBloc>(
        create: (_) =>
            GetTriviaBloc(GetListTriviaUseCase())..add(GetTriviaDataEvent(10)),
        child: BlocBuilder<GetTriviaBloc, GetTriviaState>(
            builder: (context, state) {
          if (state is GetTriviaLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetTriviaError) {
            return Center(child: Text(state.data.message));
          }
          if (state is GetTriviaSuccess) {
            return SafeArea(
                child: ListView(
              children: state.data.map(
                  (e) => BuildTrivia(trivia: e,)
              ).toList()
            ));
          }
          return SizedBox();
        }),
      ),
    );
  }


}

class BuildTrivia extends StatefulWidget {
  final Trivia trivia;
  const BuildTrivia({super.key, required this.trivia});

  @override
  State<BuildTrivia> createState() => _BuildTriviaState();
}

class _BuildTriviaState extends State<BuildTrivia> {
  TextEditingController _controller = TextEditingController();
  Color boxColors = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: boxColors,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: [
          Text(widget.trivia.question??""),
          TextField(controller: _controller,),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              setState(() {
                if(_controller.text.toLowerCase() == widget.trivia.correctAnswer){
                  boxColors = Colors.greenAccent;
                }
                boxColors = Colors.redAccent;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueAccent
              ),
              child: Center(child: Text("Submit"),),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

