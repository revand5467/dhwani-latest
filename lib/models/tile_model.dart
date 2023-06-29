
String path= "C__Users_abhiv_speech_assets_images_";
class tile {
  String name;
  String image;
  String description;
  String maludescription;
  tile(this.name, this.image, this.description,this.maludescription);
}

List<tile> demo = [
  tile('sleep', 'assets/PNG/${path}sleep_male_,_to.png','I am feeling sleepy', 'എനിക്ക് ഉറക്കം വരുന്നു'),
  tile('eat', 'assets/PNG/${path}eat_,_to.png', 'I am hungry','എനിക്ക് വിശക്കുന്നു'),
  tile('bird', 'assets/PNG/${path}stomach_ache.png', 'I am sick','എനിക്ക് സുഖമില്ല'),
  tile('banana', 'assets/PNG/${path}play_area.png', 'I want to go to play','എനിക്ക് കളിക്കാൻ പോകണം'),
  tile('bat', 'assets/PNG/${path}comedy_tv.png', 'I want to watch tv','എനിക്ക് ടിവി കാണണം'),
  tile('beach', 'assets/PNG/${path}mens_toilet.png', 'I want to go to toilet','എനിക്ക് ടോയ്‌ലറ്റിൽ പോകണം'),
  tile('beach', 'assets/PNG/${path}bathe_,_to.png', 'I want to take a bath','എനിക്ക് കുളിക്കണം'),
  tile('beach', 'assets/PNG/${path}water.png', 'I am thirsty','എനിക്ക് ദാഹിക്കുന്നു'),
];
