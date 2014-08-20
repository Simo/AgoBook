//
//  EAPAnagraficaViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPAnagraficaViewController.h"
#import "Persona.h"
#import "Lavoro.h"
#import "Famiglia.h"
#import <QuartzCore/QuartzCore.h>
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

#define debug 1

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

-(void) addTextView:(JVFloatLabeledTextView *)element withLabel:(NSString *)label andFrame:(CGRect)frame toView:(UIView *)view
{
    element = [self createJVFLTextViewForElement:element withLabel:label andFrame:frame];
    
    element.delegate = self;
    [view addSubview:element];
}

-(void) refreshInterface {
    self.nomeTextField.text = [self.selectedPerson.nome capitalizedString];
    self.cognomeTextField.text = [self.selectedPerson.cognome capitalizedString];
    self.imageView.image = [[UIImage alloc] initWithData:self.selectedPerson.foto];
    
    self.nucleoTextView.text = self.selectedPerson.famiglia.nucleo;
    self.nucleoCommentiTextView.text = self.selectedPerson.famiglia.commenti;
}

-(void)updateContextFields{
    self.selectedPerson.nome = self.nomeTextField.text;
    self.selectedPerson.cognome = self.cognomeTextField.text;
    self.selectedPerson.famiglia.nucleo = self.nucleoTextView.text;
    self.selectedPerson.famiglia.commenti = self.nucleoCommentiTextView.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // crea un oggetto LAVORO in caso non esista
    if(!self.selectedPerson.lavoro){
        Lavoro *lavoro = [NSEntityDescription insertNewObjectForEntityForName:@"Lavoro" inManagedObjectContext:self.selectedPerson.managedObjectContext];
        [self.selectedPerson setLavoro:lavoro];
    }
    // crea un oggetto FAMIGLIA in caso non esista
    if(!self.selectedPerson.famiglia){
        Famiglia *famiglia = [NSEntityDescription insertNewObjectForEntityForName:@"Famiglia" inManagedObjectContext:self.selectedPerson.managedObjectContext];
        [self.selectedPerson setFamiglia:famiglia];
    }

    // inserisce un textfield per il campo NOME
    // imposta il delegato
    // aggiunge l'oggetto alla scrollview
    self.nomeTextField = [self createJVFLTextFieldForElement:self.nomeTextField withLabel:@"Nome" andFrame:CGRectMake(442.0, 125.0, 175.0, 44.0)];
    self.nomeTextField.delegate = self;
    [self.scrollView addSubview:self.nomeTextField];
    [self.scrollView addSubview:[self generateBorderForTextField:self.nomeTextField]];
    
    // inserisce un textfield per il campo COGNOME
    // imposta il delegato
    // aggiunge l'oggetto alla scrollview
    self.cognomeTextField = [self createJVFLTextFieldForElement:self.cognomeTextField withLabel:@"Cognome" andFrame:CGRectMake(442.0, 176.0, 175.0, 44.0)];
    self.cognomeTextField.delegate = self;
    [self.scrollView addSubview:self.cognomeTextField];
    [self.scrollView addSubview:[self generateBorderForTextField:self.cognomeTextField]];
    
    // inserisce un textfield per il campo DATANASCITA
    // imposta il delegato
    // aggiunge l'oggetto alla scrollview
    self.dataNascitaTextField = [self createJVFLTextFieldForElement:self.dataNascitaTextField withLabel:@"Data di nascita" andFrame:CGRectMake(442.0, 225.0, 175.0, 44.0)];
    self.dataNascitaTextField.delegate = self;
    [self.scrollView addSubview:self.dataNascitaTextField];
    [self.scrollView addSubview:[self generateBorderForTextField:self.dataNascitaTextField]];
    
    // inserisce un textfield per il campo NUCLEOFAMILIARE
    // imposta il delegato
    // aggiunge l'oggetto alla scrollview
    self.nucleoTextView = [self createJVFLTextViewForElement:self.nucleoTextView withLabel:@"Nucleo familiare" andFrame:CGRectMake(20.0,424.0,650.0,88.0)];
    self.nucleoTextView.delegate = self;
    //[self.nucleoTextView setBackgroundColor:[UIColor lightGrayColor]];
    
    [self.scrollView addSubview:self.nucleoTextView];
    [self.scrollView addSubview:[self generateBorderForTextView:self.nucleoTextView]];
    
    // inserisce un textfield per il campo COMMENTINUCLEO
    // imposta il delegato
    // aggiunge l'oggetto alla scrollview
    self.nucleoCommentiTextView = [self createJVFLTextViewForElement:self.nucleoCommentiTextView withLabel:@"Commenti" andFrame:CGRectMake(20.0,540.0,650.0,88.0)];
    self.nucleoCommentiTextView.delegate = self;
    [self.scrollView addSubview:self.nucleoCommentiTextView];
    [self.scrollView addSubview:[self generateBorderForTextView:self.nucleoCommentiTextView]];
    
    // imposta i dati all'interno dei campi
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
    [self updateContextFields];
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
