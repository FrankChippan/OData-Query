//
//  NSString+ODataFormattedQueryString.h
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ODataList;
@class ODataQuery;
@class ODataFilter;
@class ODataFilterItem;
@class ODataFilterSortDescriptor;

@interface NSString (ODataFormattedQueryString)

/**
 *  Builds full query
 *
 *  @param builderBlock block used for configuring query
 *
 *  @return Query string
 */
+ (NSString *)listWithBlock:(void(^)(ODataList *))builderBlock;


/**
 *  Builds List component
 *
 *  @param builderBlock block used for configuring list component
 *
 *  @return List component string
 */
+ (NSString *)queryWithBlock:(void(^)(ODataQuery *))builderBlock;

/**
 *  Builds filter component
 *
 *  @param builderBlock block used for configuring filter component
 *
 *  @return filter component string
 */
+ (NSString *)filterWithBlock:(void(^)(ODataFilter *))builderBlock;

/**
 *  Builds filter item component
 *
 *  @param builderBlock block used for configuring filter item component
 *
 *  @return Filter item component string
 */
+ (NSString *)filterItemWithBlock:(void(^)(ODataFilterItem *))builderBlock;

/**
 *  Builds order by component
 *
 *  @param builderBlock block used for configuring list component
 *
 *  @return List component string
 */
+ (NSString *)sortDescriptorWithBlock:(void(^)(ODataFilterSortDescriptor *))builderBlock;

@end
