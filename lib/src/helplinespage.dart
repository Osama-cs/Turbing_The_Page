import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelplinesPage extends StatefulWidget {
  const HelplinesPage({Key? key}) : super(key: key);

  @override
  _HelplinesPageState createState() => _HelplinesPageState();
}

class _HelplinesPageState extends State<HelplinesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          title: const Text(
            "Mental Health Helplines",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.lightBlueAccent.shade100,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Here are some mental health helplines that you can call if you ever feel down about yourself and need some extra help. (UK numbers only).",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              BulletedList(
                listItems: [
                  "Samaritans. This is a more general mental health helpline that you can contact 24 hours, 365 days of a year. Number: 116 123.",
                  "National Suicide Prevention Helpline UK. This is a helpline that offer support if anyone is dealing with suicidal thoughts, "
                      "They are also open 24/7. Number: 0800 689 5652.",
                  "The Mix. If you're under 25, you can call Mix to get some assistance, they are open between 3pm - 12am. Number:  0808 808 4994.",
                  "Switchboard. This is for anyone that is apart of the LGBTQIA+ community, all phone operators identify as LGBTQIA+ as well. They are open between "
                      "10am - 10pm. Number: 0300 330 0630.",
                ],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                bulletColor: Colors.black,
                listOrder: ListOrder.ordered,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hopefully these numbers help you out in anyway <3",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
