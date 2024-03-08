import 'package:app_fox_movies/pages/favourites_page/favourites_page_store.dart';
import 'package:app_fox_movies/pages/home_page/widgets/moview_preview_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final FavouritesPageStore store = GetIt.I();

  @override
  void initState() {
    store.getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => context.router.pop(),
        ),
        title: const Text(
          'Избранные',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
          child: Observer(
            builder: (context) {
              if (store.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: store.movies.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MoviePreviewCard(
                          previewUrl: store.movies[index].poster.previewUrl,
                          name: store.movies[index].name,
                          rating: store.movies[index].rating.kp,
                          shortDescription:
                              store.movies[index].shortDescription,
                          previewBytes: store.movies[index].posterBytes,
                        ),
                        GestureDetector(
                          onTap: () {
                            store.deleteFavourite(index);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              right: 16,
                            ),
                            child: Icon(
                              Icons.delete_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
