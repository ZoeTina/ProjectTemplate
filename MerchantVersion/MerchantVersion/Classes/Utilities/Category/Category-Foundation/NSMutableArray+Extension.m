//
//  NSMutableArray+Extension.m
//  LZExtension
//
//  Created by 寕小陌 on 16/10/27.
//  Copyright © 2016年 寕小陌. All rights reserved.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

- (void)lz_moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to {
    if (to != from) {
        id obj = [self lz_safeObjectAtIndex:from];
        [self removeObjectAtIndex:from];
        
        if (to >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:to];
        }
    }
}


- (id _Nullable)lz_safeObjectAtIndex:(NSUInteger)index {
    if ([self count] > 0 && [self count] > index) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}


- (NSMutableArray * _Nonnull)lz_reversedArray {
    return (NSMutableArray *)[[self class] lz_reversedArray:self];
}

+ (NSArray * _Nonnull)lz_reversedArray:(NSArray * _Nonnull)array {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    for (id element in enumerator) [arrayTemp addObject:element];
    
    return arrayTemp;
}

+ (NSMutableArray * _Nonnull)lz_sortArrayByKey:(NSString * _Nonnull)key array:(NSMutableArray * _Nonnull)array ascending:(BOOL)ascending {
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    [tempArray removeAllObjects];
    [tempArray addObjectsFromArray:array];
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortedArray = [tempArray sortedArrayUsingDescriptors:@[descriptor]];
    
    [tempArray removeAllObjects];
    tempArray = (NSMutableArray *)sortedArray;
    
    [array removeAllObjects];
    [array addObjectsFromArray:tempArray];
    
    return array;
}

@end
