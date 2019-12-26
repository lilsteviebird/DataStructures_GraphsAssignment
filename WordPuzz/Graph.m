//
//  Graph.m
//  WordPuzz
//
//  Created by sli19 on 4/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Graph.h"
#import "Queue.h"

@implementation Graph:NSObject
-(id)init{
    self = [super init];
    if(self){
        self.allTheBuckets = [[NSMutableDictionary alloc] init];
        self.allWords = [[NSArray alloc] init];
        self.dictionary = [[NSMutableDictionary alloc] init];
        self.wordsToPuzz = [[NSMutableArray alloc] init];
        self.nodeDictionary = [[NSMutableDictionary alloc] init];
        self.displayArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) makeBuckets{
    
    NSString *myFilePath = [[NSBundle mainBundle] pathForResource:@"4letterDictionary" ofType:@"txt"];
    NSString *linesFromFile = [[NSString alloc] initWithContentsOfFile: myFilePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *arrayOfLines = [linesFromFile componentsSeparatedByString:@"\n"];
    
    for(int i = 0; i < [arrayOfLines count]; i++){
        self.allWords =[[arrayOfLines objectAtIndex: i] componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@" "]];
    }
    
    for(int q = 0; q < [self.allWords count]; q++){
        for(int j = 0; j < 4; j++){
            NSString *wordToSeperate = [self.allWords objectAtIndex: q];
            NSString *underScore = @"_";
            
            if(j == 0){
                NSString *number1 = [wordToSeperate substringFromIndex:1];
                NSString *finalCase1 = [underScore stringByAppendingString: number1];
                NSMutableArray *possible = [self.dictionary objectForKey: finalCase1];
                if(!possible)
                {
                    possible = [[NSMutableArray alloc] init];
                    [self.dictionary setObject: possible forKey: finalCase1];
                }
                [possible addObject: wordToSeperate];
            }
            else if(j == 1){
                NSString *number2Begining = [wordToSeperate substringToIndex:1];
                NSString *number2End = [wordToSeperate substringFromIndex:2];
                number2Begining = [number2Begining stringByAppendingString: underScore];
                number2Begining = [number2Begining stringByAppendingString:number2End];
                NSMutableArray *possible = [self.dictionary objectForKey: number2Begining];
                if(!possible)
                {
                    possible = [[NSMutableArray alloc] init];
                    [self.dictionary setObject: possible forKey: number2Begining];
                }
                [possible addObject: wordToSeperate];
            }
            else if(j == 2){
                NSString *number3Begining = [wordToSeperate substringWithRange:NSMakeRange(0,2)];
                NSString *number3End = [wordToSeperate substringFromIndex:3];
                number3Begining = [number3Begining stringByAppendingString: underScore];
                number3Begining = [number3Begining stringByAppendingString:number3End];
                NSMutableArray *possible = [self.dictionary objectForKey: number3Begining];
                if(!possible){
                    possible = [[NSMutableArray alloc] init];
                    [self.dictionary setObject: possible forKey: number3Begining];
                }
                [possible addObject: wordToSeperate];
            }
            else if(j == 3){
                NSString *number4Begining = [wordToSeperate substringWithRange:NSMakeRange(0,3)];
                number4Begining = [number4Begining stringByAppendingString: underScore];
                NSMutableArray *possible = [self.dictionary objectForKey: number4Begining];
                if(!possible){
                    possible = [[NSMutableArray alloc] init];
                    [self.dictionary setObject: possible forKey: number4Begining];
                }
                [possible addObject: wordToSeperate];
            }
        }
    }
}

-(void) showBuckets{
    NSLog(@"%@",[self.dictionary objectForKey: @"_ool"]);
    
}

-(void) addEdges{
    
    for(int i = 0; i < [self.allWords count]; i++){
        NSString *wordToSeperate = [self.allWords objectAtIndex: i];
        Vertex *newVertex = [[Vertex alloc] initWithKey: wordToSeperate];
        NSString *underScore = @"_";
        NSMutableArray *toAdd = [[NSMutableArray alloc] init];
        
        NSString *number1 = [wordToSeperate substringFromIndex:1];
        NSString *finalCase1 = [underScore stringByAppendingString: number1];
        NSString *number2Begining = [wordToSeperate substringToIndex:1];
        NSString *number2End = [wordToSeperate substringFromIndex:2];
        number2Begining = [number2Begining stringByAppendingString: underScore];
        number2Begining = [number2Begining stringByAppendingString:number2End];
        NSString *number3Begining = [wordToSeperate substringWithRange:NSMakeRange(0,2)];
        NSString *number3End = [wordToSeperate substringFromIndex:3];
        number3Begining = [number3Begining stringByAppendingString: underScore];
        number3Begining = [number3Begining stringByAppendingString:number3End];
        NSString *number4Begining = [wordToSeperate substringWithRange:NSMakeRange(0,3)];
        number4Begining = [number4Begining stringByAppendingString: underScore];
        
        
        [toAdd addObjectsFromArray: [self.dictionary objectForKey: finalCase1]];
        [toAdd addObjectsFromArray: [self.dictionary objectForKey: number2Begining]];
        [toAdd addObjectsFromArray: [self.dictionary objectForKey: number3Begining]];
        [toAdd addObjectsFromArray: [self.dictionary objectForKey: number4Begining]];
        
        for(int d = 0; d < [toAdd count]; d++){
            if([toAdd objectAtIndex: d] == wordToSeperate){
                [toAdd removeObjectAtIndex: d];
            }
        }
        
        [newVertex.adjacencyList addObjectsFromArray: toAdd];
        //        NSLog(@"key: %@, List: %@", newVertex.key, newVertex.adjacencyList);
        [self.allTheBuckets setObject: newVertex.adjacencyList forKey: newVertex.key];
        
        // add new node to the wordToPuzz
        NewNode *newNode = [[NewNode alloc] initWithVertex: newVertex];
        [self.wordsToPuzz addObject: newNode];
    }
    
    [self makeNodeDict];
}

-(void) makeNodeDict{
    for (NewNode *n in self.wordsToPuzz){
        [self.nodeDictionary setObject:n forKey:n.data.key];
    }
    
}

-(NSMutableArray*) breadthFirstSearch_v2: (NSString*) startWord andEnding: (NSString*) endWord{
    Queue* solveQueue = [[Queue alloc] init];
    
    NewNode *toAdd = [self.nodeDictionary objectForKey:startWord];
    
    [solveQueue enqueue: toAdd];
    
    while(![solveQueue isEmpty]){

        toAdd = [solveQueue dequeue];
        if([toAdd.data.key isEqualToString:endWord]){
            NSLog(@"we found it!");
            break;
        }
        for(int i = 0; i < [toAdd.data.adjacencyList count]; i++){
            
            NSString *nodeKey = [toAdd.data.adjacencyList objectAtIndex: i];
            NewNode *nextOne = [self.nodeDictionary objectForKey:nodeKey];
            if (nextOne.data.visited == false){
                nextOne.parent = toAdd;
                nextOne.data.visited = true;
                [solveQueue enqueue: nextOne];
                NSLog(@"enqueing this %@", nextOne.data.key);
            }
        }
    }
    
    NewNode *start = [self.nodeDictionary objectForKey:startWord];
    start.parent = nil;
    NewNode *endNode = [self.nodeDictionary objectForKey:endWord];
    
    while(endNode != nil){
        NSLog(@"backwards: %@", endNode.data.key);
        [self.displayArray addObject: endNode.data.key];
        endNode = endNode.parent;
    }
    return self.displayArray;

}





@end
