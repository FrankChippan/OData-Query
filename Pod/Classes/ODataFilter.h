//
//  OSPFilterBuilder.h
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringBuilder.h"

@class OSPFilter;

@interface ODataFilter : NSObject <StringBuilder>

@property (nonatomic, copy) NSArray *items;

@end
