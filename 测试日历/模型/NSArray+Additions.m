//
//  NSArray+Additions.m
//  HTF_New
//
//  Created by lijinyang on 16/11/8.
//  Copyright © 2016年 htffund. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)
-(id)AX_objectAtIndex:(NSInteger)index
{
    if (self.count>index)
    {
        return self[index];
    }
    
    return nil;
}
@end
