//
//  Queue.h
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef Queue_h
#define Queue_h
#import "NewNode.h"
@interface Queue: NSObject


@property NewNode* last;
@property NewNode* temp;
@property NewNode* first;

-(void) enqueue: (NewNode*) itemGiven;
-(NewNode*) dequeue;
-(bool) isEmpty;
-(void) displayQueue;

-(id) init;


@end

#endif /* Queue_h */
