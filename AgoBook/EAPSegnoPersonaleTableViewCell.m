//
//  EAPSegnoPersonaleTableViewCell.m
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPSegnoPersonaleTableViewCell.h"
#import "Segno.h"

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

-(void) setForTokensContainerView:(UIView *)tokensContainerView height:(CGFloat)height width:(CGFloat)width
{
    self.tokensContainerView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, width, height)];
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
        [self.tokens addObject:textField.text];
        [self.tokenView refreshTokenView:self.tokens];
        textField.text = @"";
        textField.placeholder = @"placeholder3";
}

-(void)addMeToSubviews:(SBRTTokenView *)view {
    if(![[self.tokensContainerView subviews] containsObject:view]){
        NSLog(@"aggiungo la subview");
        [self.tokensContainerView addSubview:view];
    }
}

@end
