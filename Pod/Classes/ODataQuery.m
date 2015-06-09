//
//  ODataQueryStringBuilder.m
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import "ODataQuery.h"

@implementation ODataQuery

- (NSString *)build
{
  return [NSString stringWithFormat:@"%@%@",self.list, self.query];
}

- (NSString *)query
{
  NSMutableArray *components = [[NSMutableArray alloc] init];
  
  if (self.select) {
    NSString *formattedSelect = [@"$select=" stringByAppendingString:[self.select componentsJoinedByString:@","]];
    [components addObject:formattedSelect];
  }
  
  if (self.filter) {
    [components addObject:self.filter];
  }
  
  if (self.expand) {
    [components addObject:self.expand];
  }
  
  if (self.orderBy) {
    [components addObject:self.orderBy];
  }

  if (self.top) {
    [components addObject:[NSString stringWithFormat:@"$top=%@",self.top]];
  }
  
  if (self.skip) {
    [components addObject:[NSString stringWithFormat:@"$skip=%@",self.skip]];
  }
  
  NSString *queryString = components.count > 0 ? [NSString stringWithFormat:@"?%@",[components componentsJoinedByString:@"&"]] : @"";
  return self.percentEncode ? [ODataQuery percentEncode:queryString] : queryString;
}

+ (NSString *)percentEncode:(NSString *)string
{
  NSString *queryString = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  return [queryString stringByReplacingOccurrencesOfString:@"'" withString:@"%27"];
}

@end
