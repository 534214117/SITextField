//
//  SpecialInteractionManager.m
//  SITextField
//
//  Created by 第一反应 on 2018/11/16.
//  Copyright © 2018 Sonia. All rights reserved.
//

#import "SpecialInteractionManager.h"

@interface SpecialInteractionManager ()


@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *>   *formDictionary;

@end

@implementation SpecialInteractionManager

- (void)addItem:(SpecialInteractionTextField *)item {
    if (![self.subviewArray containsObject:item]) {
        [self.subviewArray addObject:item];
    }
}

- (void)resetAllValues {
    for (SpecialInteractionTextField *siTextField in self.subviewArray) {
        siTextField.inputValue = @"";
    }
    [self getAllKeyValues];
}

- (NSDictionary *)getAllKeyValues {
    for (SpecialInteractionTextField *siTextField in self.subviewArray) {
        if (siTextField.tagName && siTextField.tagName.length > 0) {
            [self.formDictionary setObject:siTextField.inputValue ? siTextField.inputValue : @"" forKey:siTextField.tagName];
        }
    }
    return self.formDictionary;
}

- (NSMutableArray<SpecialInteractionTextField *> *)subviewArray {
    if (!_subviewArray) {
        _subviewArray = [NSMutableArray new];
    }
    return _subviewArray;
}

- (NSMutableDictionary<NSString *,NSString *> *)formDictionary {
    if (!_formDictionary) {
        _formDictionary = [NSMutableDictionary new];
    }
    return _formDictionary;
}

@end
