import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Evaluation extends StatefulWidget {
  String proId;
  Evaluation(String proId) {
    this.proId = proId;
  }
  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  @override
  void initState() {
    proId = widget.proId;
    getRating();
    super.initState();
  }

  String proId;
  QuerySnapshot proRating;
  getRating() async {
    await Firestore.instance
        .collection('Users')
        .where('UserID', isEqualTo: proId)
        .getDocuments()
        .then((value) {
      setState(() {
        proRating = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rating'),
          centerTitle: true,
        ),
        body: evaluationPro(context));
  }

  Widget evaluationPro(BuildContext context) {
    if (proRating == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          itemCount: proRating.documents.length,
          itemBuilder: (context, i) {
            int like = proRating.documents[i].data['Like'];
            int dislike = proRating.documents[i].data['Dislike'];
            return Center(
              child: Container(
                margin: EdgeInsets.only(top: 200),
                height: 200,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0.4,
                        offset: Offset(1, 1))
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        'How was ' +
                            proRating.documents[i].data['Full name'] +
                            "'s service?",
                        style: TextStyle(
                            color: Color(0xff6e475b),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.thumb_up,
                                color: Color(0xff6e475b),
                                size: 60,
                              ),
                              onPressed: () {
                                like++;
                                Firestore.instance
                                    .collection('Users')
                                    .document(proRating.documents[i].documentID)
                                    .updateData({'Like': like});
                                Navigator.of(context).pushNamed('UserOrders');
                                // Navigator.pop(context);
                              }),
                          SizedBox(width: 50),
                          IconButton(
                              icon: Icon(
                                Icons.thumb_down,
                                color: Colors.grey,
                                size: 60,
                              ),
                              onPressed: () {
                                dislike++;
                                Firestore.instance
                                    .collection('Users')
                                    .document(proRating.documents[i].documentID)
                                    .updateData({'Dislike': dislike});
                                Navigator.of(context).pushNamed('UserOrders');
                                //Navigator.pop(context);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
  }
}
