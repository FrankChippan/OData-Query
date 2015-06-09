//
//  ODataFilterOrderByStringBuilder.h
//  Pods
//
//  Created by Ewan Thomas on 12/05/2015.
//
//

#import <Foundation/Foundation.h>
#import "StringBuilder.h"

@interface ODataFilterSortDescriptor : NSObject <StringBuilder>

@property (nonatomic, copy) NSArray *properties;

@property (nonatomic, assign) BOOL ascending;

@end
