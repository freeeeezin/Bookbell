import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:me/screen/community/club_detail/club_detail.dart';

class GetCommunityList extends StatefulWidget {
  final String ? categoryValued;
  final String? textValued;
  const GetCommunityList( {super.key, this.categoryValued, this.textValued, });

  @override
  State<GetCommunityList> createState() => _GetCommunityListState();


}

class _GetCommunityListState extends State<GetCommunityList> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final base = FirebaseFirestore.instance.collection('community');
    return StreamBuilder<QuerySnapshot>(
      stream: base.
          where("category",isEqualTo: widget.categoryValued).
          //
          // where("title",isGreaterThanOrEqualTo:  widget.textValued).
          // where("title",isLessThanOrEqualTo:  widget.textValued ).


      snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Icon(CupertinoIcons.book,size: 100,
          color: Colors.grey[300]
          ));
        }
        var documents = snapshot.data!.docs;

        return ListView.separated(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            var data = documents[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data['title'] ?? 'No Title'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                Text(data['creator'] ?? 'No Content'),
                Text(data['category'])
              ] ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                    ClubDetail(clubIndex: index, club: data)
                    ));
              },
            );
          },  separatorBuilder: (context,index) => Divider(
                 height: 20,
                indent: 16,
                endIndent: 16,
                color: Colors.grey,
              ),
        );
      },
    );

  }
}
