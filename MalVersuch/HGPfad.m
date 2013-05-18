//
//  HGPfad.m
//  MalVersuch
//
//  Created by Herbert Gartner on 18.05.13.
//  Copyright (c) 2013 Herbert Gartner. All rights reserved.
//

#import "HGPfad.h"

@implementation HGPfad

@synthesize ptarray;

- (id)init
{
    self = [super init];
    
    if (self)
        ptarray = [[NSMutableArray alloc] init];
    
    return self;
}

@end
