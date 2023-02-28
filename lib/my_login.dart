import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_call/call_page.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final TextEditingController userIdController = TextEditingController();
  final focus = FocusNode();
  final focus1 = FocusNode();
  String? name;
  String userId = "";

  saveDatas(String userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.setString("userId", userIdController.text);
    setState(() {
      userId = userIdController.text;
    });
  }

  getDatas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString("userId")!;
      userIdController.text = userId;
    });
  }

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void call() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Callpage(
            callID: "1",
            userName: name!,
            userId: userId,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        focus.unfocus();
        focus1.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Video Call",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  focusNode: focus,
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng không để trống !!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Người cần gọi",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.pink,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.call,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  focusNode: focus1,
                  controller: userIdController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng không để trống !!';
                    }
                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    labelText: "ID của tôi",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.pink,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.perm_identity,
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      saveDatas(userId);
                      call();
                    }
                  },
                  child: const Text(
                    "Call",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "nguy3ntanduc",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
