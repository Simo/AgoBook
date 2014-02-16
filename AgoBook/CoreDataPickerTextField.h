//
//  CoreDataPickerTextField.h
//  AgoBook
//
//  Created by Simone Bierti on 27/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataHelper.h"

@class CoreDataPickerTextField;

@protocol CoreDataPickerTextFieldDelegate <NSObject>

- (void)selectedObjectID:(NSManagedObjectID*)objectID changedForPickerTextField:(CoreDataPickerTextField *)pickerTF;
@optional
- (void)selectedObjectClearedForPickerTextField:(CoreDataPickerTextField *)pickerTF;

@end

@interface CoreDataPickerTextField : UITextField <UIKeyInput,UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, weak) id <CoreDataPickerTextFieldDelegate> pickerDelegate;
@property (nonatomic, strong) UIPickerView *picker;
@property (nonatomic, strong) NSArray *pickerData;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic) BOOL showToolbar;
@property (nonatomic, strong) NSManagedObjectID *selectedObjectID;

@end
