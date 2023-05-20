import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Support",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff06152E),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xFF06152E),
        ),
        child: Stack(
          children: [
            Container(
              height: 352,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors(),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 72,
                    ),
                    const Text(
                      "Hi,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Please fill this form, our team will out to you soon",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff90DCE2),
                            Color(0xff88DEE3),
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 24,
                          top: 28,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Full Name",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "E-mail",
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 28),
                            Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: gradientColors(),
                                  ),
                                ),
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(
                                      top: 6, bottom: 6, left: 12, right: 12),
                                  child: TextFormField(
                                    controller: _messageController,
                                    maxLines: 8,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Your Message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          if (_nameController.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text(
                                "Name cannot be empty",
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return;
                          }
                          if (_emailController.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text(
                                "Email cannot be empty",
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return;
                          }
                          if (_messageController.text.isEmpty) {
                            const snackBar = SnackBar(
                              content: Text(
                                "Message cannot be empty",
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            return;
                          }

                          var collection = FirebaseFirestore.instance
                              .collection('support-tickets');
                          Map<String, String> data = {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "message": _messageController.text
                          };

                          collection.add(data).then((_) async {
                            _nameController.clear();
                            _emailController.clear();
                            _messageController.clear();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            right: 28,
                            left: 28,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              32,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: gradientColors(),
                            ),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Color> gradientColors() {
    return [
      const Color(0xff90DCE2),
      const Color(0xff88DEE3),
      const Color(0xffC0CFD7),
      const Color(0xffD5C9D4),
      const Color(0xffEFC3CE),
      const Color(0xffF4C7BB),
      const Color(0xffF5C8B9),
      const Color(0xffFCD48B),
    ];
  }
}
