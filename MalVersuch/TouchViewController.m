//
//  TouchViewController.m
//  MalVersuch
//
//  Created by Herbert Gartner on 18.05.13.
//  Copyright (c) 2013 Herbert Gartner. All rights reserved.
//

#import "TouchViewController.h"
#import "TouchDrawView.h"

@implementation TouchViewController

- (void)loadView
{
    [self setView:[[TouchDrawView alloc] initWithFrame:CGRectZero]];
}

@end
