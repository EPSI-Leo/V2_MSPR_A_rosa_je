import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/core/data/entities/advice/advice.dart';
import 'package:arosa_je/core/data/entities/user/user.dart';
import 'package:arosa_je/core/local/session_manager/secure_storage_keys.dart';
import 'package:arosa_je/core/local/session_manager/session_manager.dart';
import 'package:arosa_je/modules/advices/notifier.dart';
import 'package:arosa_je/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AdvicesView extends ConsumerStatefulWidget {
  const AdvicesView({super.key});

  @override
  _AdvicesViewState createState() => _AdvicesViewState();
}

class _AdvicesViewState extends ConsumerState<AdvicesView> {
  final Map<int, bool> _expandedState = {};

  late User user;

  getUserInfos() async {
    final sessionManager = ref.read(sessionManagerProvider);
    final userInfos =
        await sessionManager.readSecureStorage(SecureStorageKeys.userInfos);
    final user = User.fromString(userInfos!);
    return user;
  }

  @override
  void initState() {
    super.initState();

    getUserInfos().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final coreL10n = context.coreL10n;

    final advicesList = ref.watch(getAdvicesProvider);

    return advicesList.when(
      data: (advices) {
        if (advices != null) {
          final data = <Item>[];

          for (final advice in advices.advices!) {
            data.add(Item(advice: advice));
          }

          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: Text(coreL10n.advices),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    final adviceId = data[index].advice.id;
                    setState(() {
                      _expandedState[adviceId] = isExpanded;
                    });
                  },
                  children: data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.advice.name),
                        );
                      },
                      body: ListTile(
                        title: Text(item.advice.advice1),
                      ),
                      isExpanded: _expandedState[item.advice.id] ?? false,
                    );
                  }).toList(),
                ),
              ),
            ),
            bottomNavigationBar: (user.role == 'role: admin' ||
                    user.role == 'role: botaniste') //TODO à corriger ?
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(coreL10n.addAdvice),
                      onPressed: () async {
                        context.goNamed(AppRoute.addAdvice.name);
                      },
                    ),
                  )
                : null,
          );
        }
        return const Text('No advices found');
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
      error: (error, stackTrace) => Scaffold(
          appBar: AppBar(
            title: Text(coreL10n.advices),
          ),
          body: Center(child: Text('Une erreur est survenue : $error'))),
    );
  }
}

class Item {
  Item({
    required this.advice,
    this.isExpanded = false,
  });

  Advice advice;
  bool isExpanded;
}
