//
//  Queue.m
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"

@implementation Queue

-(id) init{
    self = [super init];
    if(self){
        self.first = NULL;
        self.last = NULL;
        self.temp = NULL;
    }
    return self;
}


// adds a new member to line
-(void) enqueue: (NewNode*) itemGiven{
    if(self.first == NULL){
        self.first = itemGiven;
    }else{
        self.temp = self.first;
        while(self.temp.next != NULL){
            self.temp = self.temp.next;
        }
        self.temp.next= itemGiven;
    }
    
}

//removes current first member in line
-(NewNode*) dequeue{
    NewNode* itemDequeued = self.first;
    self.temp = self.first.next;
    self.first = NULL;
    self.first = self.temp;
    return itemDequeued;
}


// checks to see if line is empty
-(bool) isEmpty{
    if(self.first){
        return false;
    }else{
        return true;
    }
}

//display queue
-(void) displayQueue{
    self.temp = self.first;
    while(self.temp!= NULL){
        NSLog(@"%@",self.temp.data.key);
        self.temp = self.temp.next;
    }
}


@end
