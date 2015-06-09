//
//  OSPFilterItemBuilder.h
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringBuilder.h"

@class OSPFilterItem;

@interface ODataFilterItem : NSObject <StringBuilder>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) id value;
@property (nonatomic, copy) NSString *comparisonOperator;

@end
