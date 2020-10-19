# flixy
# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough GIF

![alt text](file:///Users/yeri/Desktop/FlixGIF.gif)

### Notes
- App icon in home screen, launch screen 开屏
  - LauchScree.sb
- Scroll a list of movies
  - Create network request from [API](https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed)。
  - **TableView Setup**!
    + 4步走：
      - Declare UIViewController class as UITableViewDataSource (UIViewControllerDataSource, UIVCDele)
      - 2 required data source methods (return the number of rows in a section (cells) & the actual table view cell to be displayed)
      - Assign the view controller to the datasource property (tableView.dataSource = self)
      - reload
    + Auto-layout
  - **Customize cells** in "MovieCell"
- Download poster with cocopod (**3rd party library**)
  - image Url = base_url + size + file_path (https://image.tmdb.org/t/p/w500/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg)
  - install pod "AlamofireImage" via terminal
  - use workspace
  - using af_settingImage from new lib

