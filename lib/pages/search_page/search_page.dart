import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/controllers/search_page_controller.dart';

import '../../styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<SearchPageController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Pesquisa',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: _controller.onChanged,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: lavenderBlush,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  label: Text('Ex.: "Márcio Silva"'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _controller.cachedDoctors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: SizedBox(
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(13)),
                                height: 60,
                                width: 43,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: _controller.cachedDoctors[index]
                                              .imageUrl.value ==
                                          ''
                                      ? SizedBox()
                                      : Image.network(_controller
                                          .cachedDoctors[index].imageUrl.value),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                '${_controller.cachedDoctors[index].name} ${_controller.cachedDoctors[index].lastName}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Expanded(child: SizedBox()),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(''),
                                  Text(''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}