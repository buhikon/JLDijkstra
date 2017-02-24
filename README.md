# JLDijkstra
Get a shortest route based on Dijkstra Algorithm.





# Usage


### 1. Build a Route Map

[![](https://raw.github.com/buhikon/JLDijkstra/master/route_image.png)](https://raw.github.com/buhikon/JLDijkstra/master/route_image.png)


##### 1-1. example of get a graph from file

```
- (NSDictionary *)graphFromFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"plist"];
    NSDictionary *graphFromFile = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    return graphFromFile;
}
```
[![](https://raw.github.com/buhikon/JLDijkstra/master/route.png)](https://raw.github.com/buhikon/JLDijkstra/master/route.png)


##### 1-2. example of get a graph from code
```
- (NSDictionary *)graphFromCode {
    return @{@"A":@{@"B":@(4),@"C":@(0.9)},
             @"B":@{@"E":@(4)},
             @"C":@{@"B":@(2),@"D":@(4)},
             @"D":@{@"E":@(4)}
             };
} 
```

### 2. Include below 2 files in your project.
```
JLDijkstra.h
JLDijkstra.m
```


### 3. Code like below.

import header
```
#import "JLDijkstra.h"
```

create a map graph
```
NSDictionary *graph = [self graphFromFile];
```
OR
```
NSDictionary *graph = [self graphFromCode];
```

Go!
```
JLDijkstra *dijkstra = [[JLDijkstra alloc] init];
JLDijkstraResult *result = [dijkstra getRouteFromGraph:graph
                                           startVertex:@"A"
                                             endVertex:@"E"];
```

See the result
```
if(result) {
    NSLog(@"route : %@", result.route);
    NSLog(@"distance : %.1f", result.distance);
}
else {
    NSLog(@"no result");
}
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
A sample project is included. :-D


# License

JLDijkstra is available under the MIT license. See the LICENSE file for more info.