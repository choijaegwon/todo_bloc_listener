import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_listener/blocs/blocs.dart';
import 'pages/todos_page/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterBloc>(
          create: (context) => TodoFilterBloc(),
        ),
        BlocProvider<TodoSearchBloc>(
          create: (context) => TodoSearchBloc(),
        ),
        BlocProvider<TodoListBloc>(
          create: (context) => TodoListBloc(),
        ),
        BlocProvider<ActiveTodoCountBloc>(
          create: (context) => ActiveTodoCountBloc(
            initialActiveTodoCount:
                context.read<TodoListBloc>().state.todos.length,
            // context.read<TodoListBloc>(), 도 가능하다
          ),
        ),
        BlocProvider<FilteredTodosBloc>(
          create: (context) => FilteredTodosBloc(
            initialTodos: context.read<TodoListBloc>().state.todos,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TODO',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosPage(),
      ),
    );
  }
}
