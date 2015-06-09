//
//  NSString+ODataFormattedQueryString.m
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import "NSString+ODataFormattedQueryString.h"
#import "ODataList.h"
#import "ODataQuery.h"
#import "ODataFilter.h"
#import "ODataFilterItem.h"
#import "ODataFilterSortDescriptor.h"

@implementation NSString (ODataFormattedQueryString)

+ (NSString *)listWithBlock:(void(^)(ODataList *))builderBlock
{
  NSParameterAssert(builderBlock);
  ODataList *builder = [ODataList new];
  builderBlock(builder);
  return [builder build];
}

+ (NSString *)queryWithBlock:(void(^)(ODataQuery *))builderBlock
{
  NSParameterAssert(builderBlock);
  ODataQuery *builder = [ODataQuery new];
  builder.percentEncode = YES;
  builderBlock(builder);
  return [builder build];
}

+ (NSString *)filterWithBlock:(void(^)(ODataFilter *))builderBlock;
{
  NSParameterAssert(builderBlock);
  ODataFilter *builder = [ODataFilter new];
  builderBlock(builder);
  return [builder build];
}

+ (NSString *)filterItemWithBlock:(void(^)(ODataFilterItem *))builderBlock;
{
  NSParameterAssert(builderBlock);
  ODataFilterItem *builder = [ODataFilterItem new];
  builderBlock(builder);
  return [builder build];
}

+ (NSString *)sortDescriptorWithBlock:(void(^)(ODataFilterSortDescriptor *))builderBlock;
{
  NSParameterAssert(builderBlock);
  ODataFilterSortDescriptor *builder = [ODataFilterSortDescriptor new];
  builderBlock(builder);
  return [builder build];
}

@end
