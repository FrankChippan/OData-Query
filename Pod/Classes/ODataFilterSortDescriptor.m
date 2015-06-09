//
//  ODataFilterOrderByStringBuilder.m
//  Pods
//
//  Created by Ewan Thomas on 12/05/2015.
//
//

#import "ODataFilterSortDescriptor.h"

@implementation ODataFilterSortDescriptor

- (NSString *)build
{
  NSString *keyword = @"$orderby=";
  NSString *ascDesc = self.ascending ? @" asc" : @" desc";
  return [[keyword stringByAppendingString:[self.properties componentsJoinedByString:@","]] stringByAppendingString:ascDesc];
}

@end
