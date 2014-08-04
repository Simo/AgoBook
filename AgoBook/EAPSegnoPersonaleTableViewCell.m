//
//  EAPSegnoPersonaleTableViewCell.m
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPSegnoPersonaleTableViewCell.h"
#import "Segno.h"
#import "SegnoPersonale.h"
#import "SegnoTag.h"

@interface EAPSegnoPersonaleTableViewCell ()

@property (strong,nonatomic) Segno *segno;

@end

@implementation EAPSegnoPersonaleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    } else if ([string isEqualToString:@","]){
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    // inserisce il tag per il segnoPersonale della cella
    [self insertSegnoTagWithDescrizione:textField.text];
    //[self.delegate reloadDataOnTableView:self];
    //textField.text = @"";
    //textField.placeholder = @"placeholder3";
}

-(void)addMeToSubviews:(SBRTTokenView *)view {
    if (![[self.containerTokenView subviews] containsObject:view]) {
        [self.containerTokenView addSubview:view];
    }
}

-(void)insertSegnoTagWithDescrizione:(NSString *)text {
    SegnoTag *tag =[NSEntityDescription insertNewObjectForEntityForName:@"SegnoTag" inManagedObjectContext:[self.segnoPersonale managedObjectContext]];
    [tag setDescrizione:text];
    [self.segnoPersonale addTagsObject:tag];
}

@end
