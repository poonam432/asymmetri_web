import 'package:asymmetri_web/widgets/dropdown.dart';
import 'package:asymmetri_web/widgets/gradient_progress.dart';
import 'package:asymmetri_web/widgets/reverse_toggle_widget.dart';
import 'package:asymmetri_web/widgets/slider_widget.dart';
import 'package:asymmetri_web/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
   TextEditingController totalItemsController = TextEditingController();
   TextEditingController itemsInLineController = TextEditingController();
  int totalItems = 0;
  int itemsInLine = 0;
  @override
  void initState() {
    super.initState();
    totalItems = 1;
    itemsInLine = 1;
    totalItemsController.text = '';
    itemsInLineController.text = '';
    totalItemsController.addListener(() {
      int value = int.tryParse(totalItemsController.text) ?? 1;
      if (value > 30) {
        value = 30;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Maximum total items allowed is 30")),
        );
      }

      setState(() {
        totalItems = value;
      });

    });

    itemsInLineController.addListener(() {
      int value = int.tryParse(itemsInLineController.text) ?? 1;

      if (value > 15) {
        value = 15;
        showSnackBar('Maximum limit of items in line is 15.');
      } else if (value < 1) {
        value = 1;
      }

      if (value > totalItems) {
        totalItemsController.text = value.toString();
        totalItems = value;
      }

      setState(() {
        itemsInLine = value;
      });
    });


  }
   void showSnackBar(String message) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: Text(message),
         duration: const Duration(seconds: 2),
       ),
     );
   }
  @override
  void dispose() {
    totalItemsController.dispose();
    itemsInLineController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/asymmetri.jpg',
                  width: 280,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const DropdownWidget(),
              const SizedBox(height: 26),
              const SliderWidget(),
              const SizedBox(height: 30),
              TextFieldWidget(
                label: 'Total Items',
                controller: totalItemsController,
              ),
              TextFieldWidget(
                label: 'Items in Line',
                controller: itemsInLineController,
              ),
              const ReverseToggleWidget(),
              const SizedBox(height: 40),
              totalItems > 0
                  ? generateWrappedBars(totalItems, itemsInLine)
                  : Container(),            ],
          ),
        ),
      ),
    );
  }

  Widget generateWrappedBars(int total, int perRow) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,alignment: WrapAlignment.center,
      children: List.generate(total, (index) {
        return SizedBox(
          width: (MediaQuery.of(Get.context!).size.width - 100) / perRow,  // Adjust width dynamically based on items per row
          child: const GradientProgressWidget(),
        );
      }),
    );
  }
  }
