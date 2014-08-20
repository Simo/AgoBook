//
//  EAPContainedCommonViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 16/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JVFloatLabeledTextField;
@class JVFloatLabeledTextView;

@class Persona;

@interface EAPContainedCommonViewController : UIViewController

@property (strong, nonatomic) Persona *selectedPerson;
@property (strong, nonatomic) NSManagedObjectID *selectedPersonId;

-(id) fetchObjectFromId:(NSManagedObjectID *) selectedObjectId;

-(JVFloatLabeledTextField *) createJVFLTextFieldForElement:(JVFloatLabeledTextField *)element withLabel:(NSString *)label andFrame:(CGRect)frame;

-(JVFloatLabeledTextView *) createJVFLTextViewForElement:(JVFloatLabeledTextView *)element withLabel:(NSString *)label andFrame:(CGRect)frame;

-(UIView *) generateBorderForTextField:(JVFloatLabeledTextField *)element;
-(UIView *) generateBorderForTextView:(JVFloatLabeledTextView *)element;
@end
