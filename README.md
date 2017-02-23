# JLDijkstra
Get a shortest route based on Dijkstra Algorithm.





# Usage


## 1. Build a Route Map

[![](https://raw.github.com/buhikon/JLDijkstra/master/route.png)](https://raw.github.com/buhikon/JLDijkstra/master/route.png)

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

## 3. A sample project is included. :-D

