//
//  EAPStoriaMedicaViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPStoriaMedicaViewController.h"
#import "Persona.h"
#import "StoriaMedica.h"

@interface EAPStoriaMedicaViewController ()

@end

@implementation EAPStoriaMedicaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) activateDelegate
{
    self.incidentiTextView.delegate = self;
    self.interventiTextView.delegate = self;
    self.ricoveriTextView.delegate = self;
    self.partiColpiteTextView.delegate = self;
    self.effettiCollateraliTextView.delegate = self;
    self.storiaMFamigliaTextView.delegate = self;
}

-(void) refreshInterface
{
    self.incidentiTextView.text = self.selectedPerson.storiamedica.incidenti;
    self.interventiTextView.text = self.selectedPerson.storiamedica.interventi;
    self.ricoveriTextView.text = self.selectedPerson.storiamedica.ricoveri;
    self.partiColpiteTextView.text = self.selectedPerson.storiamedica.partiColpite;
    self.effettiCollateraliTextView.text = self.selectedPerson.storiamedica.effettiCollaterali;
    self.storiaMFamigliaTextView.text = self.selectedPerson.storiamedica.storiaMedicaFamiglia;
}

-(void)updateContextTextViews
{
    self.selectedPerson.storiamedica.incidenti = self.incidentiTextView.text;
    self.selectedPerson.storiamedica.interventi = self.interventiTextView.text;
    self.selectedPerson.storiamedica.ricoveri = self.ricoveriTextView.text;
    self.selectedPerson.storiamedica.partiColpite = self.partiColpiteTextView.text;
    self.selectedPerson.storiamedica.effettiCollaterali = self.effettiCollateraliTextView.text;
    self.selectedPerson.storiamedica.storiaMedicaFamiglia = self.storiaMFamigliaTextView.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(!self.selectedPerson.storiamedica){
        StoriaMedica *storiamedica = [NSEntityDescription insertNewObjectForEntityForName:@"StoriaMedica" inManagedObjectContext:self.selectedPerson.managedObjectContext];
        [self.selectedPerson setStoriamedica:storiamedica];
    }
    [self activateDelegate];
    [self refreshInterface];
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    [self updateContextTextViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
