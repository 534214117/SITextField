//
//  SpecialInteractionManager.h
//  SITextField
//
//  Created by 第一反应 on 2018/11/16.
//  Copyright © 2018 Sonia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpecialInteractionTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface SpecialInteractionManager : NSObject

@property (nonatomic, strong) NSMutableArray<SpecialInteractionTextField *> *subviewArray;

- (void)addItem:(SpecialInteractionTextField *)item;
- (void)resetAllValues;
- (NSDictionary *)getAllKeyValues;

@end

NS_ASSUME_NONNULL_END
