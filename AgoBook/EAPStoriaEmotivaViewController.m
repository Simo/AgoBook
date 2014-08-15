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

#pragma mark - Esiste StoriaEmotiva

-(void) recuperaStoriaEmotivaPersona:(Persona *)persona
{
    if(!persona.storiaemotiva){
        StoriaEmotiva *storiaEmotiva = [NSEntityDescription insertNewObjectForEntityForName:@"StoriaEmotiva" inManagedObjectContext:persona.managedObjectContext];
        persona.storiaemotiva = storiaEmotiva;
    }
}

-(void) impostaDelegato:(id)obj
{
    self.autodescrizioneTextView.delegate = obj;
    self.storiaPersonaleTextView.delegate = obj;
    self.cosaNonPiaceTextView.delegate = obj;
    
    self.colorePreferitoTextField.delegate = obj;
    self.coloreInvisoTextField.delegate = obj;
    self.stagionePreferitaTextField.delegate = obj;
    self.stagioneInvisaTextField.delegate = obj;
    self.oraPreferitaTextField.delegate = obj;
    self.oraInvisaTextField.delegate = obj;
    self.saporePreferitoTextField.delegate = obj;
    self.saporeInvisoTextField.delegate = obj;
}

-(void) refreshInterface
{
    self.autodescrizioneTextView.text = self.selectedPerson.storiaemotiva.autoDescrizione;
    self.storiaPersonaleTextView.text = self.selectedPerson.storiaemotiva.storiaPersonale;
    self.cosaNonPiaceTextView.text = self.selectedPerson.storiaemotiva.cosaNonPiace;
    
    self.colorePreferitoTextField.text = self.selectedPerson.storiaemotiva.colorePref;
    self.coloreInvisoTextField.text = self.selectedPerson.storiaemotiva.coloreOdiato;
    self.stagionePreferitaTextField.text = self.selectedPerson.storiaemotiva.stagionePref;
    self.stagioneInvisaTextField.text = self.selectedPerson.storiaemotiva.stagioneOdiata;
    self.oraPreferitaTextField.text = self.selectedPerson.storiaemotiva.oraMigliore;
    self.oraInvisaTextField.text = self.selectedPerson.storiaemotiva.oraPeggiore;
    self.saporePreferitoTextField.text = self.selectedPerson.storiaemotiva.saporePref;
    self.saporeInvisoTextField.text = self.selectedPerson.storiaemotiva.saporeOdiato;
    
}

-(void)updateContextFields
{
    self.selectedPerson.storiaemotiva.autoDescrizione = self.autodescrizioneTextView.text;
    self.selectedPerson.storiaemotiva.storiaPersonale = self.self.storiaPersonaleTextView.text;
    self.selectedPerson.storiaemotiva.cosaNonPiace= self.cosaNonPiaceTextView.text;
    
    self.selectedPerson.storiaemotiva.colorePref = self.colorePreferitoTextField.text;
    self.selectedPerson.storiaemotiva.coloreOdiato = self.coloreInvisoTextField.text;
    self.selectedPerson.storiaemotiva.stagionePref = self.stagionePreferitaTextField.text;
    self.selectedPerson.storiaemotiva.stagioneOdiata = self.stagioneInvisaTextField.text;
    self.selectedPerson.storiaemotiva.oraMigliore = self.oraPreferitaTextField.text;
    self.selectedPerson.storiaemotiva.oraPeggiore = self.oraInvisaTextField.text;
    self.selectedPerson.storiaemotiva.saporePref = self.saporePreferitoTextField.text;
    self.selectedPerson.storiaemotiva.saporeOdiato = self.saporeInvisoTextField.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.delegate populateStoriaEmotivaFields:self];
    [self recuperaStoriaEmotivaPersona:self.selectedPerson];
    [self impostaDelegato:self];
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
