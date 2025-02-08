class ContentModel {
 final String images;
 final  String titile;
 final  String discription;

  ContentModel({required this.images, required this.titile, required this.discription});
}

List<ContentModel> contents =[
  
  ContentModel(
    titile: "data one",
    images: "assets/images/download.png",
    discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  ),
  ContentModel(
    titile: "data two",
    images: "assets/images/download.png",
    discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  ),
  ContentModel(
    titile: "data three",
    images: "assets/images/download.png",
    discription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
  )
  ];
