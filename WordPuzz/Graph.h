//
//  Graph.h
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef Graph_h
#define Graph_h
#import "Vertex.h"
#import "NewNode.h"
@interface Graph<ObjectType> : NSObject

@property NSMutableDictionary *allTheBuckets;
@property NSArray *allWords;
@property NSMutableDictionary *dictionary;
@property NSMutableArray<NewNode *> *wordsToPuzz;
@property NSMutableDictionary *nodeDictionary;
@property NSMutableArray *displayArray;

-(id)init;
-(void) makeBuckets;
-(void) showBuckets;
-(void) addEdges;
-(NSMutableArray*) breadthFirstSearch_v2: (NSString*) startWord andEnding: (NSString*) endWord;
@end
#endif /* Graph_h */
