ios-yelp-client
==========================

A simple iOS client for Yelp.

Total Time Spent: 12 hours

Completed User Stories:
- Search Results Page
  - Custom cells have Auto Layout constraints
  - Search bar in the navigation bar
- Filter Page
  - Category, sort (best match, distance, highest rated), radius, deals
  - Filters organized in sections
  - Radius filter expands 
  - "Search" button dismisses filter page and trigger new search

# Installation
- Clone the project
- Install dependencies using CocoaPods

  `` pod install ``
    
- Modify ``YelpClient/config.template.plist`` by inserting your own Yelp API key and renaming the file to ``config.plist``.

# Walkthrough
![Video Walkthrough](https://raw.githubusercontent.com/kku1993/ios-yelp-client/walkthroughs/walkthrough.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

# Libraries Used
- [AFNetworking](http://afnetworking.com/)
- [BDBOAuth1Manager](https://github.com/bdbergeron/BDBOAuth1Manager)
- [MMProgressHUD](https://github.com/mutualmobile/MMProgressHUD)
