import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? myController;

  const CustomAppBar({
    super.key,
    required this.titleAppBar,
    required this.onPressedSearch,
    this.onChanged,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: myController,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: onPressedSearch,
                      icon: Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: AppColors.primaryColor,
                      )),
                  hintText: titleAppBar,
                  hintStyle: const TextStyle(
                      fontSize: 16, ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  fillColor: Colors.grey[200],
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }
}
