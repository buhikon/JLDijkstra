//
//  JLDijkstra.m
//
//  Version 0.1.0
//
//  Created by Joey L. on 23/Feb/2017.
//  Copyright (c) 2017 Joey L. All rights reserved.
//
//  https://github.com/buhikon/JLDijkstra
//

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#import "JLDijkstra.h"

@implementation JLDijkstraResult
@end

@interface JLDijkstra ()
@property (strong, nonatomic) NSMutableDictionary *graph;
@property (strong, nonatomic) NSArray *vertexArray;          // array of all vertexes
@property (strong, nonatomic) NSMutableDictionary *distance; // dict of Number
@property (strong, nonatomic) NSMutableDictionary *path;     // dict of String(Vertex name)
@property (strong, nonatomic) NSMutableDictionary *visited;  // dict of bool
@end


@implementation JLDijkstra

- (JLDijkstraResult *)getRouteFromGraph:(NSDictionary *)inputGraph
                            startVertex:(NSString *)startVertex
                              endVertex:(NSString *)endVertex {
    
    // build a vertex array
    NSMutableArray *vertexArray = [NSMutableArray array];
    {
        NSMutableSet *set = [NSMutableSet set];
        NSArray *allKeys = [NSArray arrayWithArray:inputGraph.allKeys];
        for (NSString *key in allKeys) {
            [set addObject:key];
            NSDictionary *dict = inputGraph[key];
            NSArray *allKeysInDict = [NSArray arrayWithArray:dict.allKeys];
            for (NSString *keyInDict in allKeysInDict) {
                [set addObject:keyInDict];
            }
        }
        [vertexArray addObjectsFromArray:[set allObjects]];
    }
    [vertexArray sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    self.vertexArray = vertexArray;
    
    
    // check startVertex and endVertex exist.
    if(![vertexArray containsObject:startVertex]) return nil;
    if(![vertexArray containsObject:endVertex]) return nil;
    
    
    // build a graph for all vertexes.
    // --> simple to access to the edge value just by `self.graph["vertexName"]["vertexName"]`
    NSMutableDictionary *graph = [NSMutableDictionary dictionary];
    for(NSString *vertex1 in vertexArray) {
        [graph setObject:[NSMutableDictionary dictionary] forKey:vertex1];
        for(NSString *vertex2 in vertexArray) {
            double edge = 0.0;
            if([vertex1 isEqualToString:vertex2]) {
                // same destination
                edge = 0.0;
            }
            else {
                NSNumber *edgeNumFromFile = inputGraph[vertex1][vertex2];
                if(edgeNumFromFile) {
                    // exists in inputGraph
                    edge = edgeNumFromFile.doubleValue;
                }
                else {
                    // not exist in inputGraph
                    edge = -1;
                }
            }
            graph[vertex1][vertex2] = @(edge);
        }
    }
    self.graph = graph;
    
    // initialize a distance dict, path and visited
    NSMutableDictionary *distance = [NSMutableDictionary dictionary];
    NSMutableDictionary *path = [NSMutableDictionary dictionary];
    NSMutableDictionary *visited = [NSMutableDictionary dictionary];
    for(NSString *vertex in vertexArray) {
        distance[vertex] = @"-1";
        path[vertex] = @"";
        visited[vertex] = @(NO);
    }
    self.distance = distance;
    self.path = path;
    self.visited = visited;
    
    
    //===============================================
    // start dijkstra algorithm
    // ==============================================
    distance[startVertex] = @(0);
    
    NSString *currentVertex = startVertex;
    while(YES) {
        self.visited[currentVertex] = @(YES);
        
        // update distance array
        for (NSString *vertexToVisit in self.vertexArray) {
            if([currentVertex isEqualToString:vertexToVisit]) continue;
            
            double currentDistance = [self.distance[currentVertex] doubleValue];
            double distance = [self.distance[vertexToVisit] doubleValue];
            double edge = [self.graph[currentVertex][vertexToVisit] doubleValue];
            
            if(edge < 0) continue;
            
            if(distance < 0 || distance > currentDistance + edge) {
                self.distance[vertexToVisit] = @(currentDistance + edge);
                self.path[vertexToVisit] = currentVertex;
            }
        }
        
        // look for the nextVertex
        NSString *nextVertex = nil;
        double minDistance = -1;
        for (NSString *vertex in self.vertexArray) {
            BOOL visited = [self.visited[vertex] boolValue];
            if(visited) continue;
            
            double distance = [self.distance[vertex] doubleValue];;
            if(distance >= 0) {
                if(minDistance < 0 || minDistance > distance) {
                    minDistance = distance;
                    nextVertex = vertex;
                }
            }
        }
        if(!nextVertex) {
            break;
        }
        currentVertex = nextVertex;
    }
    
    // backtrack the route
    NSMutableArray *route = [NSMutableArray array];
    [route addObject:endVertex];
    while(YES) {
        NSString *nextVertex = self.path[route.lastObject];
        [route addObject:nextVertex];
        
        if([nextVertex isEqualToString:startVertex]) break;
        if(![self.vertexArray containsObject:nextVertex]) break;
    }
    NSArray *reverceRoute = [[route reverseObjectEnumerator] allObjects];
    
    // create a result object and return
    JLDijkstraResult *result = [[JLDijkstraResult alloc] init];
    result.route = reverceRoute;
    result.distance = [self.distance[endVertex] doubleValue];
    return result;
}

@end
