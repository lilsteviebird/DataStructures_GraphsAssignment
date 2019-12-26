//
//  NewNode.m
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewNode.h"
#import "Vertex.h"

@implementation NewNode:NSObject
-(id) initWithVertex: (Vertex*) vertexGiven{
    self = [super init];
    if(self){
        self.data = vertexGiven;
        self.next = NULL;
        self.parent = NULL;
    }
    return self;
}


@end
