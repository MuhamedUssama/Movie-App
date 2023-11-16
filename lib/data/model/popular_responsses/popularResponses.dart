import 'package:http/http.dart';
import 'package:movie_app/data/model/base_response.dart';

/// page : 1
/// results : [{"adult":false,"backdrop_path":"/rMvPXy8PUjj1o8o1pzgQbdNCsvj.jpg","genre_ids":[28,12,53],"id":299054,"original_language":"en","original_title":"Expend4bles","overview":"Armed with every weapon they can get their hands on and the skills to use them, The Expendables are the world’s last line of defense and the team that gets called when all other options are off the table. But new team members with new styles and tactics are going to give “new blood” a whole new meaning.","popularity":2085.194,"poster_path":"/mOX5O6JjCUWtlYp5D8wajuQRVgy.jpg","release_date":"2023-09-15","title":"Expend4bles","video":false,"vote_average":6.3,"vote_count":280},{"adult":false,"backdrop_path":"/628Dep6AxEtDxjZoGP78TsOxYbK.jpg","genre_ids":[28,53],"id":575264,"original_language":"en","original_title":"Mission: Impossible - Dead Reckoning Part One","overview":"Ethan Hunt and his IMF team embark on their most dangerous mission yet: To track down a terrifying new weapon that threatens all of humanity before it falls into the wrong hands. With control of the future and the world's fate at stake and dark forces from Ethan's past closing in, a deadly race around the globe begins. Confronted by a mysterious, all-powerful enemy, Ethan must consider that nothing can matter more than his mission—not even the lives of those he cares about most.","popularity":1984.315,"poster_path":"/NNxYkU70HPurnNCSiCjYAmacwm.jpg","release_date":"2023-07-08","title":"Mission: Impossible - Dead Reckoning Part One","video":false,"vote_average":7.7,"vote_count":1724},{"adult":false,"backdrop_path":"/cHNqobjzfLj88lpIYqkZpecwQEC.jpg","genre_ids":[28,53,80],"id":926393,"original_language":"en","original_title":"The Equalizer 3","overview":"Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.","popularity":1692.461,"poster_path":"/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg","release_date":"2023-08-30","title":"The Equalizer 3","video":false,"vote_average":7.2,"vote_count":969},{"adult":false,"backdrop_path":"/mRGmNnh6pBAGGp6fMBMwI8iTBUO.jpg","genre_ids":[27,9648,53],"id":968051,"original_language":"en","original_title":"The Nun II","overview":"In 1956 France, a priest is violently murdered, and Sister Irene begins to investigate. She once again comes face-to-face with a powerful evil.","popularity":1145.546,"poster_path":"/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg","release_date":"2023-09-06","title":"The Nun II","video":false,"vote_average":7,"vote_count":1042},{"adult":false,"backdrop_path":"/S3EIcOUQYxgd3QzjOo2rZJ2MN8.jpg","genre_ids":[28,18,10752],"id":554600,"original_language":"hi","original_title":"Uri: The Surgical Strike","overview":"Following the roguish terrorist attacks at Uri Army Base camp in Kashmir, India takes the fight to the enemy, in its most successful covert operation till date with one and only one objective of avenging their fallen heroes.","popularity":1044.303,"poster_path":"/yNySAgpAnWmPpYinim9E0tUzJWG.jpg","release_date":"2019-01-11","title":"Uri: The Surgical Strike","video":false,"vote_average":7.1,"vote_count":224},{"adult":false,"backdrop_path":"/pA3vdhadJPxF5GA1uo8OPTiNQDT.jpg","genre_ids":[28,18],"id":678512,"original_language":"en","original_title":"Sound of Freedom","overview":"The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.","popularity":831.226,"poster_path":"/qA5kPYZA7FkVvqcEfJRoOy4kpHg.jpg","release_date":"2023-07-03","title":"Sound of Freedom","video":false,"vote_average":8.1,"vote_count":935},{"adult":false,"backdrop_path":"/k0VC5O8PrrJRqqDDbHDiDo8qAE0.jpg","genre_ids":[16,28,14],"id":1034062,"original_language":"en","original_title":"Mortal Kombat Legends: Cage Match","overview":"In 1980s Hollywood, action star Johnny Cage is looking to become an A-list actor. But when his costar, Jennifer, goes missing from set, Johnny finds himself thrust into a world filled with shadows, danger, and deceit. As he embarks on a bloody journey, Johnny quickly discovers the City of Angels has more than a few devils in its midst.","popularity":810.288,"poster_path":"/1eKWqTHp4OgKdx1QX1O9LxKHr1M.jpg","release_date":"2023-10-17","title":"Mortal Kombat Legends: Cage Match","video":false,"vote_average":8.1,"vote_count":20},{"adult":false,"backdrop_path":"/iIvQnZyzgx9TkbrOgcXx0p7aLiq.jpg","genre_ids":[27,53],"id":1008042,"original_language":"en","original_title":"Talk to Me","overview":"When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.","popularity":765.457,"poster_path":"/kdPMUMJzyYAc4roD52qavX0nLIC.jpg","release_date":"2023-07-26","title":"Talk to Me","video":false,"vote_average":7.2,"vote_count":1473},{"adult":false,"backdrop_path":"/xvzxqKWltnj6qSiWBXRq6ZCdcrw.jpg","genre_ids":[53,18],"id":1151534,"original_language":"es","original_title":"Nowhere","overview":"A young pregnant woman named Mia escapes from a country at war by hiding in a maritime container aboard a cargo ship. After a violent storm, Mia gives birth to the child while lost at sea, where she must fight to survive.","popularity":728.655,"poster_path":"/uldNFFKNXNvwss0MIZErMSFkBJZ.jpg","release_date":"2023-09-29","title":"Nowhere","video":false,"vote_average":7.6,"vote_count":665},{"adult":false,"backdrop_path":"/dAXSflkUKRfpzK74kRaovfK09Kx.jpg","genre_ids":[28,80,53],"id":961268,"original_language":"ko","original_title":"발레리나","overview":"Grieving the loss of a best friend she couldn't protect, an ex-bodyguard sets out to fulfill her dear friend's last wish: sweet revenge.","popularity":672.049,"poster_path":"/oE7xtGDqZnr7tFHfwb8oM9iRW6H.jpg","release_date":"2023-10-05","title":"Ballerina","video":false,"vote_average":6.9,"vote_count":178},{"adult":false,"backdrop_path":"/8pjWz2lt29KyVGoq1mXYu6Br7dE.jpg","genre_ids":[28,878,27],"id":615656,"original_language":"en","original_title":"Meg 2: The Trench","overview":"An exploratory dive into the deepest depths of the ocean of a daring research team spirals into chaos when a malevolent mining operation threatens their mission and forces them into a high-stakes battle for survival.","popularity":657.018,"poster_path":"/4m1Au3YkjqsxF8iwQy0fPYSxE0h.jpg","release_date":"2023-08-02","title":"Meg 2: The Trench","video":false,"vote_average":6.8,"vote_count":2273},{"adult":false,"backdrop_path":"/r7DuyYJ0N3cD8bRKsR5Ygq2P7oa.jpg","genre_ids":[12,28,18],"id":980489,"original_language":"en","original_title":"Gran Turismo","overview":"The ultimate wish-fulfillment tale of a teenage Gran Turismo player whose gaming skills won him a series of Nissan competitions to become an actual professional racecar driver.","popularity":645.253,"poster_path":"/51tqzRtKMMZEYUpSYkrUE7v9ehm.jpg","release_date":"2023-08-09","title":"Gran Turismo","video":false,"vote_average":8.1,"vote_count":1089},{"adult":false,"backdrop_path":"/jP3FatCTHc460ZGW57q9ypTdBqu.jpg","genre_ids":[53,878,28],"id":937249,"original_language":"en","original_title":"57 Seconds","overview":"When a tech blogger lands an interview with a tech guru and stops an attack on him, he finds a mysterious ring that takes him back 57 seconds into the past.","popularity":806.498,"poster_path":"/dfS5qHWFuXyZQnwYREwb7N4qU5p.jpg","release_date":"2023-09-29","title":"57 Seconds","video":false,"vote_average":5.4,"vote_count":104},{"adult":false,"backdrop_path":"/H6j5smdpRqP9a8UnhWp6zfl0SC.jpg","genre_ids":[28,878,12],"id":565770,"original_language":"en","original_title":"Blue Beetle","overview":"Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that home is not quite as he left it. As he searches to find his purpose in the world, fate intervenes when Jaime unexpectedly finds himself in possession of an ancient relic of alien biotechnology: the Scarab.","popularity":623.853,"poster_path":"/mXLOHHc1Zeuwsl4xYKjKh2280oL.jpg","release_date":"2023-08-16","title":"Blue Beetle","video":false,"vote_average":7.1,"vote_count":1331},{"adult":false,"backdrop_path":"/bQTfSXQrcVwXJ5TvNzbd3ioMnnM.jpg","genre_ids":[9648,53,28,18],"id":862552,"original_language":"en","original_title":"The Ritual Killer","overview":"Unable to process the death of his daughter, Detective Boyd embarks on a hunt for a serial killer who murders according to a brutal tribal ritual: Muti. The only person who can help Boyd is Professor Mackles, an anthropologist who hides an unspeakable secret. The line between sanity and madness thins as Boyd goes deeper into the killer’s world.","popularity":610.757,"poster_path":"/1VtHaELqLMovl8EueBWHDtihhzF.jpg","release_date":"2023-03-09","title":"The Ritual Killer","video":false,"vote_average":5.8,"vote_count":142},{"adult":false,"backdrop_path":"/gIchV01EUHd1zNBeql92L63kmHU.jpg","genre_ids":[16,10751,28,878],"id":893723,"original_language":"en","original_title":"PAW Patrol: The Mighty Movie","overview":"A magical meteor crash-lands in Adventure City, gives the PAW Patrol pups superpowers, and transforms them into The Mighty Pups. When the Patrol's archrival Humdinger breaks out of jail and teams up with mad scientist Victoria Vance to steal the powers for themselves, the Mighty Pups must save Adventure City and stop the supervillains before it's too late.","popularity":589.599,"poster_path":"/aTvePCU7exLepwg5hWySjwxojQK.jpg","release_date":"2023-09-21","title":"PAW Patrol: The Mighty Movie","video":false,"vote_average":7.3,"vote_count":56},{"adult":false,"backdrop_path":"/5ImZV8IXsZ81s4ZryYkFgasnSjW.jpg","genre_ids":[27,53,14,878,80,9648],"id":1032948,"original_language":"en","original_title":"V/H/S/85","overview":"Unveiled through a made-for-TV documentary, five chilling tales of found footage horror emerge to take viewers on a gore-filled journey through the grim underbelly of the forgotten 1980s.","popularity":571.111,"poster_path":"/yIPSlVaTYuxhbsmSsGBDCZkiN3P.jpg","release_date":"2023-09-22","title":"V/H/S/85","video":false,"vote_average":6.8,"vote_count":55},{"adult":false,"backdrop_path":"/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg","genre_ids":[28,80,53],"id":385687,"original_language":"en","original_title":"Fast X","overview":"Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.","popularity":569.32,"poster_path":"/fiVW06jE7z9YnO4trhaMEdclSiC.jpg","release_date":"2023-05-17","title":"Fast X","video":false,"vote_average":7.2,"vote_count":4031},{"adult":false,"backdrop_path":"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg","genre_ids":[35,12,14],"id":346698,"original_language":"en","original_title":"Barbie","overview":"Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.","popularity":563.526,"poster_path":"/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg","release_date":"2023-07-19","title":"Barbie","video":false,"vote_average":7.2,"vote_count":5494},{"adult":false,"backdrop_path":"/uvsL5Q5Juf8ivqBnlr4nFVUwVoa.jpg","genre_ids":[80,18,53],"id":466420,"original_language":"en","original_title":"Killers of the Flower Moon","overview":"When oil is discovered in 1920s Oklahoma under Osage Nation land, the Osage people are murdered one by one—until the FBI steps in to unravel the mystery.","popularity":555.635,"poster_path":"/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg","release_date":"2023-10-18","title":"Killers of the Flower Moon","video":false,"vote_average":7.6,"vote_count":48}]
/// total_pages : 40585
/// total_results : 811691

class PopularResponses extends ErrorResponse{

  int? page;
  List<PopularResult>? results;
  int? totalPages;
  int? totalResults;

  PopularResponses({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  PopularResponses.fromJson(Map<dynamic , dynamic> json) {
    page = json['page'];
    message = json["status_message"];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(PopularResult.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

/// adult : false
/// backdrop_path : "/rMvPXy8PUjj1o8o1pzgQbdNCsvj.jpg"
/// genre_ids : [28,12,53]
/// id : 299054
/// original_language : "en"
/// original_title : "Expend4bles"
/// overview : "Armed with every weapon they can get their hands on and the skills to use them, The Expendables are the world’s last line of defense and the team that gets called when all other options are off the table. But new team members with new styles and tactics are going to give “new blood” a whole new meaning."
/// popularity : 2085.194
/// poster_path : "/mOX5O6JjCUWtlYp5D8wajuQRVgy.jpg"
/// release_date : "2023-09-15"
/// title : "Expend4bles"
/// video : false
/// vote_average : 6.3
/// vote_count : 280

class PopularResult {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;

  PopularResult({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,
  });

  PopularResult.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = "https://image.tmdb.org/t/p/w500${json['backdrop_path']}";
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = "https://image.tmdb.org/t/p/w500${json['poster_path']}";
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];


  }

}