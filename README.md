# PWUserPanningMapView
PWUserPanningMapView is an MKMapView subclass that allows panning around the user's current location Pokémon GO-style.

![Animation](http://i.giphy.com/l46CroQUZmrV0j6ww.gif)

## Installation
* Clone the PWUserPanningMapView repo
* Drag and drop the `PWUserPanningMapView.swift` file into your project

## Usage
* PWUserPanningMapView works just like the standard MKMapView but has the following properties:

```
//enable or disable panning; defaults to true
 var shouldPanAroundUser: Bool?
      
//how far the map needs to be pitched to allow panning; defaults to 20
var pitchThreshold: CGFloat?
```

* The `userTrackingMode` property of your map view must be set to `.Follow`.
*  If you're using storyboards, then make sure to assign your map view to the PWUserPanningMapView class in the Identity Inspector in Xcode
* Check out the demo project to see how it all works

## License
MIT

