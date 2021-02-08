import 'package:flutter/material.dart';
import 'package:github_repo_search/models/results.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ResultsScrollView extends StatelessWidget {
  final Results result;
  final String query;

  String getDate(String date) {
    DateFormat dateFormat = DateFormat.MMMMd('ru');
    final parsed = DateTime.parse(date);
    return dateFormat.format(parsed);
  }

  ResultsScrollView(this.result, this.query);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Container(
            margin: EdgeInsets.fromLTRB(16.0, 19.0, 16.0, 8.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('ПО ЗАПРОСУ: '),
                Text('${query.toUpperCase()}',
                    style: TextStyle(color: Colors.blue))
              ]),
              SizedBox(
                height: 8.0,
              ),
              Text('НАЙДЕНО: ${result.total_count}')
            ])),
      ),
      SliverPadding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = result.items[index];
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 12.0, 16.0, 0.0),
                        decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.none),
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 7.0),
                              child: Icon(
                                Icons.star_border,
                                color: Colors.white,
                                size: 18.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(2.0, 6.0, 7.0, 6.0),
                              child: Text(item.stargazers_count.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 0.0),
                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(item.owner.avatar_url)),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        item.owner.login,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0, bottom: 12.0),
                    child: Divider(
                      indent: 16.0,
                      endIndent: 16.0,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
                        child: Text(
                          'Обновлено: ',
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                          child: Text(getDate(item.updated_at),
                              style: TextStyle(fontSize: 16.0)))
                    ],
                  )
                ],
              ),
            );
          }, childCount: result.items.length),
        ),
      )
    ]);
  }
}
