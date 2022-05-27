import 'package:flutter/material.dart';
import 'package:number_system/logic/costants.dart';
import 'package:number_system/logic/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();
  String isSelectedFrom = Constants.convertTypes[0];
  String isSelectedTo = Constants.convertTypes[1];
  String result = '';
  List<String> fromDropDown = Constants.convertTypes;
  List<String?> toDropDown=[];

  @override
  void initState() {
    toDropDown.clear();
   toDropDown = Constants.convertTypes.map((e) {
     if (e != isSelectedFrom) {
       return e;
     }
   }).toList();
   toDropDown.removeAt(0);
   super.initState();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: _controller,
              keyboardType: isSelectedFrom == 'Hexadecimal'
                  ? TextInputType.text
                  : TextInputType.number,
              decoration: InputDecoration(
                label: Text(isSelectedFrom + ' number'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton(
                    value: isSelectedFrom,
                    items: fromDropDown
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String? selectedItem) {
                      int itemIndex=0;
                      int indexCount=0;
                      if (selectedItem is String) {
                        setState(() {
                          isSelectedFrom = selectedItem;
                          toDropDown.clear();
                          toDropDown = Constants.convertTypes.map((e) {
                            if (e != selectedItem) {
                              indexCount++;
                              return e;
                            }
                            else{
                              itemIndex=indexCount;
                            }
                          }).toList();
                          toDropDown.removeAt(itemIndex);
                          isSelectedTo = toDropDown[0]!;
                        });
                      }
                    }),
                const Icon(Icons.arrow_forward),
                DropdownButton(
                  value: isSelectedTo,
                    items: toDropDown
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e??'null'),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (String? selectedItem){
                      isSelectedTo = selectedItem!;
                      setState(() {

                      });
                    },),
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
                      child: Text(isSelectedTo + ' result'),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    top: 2,
                    left: 15,
                  ),
                  Center(child: Text(result)),
                ],
              ),
            ),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  result = HomeController.convert(
                      _controller.text, isSelectedFrom + isSelectedTo);
                  setState(() {});
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
    );
  }
}
