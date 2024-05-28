import 'package:arosa_je/core/api_client_exception.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/modules/auth/login/notifier.dart';
import 'package:arosa_je/modules/home/view.dart';
import 'package:arosa_je/modules/plants/add_plants/notifier.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlantView extends ConsumerStatefulWidget {
  const AddPlantView({
    super.key,
    required this.picture,
  });

  final XFile picture;

  @override
  ConsumerState<AddPlantView> createState() => _AddPlantViewState();
}

class _AddPlantViewState extends ConsumerState<AddPlantView> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController _name;
  late TextEditingController _dateStart;
  late TextEditingController _dateEnd;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    _name = TextEditingController();
    _dateStart = TextEditingController();
    _dateEnd = TextEditingController();
    _descriptionController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _dateStart.dispose();
    _dateEnd.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coreL10n = context.coreL10n;
    ref.watch(addPlantsFormProvider);

    ref.listen(addPlantsProvider, (_, next) {
      next.when(
        data: (isAuthenticated) {
          if (isAuthenticated) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const HomeView();
            }));
            ref.read(loginFormProvider.notifier).setLoading(false);
          }
        },
        error: (error, stackTrace) {
          printDebug(error.toString());
          if (error is ApiClientException) {}
          ref.read(loginFormProvider.notifier).setLoading(false);
        },
        loading: () {
          ref.read(loginFormProvider.notifier).setLoading(true);
        },
      );
    });

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.picture.name),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          tint: Colors.black,
                          filled: true,
                          label: coreL10n.plantName,
                          borderColor: Colors.black,
                          radius: 10,
                          controller: _name,
                          onChanged: (value) {
                            ref
                                .read(addPlantsFormProvider.notifier)
                                .setName(value);
                          },
                        ),
                        const AppGap.small(),
                        AppTextFormFieldDate(
                          filled: true,
                          label: coreL10n.dateStart,
                          hint: coreL10n.dateStartSentence,
                          tint: Colors.black,
                          borderColor: Colors.black,
                          radius: 10,
                          controller: _dateStart,
                          onChanged: (value) {
                            ref
                                .read(addPlantsFormProvider.notifier)
                                .setBeginAt(value);
                          },
                        ),
                        const AppGap.small(),
                        AppTextFormFieldDate(
                          filled: true,
                          label: coreL10n.dateEnd,
                          hint: coreL10n.dateEndSentence,
                          tint: Colors.black,
                          borderColor: Colors.black,
                          radius: 10,
                          controller: _dateEnd,
                          onChanged: (value) {
                            ref
                                .read(addPlantsFormProvider.notifier)
                                .setEndAt(value);
                          },
                        ),
                        const AppGap.small(),
                        AppTextFormField(
                          label: coreL10n.description,
                          hint: coreL10n.descriptionSentence,
                          borderColor: Colors.black,
                          controller: _descriptionController,
                          onChanged: (value) {
                            ref
                                .read(addPlantsFormProvider.notifier)
                                .setDescription(value);
                          },
                          maxLines: 3,
                        ),
                        const AppGap.xs(),
                        FilledButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ref.read(addPlantsProvider.notifier).addPlants(
                                    _name.text,
                                    _dateStart.text,
                                    _dateEnd.text,
                                    _descriptionController.text,
                                    widget.picture,
                                  );
                              //TODO à corriger mais ça me casse les couilles fort
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const HomeView();
                              }));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.green),
                            foregroundColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text(
                            coreL10n.registerPlant,
                          ),
                        ),
                        if (ref.read(addPlantsProvider).isLoading)
                          const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
