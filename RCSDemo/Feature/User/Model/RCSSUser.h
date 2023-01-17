//
//  RCSSUser.h
//  TestFramework
//
//  Created by shaoshuai on 2022/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCSSUser : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *portrait;
@property (nonatomic, copy) NSString *token;

@end

NS_ASSUME_NONNULL_END
