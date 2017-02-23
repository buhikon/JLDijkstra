# JLDijkstra
Get a shortest route based on Dijkstra Algorithm.





# Usage


## 1. Build a Route Map

[![](https://raw.github.com/buhikon/JLDijkstra/master/route.png)](https://raw.github.com/buhikon/JLDijkstra/master/route.png)
[![](https://raw.github.com/buhikon/JLDijkstra/master/route_image.png)](https://raw.github.com/buhikon/JLDijkstra/master/route_image.png)

## 2. Code like below.
```
NSString *filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"plist"];
NSDictionary *graphFromFile = [[NSDictionary alloc] initWithContentsOfFile:filePath];

JLDijkstra *dijkstra = [[JLDijkstra alloc] init];
JLDijkstraResult *result = [dijkstra getRouteFromGraph:graphFromFile
                                           startVertex:@"A"
                                             endVertex:@"E"];
NSLog(@"route : %@", result.route);
NSLog(@"distance : %.1f", result.distance);
```

# Result Sample
```
route : (
    A,
    C,
    B,
    E
)
distance : 6.9
```

# Demo
## A sample project is included. :-D

