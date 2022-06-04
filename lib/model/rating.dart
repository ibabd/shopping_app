class Rating{
  double ?rate;
  int ?count;

  Rating({required this.rate,required this.count});

  Rating.fromJson(Map<String,dynamic>json){
    //take map and translate to object
    rate=json['rate'].toDouble();
    count=json['count'];
  }

  //take object and translate to json ||map
  //this used when send data to api throw post ||send data to database

  Map<String,dynamic>toJson(){
    return {
      'rate':rate,
      'count':count,
    };
  }


}