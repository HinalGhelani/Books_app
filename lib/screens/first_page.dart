import 'dart:io';
import 'package:firebase_books_app/Helper/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'global.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  getImage() async {
    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.camera);
    if (pic != null) {
      setState(() {
        GlobalVar.image = File(pic.path);
      });
    }
  }

  String imageURL = '';

  List data = [];

  Map<Object, Object> editBooks = {};

  String? newName;

  final GlobalKey<FormState> booksKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FireStoreHelper.fireStoreHelper.getBooks(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              data = snapshot.data!.docs;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          height: 127,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                          ),
                          // child: Image.network(
                          //   data[i]['image'],
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Text(
                          data[i]['name'],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("ADD"),
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  content: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      key: booksKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: const Alignment(0.85, 0.7),
                            children: [
                              (GlobalVar.image == null)
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.grey.shade500,
                                      child: const Center(
                                        child: Text("ADD"),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.grey.shade500,
                                      backgroundImage:
                                          FileImage(GlobalVar.image!),
                                    ),
                              InkWell(
                                onTap: () async {
                                  setState(
                                    () {
                                      getImage();
                                    },
                                  );
                                  if (GlobalVar.image == null) return;
                                  String uniqueFieldName = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();

                                  Reference referenceRoot =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDirImages =
                                      referenceRoot.child('images');

                                  Reference referenceImageUpload =
                                      referenceDirImages.child(uniqueFieldName);

                                  try {
                                    await referenceImageUpload
                                        .putFile(File(GlobalVar.image!.path));
                                    imageURL = await referenceImageUpload
                                        .getDownloadURL();
                                  } catch (error) {}

                                  print(
                                      "=====================================================");
                                  print(GlobalVar.image!.path);
                                  print(
                                      "=====================================================");
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 55,
                            child: TextFormField(
                              controller: nameController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "please enter this name";
                                }
                              },
                              onSaved: (val) {
                                newName = val;
                              },
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Author Name",
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Ink(
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () async {
                                  if (booksKey.currentState!.validate()) {
                                    booksKey.currentState!.save();

                                    await FireStoreHelper.fireStoreHelper
                                        .addBooks(
                                      name: newName!,
                                    );

                                    Navigator.of(context).pop();

                                    nameController.clear();

                                    setState(() {
                                      newName = null;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, right: 15, left: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black),
                                  child: const Text(
                                    "ADD",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
