//
//  ODataQueryStringBuilder.h
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringBuilder.h"

@interface ODataQuery : NSObject <StringBuilder>

@property (nonatomic, copy) NSString *list;
@property (nonatomic, copy) NSString *filter;
@property (nonatomic, copy) NSArray *select;
@property (nonatomic, copy) NSArray *expand;
@property (nonatomic, copy) NSString *orderBy;
@property (nonatomic, copy) NSString *top;
@property (nonatomic, copy) NSString *skip;

/**
 *  Set to YES by default, encodes to OData format
 */
@property (nonatomic, assign) BOOL percentEncode;

@end
