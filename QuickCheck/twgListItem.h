//
//  twgListItem.h
//  QuickCheck
//
//  Created by Nicholas Wade on 11/5/13.
//  Copyright (c) 2013 Nicholas Wade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface twgListItem : NSObject
    @property NSString *lItemName;
    @property BOOL itCompleted;
    @property (readonly)NSDate *dateCreated;
-(void)itemFinished:(BOOL)isFinished;
@end
