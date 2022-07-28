import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_list_riverpod/model/movie_state.dart';
import 'package:flutter_list_riverpod/view_model/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  UserListScreenState createState() => UserListScreenState();
}

class UserListScreenState extends ConsumerState<UserListScreen> {
  late List<Movie> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final jsonNotifier = ref.read(userProvider.notifier);
    jsonNotifier.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    list = ref.watch(userProvider).users;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
      ),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            Movie movie = list[index];
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    movie.posterUrl,
                    height: 70,
                    width: 70,
                    errorBuilder: ((context, exception, stackTrace) {
                      return Image.network(
                          'https://png.pngtree.com/element_our/20190528/ourmid/pngtree-error-icon-image_1127796.jpg',
                          height: 70,
                          width: 70);
                    }),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${movie.title}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black45
                          ),
                        ),
                        Text(
                          'Director: ${movie.director}',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),
                        ),
                        Text(
                          'Year: ${movie.year}',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black45
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            );
          }
      ),
    );
  }

}