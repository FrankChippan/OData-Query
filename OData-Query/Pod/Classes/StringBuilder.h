//
//  StringBuilder.h
//  BuildShizni
//
//  Created by Ewan Thomas on 11/05/2015.
//  Copyright (c) 2015 Ewan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StringBuilder <NSObject>

@required
- (NSString *)build;

@end
