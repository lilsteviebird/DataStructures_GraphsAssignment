//
//  NewNode.h
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef NewNode_h
#define NewNode_h
#import "Vertex.h"
@interface NewNode<ObjectType> : NSObject

@property Vertex *data;
@property NewNode *next;
@property NewNode *parent;
-(id) initWithVertex: (Vertex*) vertexGiven;
@end
#endif /* NewNode_h */
