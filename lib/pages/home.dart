import 'dart:async';

import 'package:dolaraldia_argentina/helpers/get_api_data.dart';
import 'package:dolaraldia_argentina/helpers/get_crypto_data.dart';
import 'package:dolaraldia_argentina/interfaces/data_response.dart';
import 'package:dolaraldia_argentina/models/api/api_response.dart';
import 'package:dolaraldia_argentina/models/api/invalid_response.dart';
import 'package:dolaraldia_argentina/models/crypto/crypto_response.dart';
import 'package:dolaraldia_argentina/providers/calculator/api_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/crypto_data.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_api_value.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_input.dart';
import 'package:dolaraldia_argentina/providers/calculator/last_crypto_value.dart';
import 'package:dolaraldia_argentina/providers/calculator/rate.dart';
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
  late Future<CryptoResponse> _cryptoResponse;

  @override
  void initState() {
    super.initState();
    _apiResponse = getApiData().then((value) => ApiResponse.fromJson(value));
    _cryptoResponse = getCryptoData().then((value) => value!);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        setState(() {
          _apiResponse =
              getApiData().then((value) => ApiResponse.fromJson(value));
          _cryptoResponse = getCryptoData().then((value) => value!);
        });
      },
      child: FutureBuilder(
        future: Future.wait(
          [
            _apiResponse,
            _cryptoResponse,
          ],
        ),
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
                    create: (context) => ApiDataCubit(
                      (snapshot.data?[0] as DataResponse),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => CryptoDataCubit(
                      (snapshot.data?[1] as CryptoResponse),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => LastCryptoInputCubit(),
                  ),
                  BlocProvider(
                    create: (context) => LastCryptoValueCubit(),
                  ),
                  BlocProvider(
                    create: (context) => LastApiInputCubit(),
                  ),
                  BlocProvider(
                    create: (context) => LastApiValueCubit(),
                  ),
                ],
                child: const Content(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
