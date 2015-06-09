//
//  OSPFilterItemBuilder.m
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import "ODataFilterItem.h"

@implementation ODataFilterItem

- (NSString *)build
{
  return [NSString stringWithFormat:@"%@ %@ %@", self.name, self.comparisonOperator, self.valueAsString];
}

- (NSString *)valueAsString
{
  //TODO: handle NSDate
  if ([self.value isMemberOfClass:[NSNumber class]]) {
    return [NSString stringWithFormat:@"%@", self.value];
  } else {
    return [NSString stringWithFormat:@"'%@'", self.value];
  }
  return nil;
}

@end
