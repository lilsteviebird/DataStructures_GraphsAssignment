//
//  ViewController.h
//  WordPuzz
//
//  Created by sli19 on 3/29/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *StartWord;
@property (weak) IBOutlet NSTextField *EndWord;
- (IBAction)dotheSearch:(id)sender;
@property (weak) IBOutlet NSScrollView *displayList;


@end

