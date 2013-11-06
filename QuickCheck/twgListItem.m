//
//  twgListItem.m
//  QuickCheck
//
//  Created by Nicholas Wade on 11/5/13.
//  Copyright (c) 2013 Nicholas Wade. All rights reserved.
//

#import "twgListItem.h"

@interface twgListItem ()
@property NSDate *taskFinishedDate;
@end

@implementation twgListItem
-(void)itemFinished:(BOOL)isFinished
{
    self.itCompleted = isFinished;
}
-(void) setFinishedDate {
    if (self.itCompleted)
    {
        self.taskFinishedDate = [NSDate date];
    }else
    {
        self.taskFinishedDate = nil;
    }
}
@end
