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

    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"plist"];
    NSDictionary *graphFromFile = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
    JLDijkstra *dijkstra = [[JLDijkstra alloc] init];
    JLDijkstraResult *result = [dijkstra getRouteFromGraph:graphFromFile
                                               startVertex:@"A"
                                                 endVertex:@"E"];
    NSLog(@"route : %@", result.route);
    NSLog(@"distance : %.1f", result.distance);
}





@end
