//
//  Vertex.h
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef Vertex_h
#define Vertex_h
@interface Vertex<ObjectType> : NSObject

@property NSString *key;

@property NSMutableArray *adjacencyList;

@property Vertex *parent;

@property bool visited;

-(id)initWithKey:(NSString*) stringGiven andAdjecencyList: (NSMutableArray*) listGiven;
-(id)initWithKey:(NSString*) stringGiven;
@end
#endif /* Vertex_h */
