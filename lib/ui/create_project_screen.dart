import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/app_bar_bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: CColor.whiteColor,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "Open Project",
                            style: TextStyle(
                              color: CColor.whiteColor,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashColor: Colors.transparent,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Type of Project",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  DropdownSearch<String>(
                    items: ["_listPrivileges"],
                    validator: (item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                    itemAsString: (item) => item,
                    onChanged: (value) {},
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Contest Project",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Title",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    // controller: _judulController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Judul harus diisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Silahkan isi bos -FE CARITIM",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Notes",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    // controller: _judulController,
                    maxLines: 5,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Judul harus diisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Silahkan isi bos -FE CARITIM",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Institution",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    // controller: _judulController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Judul harus diisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Silahkan isi bos -FE CARITIM",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Department",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    // controller: _judulController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Judul harus diisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Silahkan isi bos -FE CARITIM",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Position",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    // controller: _judulController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Judul harus diisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Silahkan isi bos -FE CARITIM",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  DropdownSearch<int>(
                    items: [1, 2, 3, 4, 5, 6, 7, 8],
                    validator: (item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                    itemAsString: (item) => item.toString(),
                    onChanged: (value) {},
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Amount of people",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Date of Project",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                    // controller: _judulController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Judul harus diisi";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Silahkan isi bos -FE CARITIM",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xff485696),
          ),
          onPressed: () {},
          child: Text(
            "Publish",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
