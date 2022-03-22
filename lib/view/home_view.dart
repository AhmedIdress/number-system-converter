import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_system/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Number system',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: _controller,
                keyboardType: controller.keyType,
                decoration: InputDecoration(
                  label: Text(controller.dropDownValue1 + ' number'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                      value: controller.dropDownValue1,
                      hint: const Center(child: Text('From')),
                      items: controller.convertTypesMenuItem,
                      onChanged: (String? value) {
                        controller.changeDropDownButton1(value!);
                      }),
                  const Icon(Icons.arrow_forward),
                  DropdownButton(
                      value: controller.dropDownValue2,
                      hint: const Center(child: Text('To')),
                      items: controller.convertTypesMenuItem,
                      onChanged: (String? value) {
                        controller.changeDropDownButton2(value!);
                      }),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Positioned(
                      child: Container(
                          child: Text(controller.dropDownValue2 + ' result'),
                          color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      top: 2,
                      left: 15,
                    ),
                    Center(child: Text(controller.convertResult)),
                  ],
                ),
              ),
              SizedBox(
                width: 180,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    controller.convert(_controller.text);
                  },
                  child: Text(
                    'convert'.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
