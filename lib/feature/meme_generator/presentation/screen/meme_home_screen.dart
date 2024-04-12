import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_code/feature/meme_generator/presentation/cubit/meme_cubit.dart';
import 'package:interview_code/feature/meme_generator/presentation/cubit/meme_state.dart';

class MemeHomeScreen extends StatefulWidget {
  const MemeHomeScreen({super.key});

  @override
  State<MemeHomeScreen> createState() => _MemeHomeScreenState();
}

class _MemeHomeScreenState extends State<MemeHomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meme App"),
          centerTitle: true,
          actions: [
            Switch(
              value: AdaptiveTheme.of(context).mode.isDark,
              onChanged: (value) {
                if (value) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: BlocBuilder<MemeCubit, MemeState>(builder: (context, state) {
          if (state is MemeInitial) {
            return const SizedBox();
          } else if (state is MemeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MemeLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (controller.text == "") {
                            context.read<MemeCubit>().getAllGiphyData();
                          } else {
                            context
                                .read<MemeCubit>()
                                .getGiphyBySearch(controller.text);
                          }
                        },
                        icon: const Icon(Icons.search),
                      ),
                      hintText: 'Search',
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ignore: prefer_is_empty
                  (state.model.data?.length == 0)
                      ? const Expanded(
                          child: Center(child: Text("No Matched data Found")))
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: .8,
                            ),
                            itemCount: state.model.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CachedNetworkImage(
                                  imageUrl: state.model.data?[index].images
                                          ?.fixedHeight?.url ??
                                      "",
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          } else if (state is MemeError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox();
          }
        })

        // Column(
        //   children: [],
        // ),
        );
  }
}
