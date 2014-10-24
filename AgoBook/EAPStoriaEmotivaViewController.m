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
    
    NSLog(@"%@",self.selectedPerson.storiaemotiva.colorePref);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.delegate populateStoriaEmotivaFields:self];
    if(!self.selectedPerson.storiaemotiva){
        StoriaEmotiva *storiaEmotiva = [NSEntityDescription insertNewObjectForEntityForName:@"StoriaEmotiva" inManagedObjectContext:self.selectedPerson.managedObjectContext];
        self.selectedPerson.storiaemotiva = storiaEmotiva;
    }
    //[self recuperaStoriaEmotivaPersona:self.selectedPerson];
    self.autodescrizioneTextView = [self createJVFLTextViewForElement:self.autodescrizioneTextView withLabel:@"Autodescrizione" andFrame:CGRectMake(20, 70, 650, 88)];
    [self.autodescrizioneTextView setDelegate:self];
    [self.scrollView addSubview:self.autodescrizioneTextView];
    
    self.storiaPersonaleTextView = [self createJVFLTextViewForElement:self.storiaPersonaleTextView withLabel:@"Storia Emotiva Personale" andFrame:CGRectMake(20, 170, 650, 88)];
    [self.storiaPersonaleTextView setDelegate:self];
    [self.scrollView addSubview:self.storiaPersonaleTextView];
    
    self.cosaNonPiaceTextView = [self createJVFLTextViewForElement:self.cosaNonPiaceTextView withLabel:@"Cosa non piace" andFrame:CGRectMake(20, 560, 650, 88)];
    [self.cosaNonPiaceTextView setDelegate:self];
    [self.scrollView addSubview:self.cosaNonPiaceTextView];
    
    self.colorePreferitoTextField = [self createJVFLTextFieldForElement:self.colorePreferitoTextField withLabel:@"Colore preferito" andFrame:CGRectMake(132, 314, 208, 30)];
    [self.colorePreferitoTextField setDelegate:self];
    [self.scrollView addSubview:self.colorePreferitoTextField];
    
    self.coloreInvisoTextField = [self createJVFLTextFieldForElement:self.coloreInvisoTextField withLabel:@"Colore inviso" andFrame:CGRectMake(364, 314, 208, 30)];
    [self.coloreInvisoTextField setDelegate:self];
    [self.scrollView addSubview:self.coloreInvisoTextField];
    
    self.stagionePreferitaTextField = [self createJVFLTextFieldForElement:self.stagionePreferitaTextField withLabel:@"Stagione preferita" andFrame:CGRectMake(132, 375, 208, 30)];
    [self.stagionePreferitaTextField setDelegate:self];
    [self.scrollView addSubview:self.stagionePreferitaTextField];
    
    self.stagioneInvisaTextField = [self createJVFLTextFieldForElement:self.stagioneInvisaTextField withLabel:@"Stagione invisa" andFrame:CGRectMake(364, 375, 208, 30)];
    [self.stagioneInvisaTextField setDelegate:self];
    [self.scrollView addSubview:self.stagioneInvisaTextField];
    
    self.oraPreferitaTextField = [self createJVFLTextFieldForElement:self.oraPreferitaTextField withLabel:@"Ora preferita" andFrame:CGRectMake(132, 436, 208, 30)];
    [self.oraPreferitaTextField setDelegate:self];
    [self.scrollView addSubview:self.oraPreferitaTextField];
    
    self.oraInvisaTextField = [self createJVFLTextFieldForElement:self.oraInvisaTextField withLabel:@"Ora invisa" andFrame:CGRectMake(364, 436, 208, 30)];
    [self.oraInvisaTextField setDelegate:self];
    [self.scrollView addSubview:self.oraInvisaTextField];
    
    self.saporePreferitoTextField = [self createJVFLTextFieldForElement:self.saporePreferitoTextField withLabel:@"Sapore preferito" andFrame:CGRectMake(132, 503, 208, 30)];
    [self.saporePreferitoTextField setDelegate:self];
    [self.scrollView addSubview:self.saporePreferitoTextField];
    
    self.saporeInvisoTextField = [self createJVFLTextFieldForElement:self.saporeInvisoTextField withLabel:@"Sapore inviso" andFrame:CGRectMake(364, 503, 208, 30)];
    [self.saporeInvisoTextField setDelegate:self];
    [self.scrollView addSubview:self.saporeInvisoTextField];
    
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
