//
//  JLDijkstra.h
//
//  Version 0.1.1
//
//  Created by Joey L. on 23/Feb/2017.
//  Copyright (c) 2017 Joey L. All rights reserved.
//
//  https://github.com/buhikon/JLDijkstra
//

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#import <Foundation/Foundation.h>

@interface JLDijkstraResult : NSObject
@property (assign, nonatomic) double distance;
@property (strong, nonatomic) NSArray *route;
@end

@interface JLDijkstra : NSObject
- (JLDijkstraResult *)getRouteFromGraph:(NSDictionary *)inputGraph
                            startVertex:(NSString *)startVertex
                              endVertex:(NSString *)endVertex;
@end
