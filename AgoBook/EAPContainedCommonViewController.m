//
//  EAPContainedCommonViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 16/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPContainedCommonViewController.h"
#import "CoreDataHelper.h"
#import "EAPAppDelegate.h"
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

//const static CGFloat kJVFieldHeight = 44.0f;
//const static CGFloat kJVFieldHMargin = 10.0f;
const static CGFloat kJVFieldFontSize = 16.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface EAPContainedCommonViewController ()

@end

@implementation EAPContainedCommonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id) fetchObjectFromId:(NSManagedObjectID *) selectedObjectId {
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    id obj = [cdh.context existingObjectWithID:self.selectedPersonId error:nil];
    return obj;
}

-(JVFloatLabeledTextField *) createJVFLTextFieldForElement:(JVFloatLabeledTextField *)element withLabel:(NSString *)label andFrame:(CGRect)frame
{
    UIColor *floatingLabelColor = [UIColor brownColor];
    
    JVFloatLabeledTextField *titleField = [[JVFloatLabeledTextField alloc] initWithFrame:frame];
    titleField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(label, @"")
                                                                       attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    titleField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    titleField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    titleField.floatingLabelTextColor = floatingLabelColor;
    titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    //    titleField.leftView = leftView;
    //    titleField.leftViewMode = UITextFieldViewModeAlways;
    return titleField;
}

-(JVFloatLabeledTextView *) createJVFLTextViewForElement:(JVFloatLabeledTextView *)element withLabel:(NSString *)label andFrame:(CGRect)frame
{
    UIColor *floatingLabelColor = [UIColor brownColor];
    
    JVFloatLabeledTextView *descriptionField = [[JVFloatLabeledTextView alloc] initWithFrame:frame];
    descriptionField.placeholder = NSLocalizedString(label, @"");
    descriptionField.placeholderTextColor = [UIColor darkGrayColor];
    descriptionField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    descriptionField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    descriptionField.floatingLabelTextColor = floatingLabelColor;
    
    return descriptionField;
}

-(UIView *) generateBorderForTextField:(JVFloatLabeledTextField *)element
{
    UIView *div1 = [UIView new];
    div1.frame = CGRectMake(element.frame.origin.x, element.frame.origin.y + element.frame.size.height,
                            element.frame.size.width, 1.0f);
    div1.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    return div1;
}

-(UIView *) generateBorderForTextView:(JVFloatLabeledTextView *)element
{
    UIView * div = [UIView new];
    div.frame = CGRectMake(element.frame.origin.x, element.frame.origin.y, element.frame.size.width, element.frame.size.height);
    
    UIView *div1 = [UIView new];
    div1.frame = CGRectMake(element.frame.origin.x, element.frame.origin.y + element.frame.size.height + 10.0,
                            element.frame.size.width, 1.0f);
    div1.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    
    UIView *div2 = [UIView new];
    div2.frame = CGRectMake( element.frame.origin.x + element.frame.size.width, element.frame.origin.y,
                            1.0f, element.frame.size.height);
    div2.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3f];
    
    [div addSubview:div1];
    [div addSubview:div2];
    
    return div1;
}

@end
