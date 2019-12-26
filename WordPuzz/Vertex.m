//
//  Vertex.m
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vertex.h"
@implementation Vertex:NSObject
-(id)initWithKey:(NSString*) stringGiven andAdjecencyList: (NSMutableArray*) listGiven{
    self = [super init];
    if(self){
        self.key = stringGiven;
        self.adjacencyList = listGiven;
        self.visited = false;
        self.parent = NULL;
    }
    return self;
}

-(id)initWithKey:(NSString*) stringGiven{
    self= [super init];
    if(self){
        self.key = stringGiven;
        self.adjacencyList = [[NSMutableArray alloc] init];
        self.visited = false;
        self.parent = NULL;
    }
    return self;
}

@end
