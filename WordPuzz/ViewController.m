//
//  ViewController.m
//  WordPuzz
//
//  Created by sli19 on 3/29/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import "ViewController.h"
#import "Graph.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.

    NSLog(@"up and running");
    

    
    NSLog(@"program has finished");

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



- (IBAction)dotheSearch:(id)sender {
    NSString *begin = [self.StartWord stringValue];
    NSString *end = [self.EndWord stringValue];
    Graph *myGraph = [[Graph alloc] init];
    
    [myGraph makeBuckets];
    [myGraph addEdges];
    NSMutableArray *final = [myGraph breadthFirstSearch_v2: begin andEnding: end];
   NSArray* reversedArray = [[final reverseObjectEnumerator] allObjects];
    for(int i = 0; i< [reversedArray count]; i++){
        [self.displayList.documentView insertText: [reversedArray objectAtIndex: i] ];
        [self.displayList.documentView insertText: @"\n"];
        
    }
    [self.displayList.documentView insertText: @"\n"];
    [self.displayList.documentView insertText: @"\n"];
    
    //[self.displayList.documentView insertText:@"" ];
}
@end
