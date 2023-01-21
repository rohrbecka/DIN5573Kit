# DIN5573Kit

A Swift Package providing the wheel profiles as defined in 
*DIN 5573:1995 – Schienenfahrzeuge – Radprofile – Breite 135 und 140 mm*.

## Introduction

DIN 5573 is the German standard defining the standard wheel profiles for
railway vehicles. The standard is based on the UIC 510-2 leaflet and defines
standard wear profiles for rails with an inclination of 1:40.

DIN 5573 is by today mostly replaced by EN 13715, in which the DIN 5573 profiles
are S1002 profiles with an outer inclination of 1:6.67 either with a flange height
of 28 mm (DIN 5573 E) or 32 mm (DIN 5573 EH).


## Use of the package

### Installation

Simply add this package as a Swift-Package-Manager dependency to your project.


### API

The API is quite easy. You create a ``WheelProfile`` by using the corresponding
convenience API as follows:

```swift
import DIN5573Kit 

let profile = try? DIN5573.profileDIN5573.profile(.e, sr: 1425, width: 135, ar: 1360)

/// access the profiles co-ordinates as follows
let coordinates = profile.profile 
```  
