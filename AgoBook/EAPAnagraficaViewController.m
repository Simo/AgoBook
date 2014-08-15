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

-(void) refreshInterface {
    self.txtNome.text = [self.selectedPerson.nome capitalizedString];
    self.txtCognome.text = [self.selectedPerson.cognome capitalizedString];
    self.imageView.image = [[UIImage alloc] initWithData:self.selectedPerson.foto];
    
    self.textNucleo.text = self.selectedPerson.famiglia.nucleo;
    self.textNucleoCommenti.text = self.selectedPerson.famiglia.commenti;
}

-(void)updateContextFields{
    self.selectedPerson.nome = self.txtNome.text;
    self.selectedPerson.cognome = self.txtCognome.text;
}

-(void)updateContextTextViews{
    self.selectedPerson.famiglia.nucleo = self.textNucleo.text;
    self.selectedPerson.famiglia.commenti = self.textNucleoCommenti.text;
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
    [self.textNucleoCommenti setDelegate:self];
    //[self.delegate populateAnagraficaViewFields:self];
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
