import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  List <String> Images ; 
  List <String> ?Titles ; 
  List <String>? Position ; 
 Grid({ Key? key , required this.Images , this.Titles , this.Position}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing:  12, 
                    mainAxisSpacing: 12 , 
                    mainAxisExtent:180
                  ),
                  itemCount: Images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(3),
                          //                       decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(25),
                          //   border: Border.all(width: 3, color: Colors.white),
                          // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                        
                          Expanded(
                            flex: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(Images[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Titles != null ? Expanded(
                            flex: 1,
                            child: Text(
                              Titles![index],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500 , 
                                color: Colors.white
                              ),
                            ),
                          ): SizedBox(height: 0,),

                           Position != null ? Expanded(
                            flex: 1,
                            child: Text(
                              Position![index],
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white
                              ),
                            ),
                          ): SizedBox(height: 0,),
                          
                        ],
                      ),
                    );
                  },
                );
  }
}