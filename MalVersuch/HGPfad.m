//
//  HGPfad.m
//  MalVersuch
//
//  Created by Herbert Gartner on 18.05.13.
//  Copyright (c) 2013 Herbert Gartner. All rights reserved.
//

#import "HGPfad.h"

@implementation HGPfad

@synthesize pathref, lastloc;

- (id)init
{
    self = [super init];
    if (self) {
        pathref = CGPathCreateMutable();
        lastloc.x = 0.0;
        lastloc.y = 0.0;
    }
    return self;
}


- (void)dealloc
{
    CGPathRelease(pathref);
}

@end
