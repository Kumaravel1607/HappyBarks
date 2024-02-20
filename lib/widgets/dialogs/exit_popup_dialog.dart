import 'package:flutter/material.dart';

Future<bool> showExitPopup(BuildContext context, double width) async {
  return await showDialog(
          context: context,
          builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    height: 150,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Exit',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.brown,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Do you want to exit?',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(false),
                              child: Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.red,
                                  ),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )),
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green,
                                  ),
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: (width / 2) - 80,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Icon(
                        Icons.info,
                        size: 80,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ]),
              )) ??
      false;
}
