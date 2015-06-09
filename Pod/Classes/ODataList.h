//
//  ODataListStringBuilder.h
//  Pods
//
//  Created by Ewan Thomas on 11/05/2015.
//
//

#import <Foundation/Foundation.h>
#import "StringBuilder.h"

@interface ODataList : NSObject <StringBuilder>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *property;

@end
