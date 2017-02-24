//
//  ViewController.m
//  Dijkstra
//
//  Created by Joey Lee on 23/02/2017.
//  Copyright © 2017 Joey Lee. All rights reserved.
//

#import "ViewController.h"
#import "JLDijkstra.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    NSDictionary *graph = [self graphFromFile];
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
}

- (NSDictionary *)graphFromFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"plist"];
    NSDictionary *graphFromFile = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    return graphFromFile;
}
- (NSDictionary *)graphFromCode {
    return @{@"A":@{@"B":@(4),@"C":@(0.9)},
             @"B":@{@"E":@(4)},
             @"C":@{@"B":@(2),@"D":@(4)},
             @"D":@{@"E":@(4)}
             };
}


@end
