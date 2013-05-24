//
//  TouchDrawView.m
//  MalVersuch
//
//  Created by Herbert Gartner on 18.05.13.
//  Copyright (c) 2013 Herbert Gartner. All rights reserved.
//

#import "TouchDrawView.h"
#import "HGPfad.h"

@implementation TouchDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        strokesInProcess = [[NSMutableDictionary alloc] init];
        completeStrokes = [[NSMutableArray alloc] init];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setMultipleTouchEnabled:YES];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 6.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    // Draw complete strokes in black
    [[UIColor blackColor] set];
    for (HGPfad *pfad in completeStrokes) {
        CGContextAddPath(context, [pfad pathref]);
        CGContextStrokePath(context);
    }
    
    // Draw strokes in process in gray
    [[UIColor grayColor] set];
    for (NSValue *val in strokesInProcess) {
        HGPfad *pfad = [strokesInProcess objectForKey:val];
        CGContextAddPath(context, [pfad pathref]);
        CGContextStrokePath(context);
    }
}


- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        
        CGPoint loc = [touch locationInView:self];
        HGPfad *newPfad = [[HGPfad alloc] init];
        [newPfad setLastloc:loc];
        CGPathMoveToPoint([newPfad pathref], NULL, loc.x, loc.y);
        
        [strokesInProcess setObject:newPfad forKey:key];
    }
}


- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        HGPfad *pfad = [strokesInProcess objectForKey:key];
        CGPoint loc = [touch locationInView:self];
        CGPathAddLineToPoint([pfad pathref], NULL, loc.x, loc.y);
    }
    [self setNeedsDisplay];
}


- (void)endTouches:(NSSet *)touches
{
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        HGPfad *pfad = [strokesInProcess objectForKey:key];
        if (pfad) {
            [completeStrokes addObject:pfad];
            [strokesInProcess removeObjectForKey:key];
        }
    }
    [self setNeedsDisplay];
}


- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}


- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

@end
