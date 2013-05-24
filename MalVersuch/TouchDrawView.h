//
//  TouchDrawView.h
//  MalVersuch
//
//  Created by Herbert Gartner on 18.05.13.
//  Copyright (c) 2013 Herbert Gartner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchDrawView : UIView
{
    NSMutableDictionary *strokesInProcess;
    NSMutableArray *completeStrokes;
}

- (void)endTouches:(NSSet *)touches;

@end
