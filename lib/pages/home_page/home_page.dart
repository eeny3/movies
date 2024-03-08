import 'package:app_fox_movies/pages/home_page/home_page_store.dart';
import 'package:app_fox_movies/pages/home_page/widgets/moview_preview_card.dart';
import 'package:app_fox_movies/routing/app_router.dart';
import 'package:app_fox_movies/services/connection/connection_status.dart';
import 'package:app_fox_movies/services/debouncing/debouncer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = GetIt.I();
  final ConnectionStatusSingleton connectionStatusSingleton = GetIt.I();
  final debouncer = Debouncer(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff0A0C0B),
      ),
      backgroundColor: const Color(0xff0A0C0B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            16,
            16,
            0,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.router.push(
                      const FavouritesRoute(),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 16,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffDF3D0F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Избранные',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (newVal) {
                  if (newVal.length > 2) {
                    debouncer.run(() {
                      if (connectionStatusSingleton.hasConnection) {
                        store.resetOnNewQuery();
                        store.searchMovies(newVal);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Нет сети. Доступна только страница 'Избранные'",
                            ),
                          ),
                        );
                      }
                    });
                  }
                },
                cursorColor: Colors.white,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: const Color(0xff545454),
                  focusColor: const Color(0xff545454),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  hintText: 'Фильмы',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Observer(builder: (context) {
                  if (store.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: store.movies.length + 1,
                      itemBuilder: (context, index) {
                        if (index == store.movies.length) {
                          store.searchMovies(store.currentQuery);
                          if (store.hasMore) {
                            return const SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: LoadingIndicator(
                                  colors: [Colors.white],
                                  indicatorType: Indicator.ballPulse,
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        } else {
                          return GestureDetector(
                            onTap: () {
                              context.router.push(
                                MovieInfoRoute(
                                  movieId: store.movies[index].id,
                                  movieIndex: index,
                                ),
                              );
                            },
                            child: MoviePreviewCard(
                              previewUrl: store.movies[index].poster.previewUrl,
                              name: store.movies[index].name,
                              rating: store.movies[index].rating.kp,
                              shortDescription:
                                  store.movies[index].shortDescription,
                              previewBytes: store.movies[index].posterBytes,
                            ),
                          );
                        }
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
