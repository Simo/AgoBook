//
//  EAPAnagraficaViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPAnagraficaViewController.h"
#import "Persona.h"
#import "Famiglia.h"
#import <QuartzCore/QuartzCore.h>
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

#define debug 1

const static CGFloat kJVFieldHeight = 44.0f;
const static CGFloat kJVFieldHMargin = 20.0f;
const static CGFloat kJVFieldFontSize = 16.0f;
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface EAPAnagraficaViewController ()

@end

@implementation EAPAnagraficaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) addTextField:(JVFloatLabeledTextField *)element withLabel:(NSString *)label andFrame:(CGRect)fram toView:(UIView *)view
{
    
}

-(void) addTextView:(JVFloatLabeledTextView *)element withLabel:(NSString *)label andFrame:(CGRect)frame toView:(UIView *)view
{
    element = [self createJVFLTextViewForElement:element withLabel:label andFrame:frame];
    
    element.delegate = self;
    [view addSubview:element];
}

-(void) refreshInterface {
    self.txtNome.text = [self.selectedPerson.nome capitalizedString];
    self.txtCognome.text = [self.selectedPerson.cognome capitalizedString];
    self.imageView.image = [[UIImage alloc] initWithData:self.selectedPerson.foto];
    
    self.textNucleo.text = self.selectedPerson.famiglia.nucleo;
    self.textNucleoCommenti.text = self.selectedPerson.famiglia.commenti;
    self.nucleoCommentiTextView.text = self.selectedPerson.famiglia.commenti;
    NSLog(@"questo e quello che: %@",self.nucleoCommentiTextView);
}

-(void)updateContextFields{
    self.selectedPerson.nome = self.txtNome.text;
    self.selectedPerson.cognome = self.txtCognome.text;
}

-(void)updateContextTextViews{
    self.selectedPerson.famiglia.nucleo = self.textNucleo.text;
    self.selectedPerson.famiglia.commenti = self.textNucleoCommenti.text;
    NSLog(@"questo e quello che: %@",self.nucleoCommentiTextView);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(self.selectedPerson.famiglia == NULL){
        Famiglia *famiglia = [NSEntityDescription insertNewObjectForEntityForName:@"Famiglia" inManagedObjectContext:self.selectedPerson.managedObjectContext];
        [self.selectedPerson setFamiglia:famiglia];
    }

    [self.txtNome setDelegate:self];
    [self.txtCognome setDelegate:self];
    [self.textNucleo setDelegate:self];
    //[self.textNucleoCommenti setDelegate:self];
    //[self.delegate populateAnagraficaViewFields:self];
    
//    CGFloat topOffset = [[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height;
    
    //UIColor *floatingLabelColor = [UIColor brownColor];
    
    // inserisce un textfield
    self.nomeTextField = [self createJVFLTextFieldForElement:self.nomeTextField withLabel:@"Nome" andFrame:CGRectMake(442.0, 126.0, 175.0, 44.0)];
    /*
    self.nomeTextField = [[JVFloatLabeledTextField alloc] initWithFrame:
                                           CGRectMake(200.0, 100.0, 200.0, 44.0)];
    self.nomeTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Title", @"")
                                                                       attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    self.nomeTextField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    self.nomeTextField.floatingLabel.font = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    self.nomeTextField.floatingLabelTextColor = floatingLabelColor;
    self.nomeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    //    titleField.leftView = leftView;
    //    titleField.leftViewMode = UITextFieldViewModeAlways;
    */
    self.nomeTextField.delegate = self;
    [self.scrollView addSubview:self.nomeTextField];
    
    //[self addTextView:self.nucleoCommentiTextView withLabel:@"Commenti" andFrame:CGRectMake(20.0,300.0,200.0,132.0) toView:self.scrollView];
    
    self.nucleoCommentiTextView = [self createJVFLTextViewForElement:self.nucleoCommentiTextView withLabel:@"Commenti" andFrame:CGRectMake(20.0,300.0,200.0,132.0)];
    
    self.nucleoCommentiTextView.delegate = self;
    [self.scrollView addSubview:self.nucleoCommentiTextView];
    
    [self refreshInterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self updateContextFields];
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    [self updateContextTextViews];
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    //aggiunge la persistenza su CD
    self.selectedPerson.foto = UIImagePNGRepresentation(chosenImage);
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)btnPressed:(id)sender
{
    //[self.delegate changeAnagraficaFields:self];
    [self updateContextFields];
}

@end
