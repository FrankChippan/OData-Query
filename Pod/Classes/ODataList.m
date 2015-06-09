//
//  ODataListStringBuilder.m
//  Pods
//
//  Created by Ewan Thomas on 11/05/2015.
//
//

#import "ODataList.h"

@implementation ODataList
//TODO: try and clean up 
- (NSString *)build
{
  if (self.count) {
    return [NSString stringWithFormat:@"%@%@", self.name, @"$count"];
  }
  if (self.identifier) {
    if (self.property) {
      return [NSString pathWithComponents:@[[NSString stringWithFormat:@"%@(%ld)", self.name, (long)[self.identifier integerValue]],self.property]];
    }
    return [NSString stringWithFormat:@"%@(%ld)", self.name, (long)[self.identifier integerValue]];
  }
  return self.name;
}

@end
