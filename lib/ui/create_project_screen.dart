import 'package:cari_tim_flutter/util/c_color.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cari_tim_flutter/model/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:cari_tim_flutter/ui/home_screen.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController startDateController = new TextEditingController();
  TextEditingController endDateController = new TextEditingController();
  TextEditingController positionController = new TextEditingController();
  TextEditingController jobDescriptionController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  String message = '';

  String typeValue = '';

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
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                    items: [
                      "Bussines project",
                      "Competition Project",
                      "IT Project",
                      "Other Project"
                    ],
                    validator: (item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                    itemAsString: (item) => item.toString(),
                    onChanged: (value) {
                      typeValue = value.toString();
                    },
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
                      hintText: "Business Project, Competition Project, etc",
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
                      text: "Project Title",
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
                    controller: titleController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Required Field";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "My Business Project",
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
                      text: "Project Description",
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
                    controller: descriptionController,
                    maxLines: 5,
                    // validator: (value) {
                    //   if (value!.trim().isEmpty) {
                    //     return "Judul harus diisi";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      hintText:
                          "I am starting a new business and i am looking for a web developer to build my business website",
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
                    controller: positionController,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Required Field";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Web Developer",
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
                      text: "Job Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "",
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
                    controller: jobDescriptionController,
                    // validator: (value) {
                    //   if (value!.trim().isEmpty) {
                    //     return "Required Field";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      hintText: "Build an e-commerce web",
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
                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Required Field";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "2",
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
                      text: "Project Start Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "",
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
                    controller: startDateController,
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      startDateController.text = DateFormat.yMd().format(date!);
                    },
                    // validator: (value) {
                    //   if (value!.trim().isEmpty) {
                    //     return "Required field";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      hintText: DateFormat.yMd().format(DateTime.now()),
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
                  SizedBox(
                    height: 13,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Project End Date",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff515151),
                      ),
                      children: [
                        TextSpan(
                          text: "",
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
                    controller: endDateController,
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now().add(Duration(days: 30)),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      endDateController.text = DateFormat.yMd().format(date!);
                    },
                    // validator: (value) {
                    //   if (value!.trim().isEmpty) {
                    //     return "Required field";
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      hintText: DateFormat.yMd()
                          .format(DateTime.now().add(Duration(days: 30))),
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
          onPressed: () async {
            var title = titleController.text;
            var description = descriptionController.text;
            var start_date = startDateController.text;
            var end_date = endDateController.text;
            var userId = '619915eb098fd884510a8f0a';
            var position = positionController.text;
            var jobDescription = jobDescriptionController.text;
            var amount = amountController.text;
            var token =
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjYxOTkxNWViMDk4ZmQ4ODQ1MTBhOGYwYSIsImZpcnN0X25hbWUiOiJiYWdhcyIsInN1cm5hbWUiOiJmaXJkYXVzIiwiZW1haWwiOiJiYWdhcy5rdGJmZmhAZ21haWwuY29tIiwiZW1haWxfY29uZmlybWVkIjp0cnVlfSwiaWF0IjoxNjM4Nzk2NjIxLCJleHAiOjE2NDEzODg2MjF9.SNRCX714Rgr8RqFZgK5fN3PRwH1A5ubwFVgM3AMnSvc';
            setState(() {
              message = 'Please Wait...';
            });
            var rsp = await createVacancy(
                title,
                description,
                typeValue,
                start_date,
                end_date,
                userId,
                position,
                jobDescription,
                amount,
                token);
            print(rsp);
            if (rsp.containsKey('data')) {
              setState(() {
                message = 'Project Published';
              });
              if (rsp['data'] != null) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Project Published"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new TextButton(
                          child: new Text("Close"),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Open Project Failed"),
                    content: new Text(
                        "Something went wrong, please try again later!"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new TextButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
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
