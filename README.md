# JLDijkstra
Get a shortest route based on Dijkstra Algorithm.





# Usage


### 1. Build a Route Map

[![](https://raw.github.com/buhikon/JLDijkstra/master/route.png)](https://raw.github.com/buhikon/JLDijkstra/master/route.png)
[![](https://raw.github.com/buhikon/JLDijkstra/master/route_image.png)](https://raw.github.com/buhikon/JLDijkstra/master/route_image.png)

```
- (NSDictionary *)graphFromFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"plist"];
    NSDictionary *graphFromFile = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    return graphFromFile;
}
```
OR
```
- (NSDictionary *)graphFromCode {
    return @{@"A":@{@"B":@(4),@"C":@(0.9)},
             @"B":@{@"E":@(4)},
             @"C":@{@"B":@(2),@"D":@(4)},
             @"D":@{@"E":@(4)}
             };
} 
```

### 2. Code like below.
```
#import "JLDijkstra.h"

// NSDictionary *graph = [self graphFromFile];
NSDictionary *graph = [self graphFromCode];

JLDijkstra *dijkstra = [[JLDijkstra alloc] init];
JLDijkstraResult *result = [dijkstra getRouteFromGraph:graph
                                           startVertex:@"A"
                                             endVertex:@"E"];
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
### A sample project is included. :-D


# License

JLDijkstra is available under the MIT license. See the LICENSE file for more info.