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
    self.incidentiTextView = [self createJVFLTextViewForElement:self.incidentiTextView withLabel:@"Incidenti" andFrame:CGRectMake(20, 100, 650, 88)];
    [self.incidentiTextView setDelegate:self];
    [self.scrollView addSubview:self.incidentiTextView];
    
    self.interventiTextView = [self createJVFLTextViewForElement:self.interventiTextView withLabel:@"Interventi" andFrame:CGRectMake(20, 200, 650, 88)];
    [self.interventiTextView setDelegate:self];
    [self.scrollView addSubview:self.interventiTextView];
    
    self.ricoveriTextView = [self createJVFLTextViewForElement:self.ricoveriTextView withLabel:@"Ricoveri" andFrame:CGRectMake(20, 300, 650, 88)];
    [self.ricoveriTextView setDelegate:self];
    [self.scrollView addSubview:self.ricoveriTextView];
    
    self.partiColpiteTextView = [self createJVFLTextViewForElement:self.partiColpiteTextView withLabel:@"Parti colpite" andFrame:CGRectMake(20, 400, 650, 88)];
    [self.partiColpiteTextView setDelegate:self];
    [self.scrollView addSubview:self.partiColpiteTextView];
    
    self.effettiCollateraliTextView = [self createJVFLTextViewForElement:self.effettiCollateraliTextView withLabel:@"Effetti collaterali" andFrame:CGRectMake(20, 500, 650, 88)];
    [self.effettiCollateraliTextView setDelegate:self];
    [self.scrollView addSubview:self.effettiCollateraliTextView];
    
    self.storiaMFamigliaTextView = [self createJVFLTextViewForElement:self.storiaMFamigliaTextView withLabel:@"Storia Medica Familiare" andFrame:CGRectMake(20, 600, 650, 88)];
    [self.storiaMFamigliaTextView setDelegate:self];
    [self.scrollView addSubview:self.storiaMFamigliaTextView];
    
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
