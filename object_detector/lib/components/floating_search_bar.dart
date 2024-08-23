import 'package:flutter/material.dart';
import 'package:object_detector/constants/colors.dart';
import 'package:object_detector/constants/fonts.dart';

class floatingSearchBar extends StatefulWidget {
  const floatingSearchBar({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _floatingSearchBarState();
  }
}

class _floatingSearchBarState extends State<floatingSearchBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: searchbarText,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: lightmode_searchbar_color,
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
        ),
      ),
    );
  }
} 

// Widget buildFloatingSearchBar() {
//   // final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//   return FloatingSearchBar(
//     accentColor: lightmode_searchbar_color,
//     hint: 'Search...',
//     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//     transitionDuration: const Duration(milliseconds: 800),
//     transitionCurve: Curves.easeInOut,
//     physics: const BouncingScrollPhysics(),
//     // axisAlignment: isPortrait ? 0.0 : -1.0,
//     axisAlignment: 0.0,
//     openAxisAlignment: 0.0,
//     // width: isPortrait ? 600 : 500,
//     width: 600,
//     debounceDelay: const Duration(milliseconds: 500),
//     onQueryChanged: (query) {
//       // Call your model, bloc, controller here.
//     },
//     // Specify a custom transition to be used for
//     // animating between opened and closed stated.
//     transition: CircularFloatingSearchBarTransition(),
//     actions: [
//       FloatingSearchBarAction(
//         showIfOpened: false,
//         child: CircularButton(
//           icon: const Icon(Icons.place),
//           onPressed: () {},
//         ),
//       ),
//       FloatingSearchBarAction.searchToClear(
//         showIfClosed: false,
//       ),
//     ],
//     builder: (context, transition) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Material(
//           color: Colors.white,
//           elevation: 4.0,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: Colors.accents.map((color) {
//               return Container(height: 112, color: color);
//             }).toList(),
//           ),
//         ),
//       );
//     },
//   );
// }
