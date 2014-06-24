//
//  EAPStoriaEmotivaViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPStoriaEmotivaViewController.h"
#import "Persona.h"
#import "StoriaEmotiva.h"

@interface EAPStoriaEmotivaViewController ()

@end

@implementation EAPStoriaEmotivaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) refreshInterface {
    self.txtFieldAutoDescrizione.text = self.selectedPerson.storiaemotiva.autoDescrizione;
    self.txtFieldStoriaPersonale.text = self.selectedPerson.storiaemotiva.storiaPersonale;
}

-(void)updateContextFields{
    self.selectedPerson.storiaemotiva.autoDescrizione = self.txtFieldAutoDescrizione.text;
    self.selectedPerson.storiaemotiva.storiaPersonale = self.txtFieldStoriaPersonale.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.delegate populateStoriaEmotivaFields:self];
    [self refreshInterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [self updateContextFields];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self updateContextFields];
}

@end
