import 'dart:async';

import 'package:dolaraldia_argentina/interfaces/data_response.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/models/api/invalid_response.dart';
import 'package:dolaraldia_argentina/providers/cubits/api_data.dart';
import 'package:dolaraldia_argentina/providers/cubits/last_input.dart';
import 'package:dolaraldia_argentina/providers/cubits/rate_cubit.dart';
import 'package:dolaraldia_argentina/utils/get_url.dart';
import 'package:dolaraldia_argentina/widgets/home/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<DataResponse> _apiResponse;

  @override
  void initState() {
    super.initState();
    _apiResponse = getUrl().then((value) => ApiResponse.fromJson(value));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _apiResponse =
                getUrl().then((value) => ApiResponse.fromJson(value));
          });
        },
        child: FutureBuilder(
          future: _apiResponse,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                debugPrint(snapshot.data.toString());
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => RateCubit(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          ApiDataCubit(snapshot.data ?? InvalidResponse()),
                    ),
                    BlocProvider(create: (context) => LastInputCubit()),
                  ],
                  child: const Content(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
