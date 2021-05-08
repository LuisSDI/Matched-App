import 'package:flutter/material.dart';
import 'package:matched_app/ui_resources/custom_colors.dart';
import 'package:matched_app/ui_resources/icons/dorm_icon_icons.dart';

class SliderModel{
  String imagePath;
  String title;
  String desc;
  Icon icon;

  SliderModel({ @required this.title, @required this.desc, @required this.icon});


  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  void setIcon(Icon getIcon){
    icon = getIcon;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

  Icon getIcon(){
    return icon;
  }

}

List<SliderModel> getSlides(){

  List <SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel( desc: '', title: '',icon: null);

  //1
  sliderModel.setTitle("Explore");
  sliderModel.setDesc("""Discover all that CUHK
 SZ colleges has to offer
 and answer all your questions""".trim());
  sliderModel.setIcon(
      Icon(DormIcon.noun_dormitory_2125386_1,
    color: mainColor,
    size: 22,));
  slides.add(sliderModel);


  sliderModel = new SliderModel(desc: '', title: '',icon: null);

  //2
  sliderModel.setTitle("Who you are?");
  sliderModel.setDesc("""Learn about the different
kinds of personalities and 
find out which is yours""".trim());
  sliderModel.setIcon(
      Icon(DormIcon.noun_mind_3733702_1,
        color: mainColor,
        size: 300,
      ));
  slides.add(sliderModel);

  sliderModel = new SliderModel(desc: "", title: '',icon: null);

  //3
  sliderModel.setTitle("Personality Clubs");
  sliderModel.setDesc("""Talk and meet with
people similar to you
to find more about yourself""".trim());
  sliderModel.setIcon(
      Icon(DormIcon.noun_chat_3835318_1,
        color: mainColor,
        size: 22,));
  slides.add(sliderModel);

  sliderModel = new SliderModel(title: '', desc: '', icon: null);

  //4
  sliderModel.setTitle("Dreammate");
  sliderModel.setDesc("""Find your perfect roommates
for the next four years using 
our matching system""".trim());
  sliderModel.setIcon(
      Icon(DormIcon.noun_form_3743093_1,
        color: mainColor,
        size: 22,));
  slides.add(sliderModel);

  sliderModel = new SliderModel(title: '', desc: '', icon: null);

  return slides;
}