import 'package:get/get.dart';

class ReviewsController extends GetxController {
var sortFilter = 'Latest'.obs;
  final sortOptions = ['Latest', 'Oldest', 'Highest Rating', 'Lowest Rating'];
  
  // Featured dishes data
  final featuredDishes = [
    {
      'name': 'Chicken Curry Special with Cucumber',
      'category': 'MAIN COURSE',
      'image': 'assets/chicken_curry.jpg',
      'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
      'reviewer': 'Roberto Jr.',
      'reviewerRole': 'Graphic Designer',
      'rating': 4.5,
      'avatar': 'assets/roberto.jpg'
    },
    {
      'name': 'Spaghetti Special with Barbeque',
      'category': 'MAIN COURSE',
      'image': 'assets/spaghetti.jpg',
      'description': 'Fast, professional and friendly service, we ordered the six course tasting menu and every dish was spectacular, so grateful and wonderful experience!',
      'reviewer': 'Lord Ned Stark',
      'reviewerRole': 'UI Designer',
      'rating': 4.5,
      'avatar': 'assets/ned.jpg'
    },
    {
      'name': 'Pizza Mozzarella with Spicy Cream',
      'category': 'MAIN COURSE',
      'image': 'assets/pizza.jpg',
      'description': 'Fast, professional and friendly service, we ordered the six course tasting menu and every dish was spectacular, so grateful and wonderful experience!',
      'reviewer': 'Fredy Mercury',
      'reviewerRole': 'Jr. Programmer',
      'rating': 4.5,
      'avatar': 'assets/fredy.jpg'
    },
  ].obs;
  
  // Customer reviews data
  final customerReviews = [
    {
      'name': 'James Kowalski',
      'role': 'Web Developer',
      'date': '20 June 2020',
      'avatar': 'assets/james.jpg',
      'rating': 3.5,
      'review': 'We recently had dinner with friends at David DC and we all walked away with a great experience. Good food, pleasant environment, personal attention through all the evening. Thanks to the team and we will be back! I will give a good recommendation to my friend, family and people what I took.',
      'tags': ['Good Services', 'Good Places', 'Excellent']
    },
    {
      'name': 'Jonathan Fringgerman',
      'role': 'UX Designer',
      'date': '20 June 2020',
      'avatar': 'assets/jonathan.jpg',
      'rating': 3.5,
      'review': 'We recently had dinner with friends at David DC and we all walked away with a great experience. Good food, pleasant environment, personal attention through all the evening. Thanks to the team and we will be back! I will give a good recommendation to my friend, family and people what I took.',
      'tags': ['Good Services', 'Excellent']
    },
    {
      'name': 'Trianto Lauw',
      'role': 'Finance Manager',
      'date': '20 June 2020',
      'avatar': 'assets/trianto.jpg',
      'rating': 3.5,
      'review': 'We recently had dinner with friends at David DC and we all walked away with a great experience. Good food, pleasant environment, personal attention through all the evening. Thanks to the team and we will be back! I will give a good recommendation to my friend, family and people what I took.',
      'tags': ['Delicious', 'Good Services']
    },
    {
      'name': 'Veralyn Chong',
      'role': 'Query Informatics',
      'date': '20 June 2020',
      'avatar': 'assets/veralyn.jpg',
      'rating': 3.5,
      'review': 'We recently had dinner with friends at David DC and we all walked away with a great experience. Good food, pleasant environment, personal attention through all the evening. Thanks to the team and we will be back! I will give a good recommendation to my friend, family and people what I took.',
      'tags': ['Good Services']
    },
    {
      'name': 'Sofia Puvlora',
      'role': 'Data Marketing',
      'date': '20 June 2020',
      'avatar': 'assets/sofia.jpg',
      'rating': 3.5,
      'review': 'We recently had dinner with friends at David DC and we all walked away with a great experience. Good food, pleasant environment, personal attention through all the evening. Thanks to the team and we will be back! I will give a good recommendation to my friend, family and people what I took.',
      'tags': ['Excellent', 'Delicious']
    },
  ].obs;
}
