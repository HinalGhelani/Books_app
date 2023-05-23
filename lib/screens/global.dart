import 'dart:io';

import 'package:flutter/material.dart';

class GlobalVar {

  static File? image;
  static final List newBooks = [
    {
      'image':
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/41DNiblvwTL._SX331_BO1,204,203,200_.jpg",
      'author': "Vivek Ramaswamy",
      // 'bookName' : "Nation of Victims",
      // 'description' : "Now a National Bestseller! The New York Times bestselling author of Woke Inc., who is now a 2024 presidential candidate, makes the case that the"
      //     " essence of true American identity is to pursue excellence unapologetically and reject victimhood culture. Hardship is now equated with victimhood.",
      // 'language' : "English",
      // 'pages' : "400"
    },
    {
      'image':
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/91mOn40tQkL.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/716t1ydXnhL.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/41OEn6N3uPL._SX326_BO1,204,203,200_.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/41mOf32ZG+L._SX312_BO1,204,203,200_.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://d28hgpri8am2if.cloudfront.net/book_images/cvr9781476753188/ugly-love-9781476753188_lg.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://i0.wp.com/blog.scribd.com/wp-content/uploads/2022/02/thumbnail_book_380x484_it-ends-with-us@2x.jpg?fit=760%2C968&ssl=1",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfMkR2L1e2mpVFRlVOiTOHx86gwUtdHXsbqvh-cCaBcQ&usqp=CAU&ec=48600112",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://offtheshelf.b-cdn.net/app/uploads/2015/04/ordinary-grace.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj-OY4qZiToFKw_cqYDAlGeljFgsvJQB6bFjGO2U03e22sSQD1H_AlZ17vyAQG6QTyx236g5JstBE&usqp=CAU&ec=48600112",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/41SQhD8nUiL._SX325_BO1,204,203,200_.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://images-na.ssl-images-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61XAkbolRLL._AC_UL600_SR600,600_.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51bxIHH%2BR4L._SX342_SY445_QL70_ML2_.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51RWzpMasQL.jpg",
      'author': "Hinal Ghelani",
    },
    {
      'image':
      "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/41LCrqCPPNL.jpg",
      'author': "Hinal Ghelani",
    },
  ];
}
