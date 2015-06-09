//
//  OSPFilterBuilder.m
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import "ODataFilter.h"
#import "ODataFilterItem.h"

@implementation ODataFilter

- (NSString *)build
{
  NSString *keyword = @"$filter=";
  return [keyword stringByAppendingString:[self.items componentsJoinedByString:@" and "]];
}

@end
