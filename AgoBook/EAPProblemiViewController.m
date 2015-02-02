//
//  EAPProblemiViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPProblemiViewController.h"

@interface EAPProblemiViewController ()

@end

@implementation EAPProblemiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) refreshInterface
{
    self.manifestazioneTextView.text = self.trattamento.anamnesi.manifestazione;
    self.sintomiTextView.text = self.trattamento.anamnesi.sintomi;
    self.evidenzeTextView.text = self.trattamento.esameObiettivo.evidenze;
    self.descrizioneTextView.text = self.trattamento.diagnosi.descrizione;
}

-(void)updateContextTextViews
{
    self.trattamento.anamnesi.manifestazione = self.manifestazioneTextView.text;
    self.trattamento.anamnesi.sintomi = self.sintomiTextView.text;
    self.trattamento.esameObiettivo.evidenze = self.evidenzeTextView.text;
    self.trattamento.diagnosi.descrizione = self.descrizioneTextView.text;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(!self.trattamento.anamnesi){
        Anamnesi *anamnesi = [NSEntityDescription insertNewObjectForEntityForName:@"Anamnesi" inManagedObjectContext:self.trattamento.managedObjectContext];
        [self.trattamento setAnamnesi:anamnesi];
    }
    if (!self.trattamento.esameObiettivo) {
        EsameObiettivo *esameObiettivo = [NSEntityDescription insertNewObjectForEntityForName:@"EsameObierttivo" inManagedObjectContext:self.trattamento.managedObjectContext];
        [self.trattamento setEsameObiettivo:esameObiettivo];
    }
    if (!self.trattamento.diagnosi) {
        Diagnosi *diagnosi = [NSEntityDescription insertNewObjectForEntityForName:@"Diagnosi" inManagedObjectContext:self.trattamento.managedObjectContext];
        [self.trattamento setDiagnosi:diagnosi];
    }
    self.manifestazioneTextView = [self createJVFLTextViewForElement:self.manifestazioneTextView withLabel:@"Manifestazioni" andFrame:CGRectMake(0, 50, 480, 55)];
    [self.manifestazioneTextView setDelegate:self];
    [self.view addSubview:self.manifestazioneTextView];
    self.sintomiTextView = [self createJVFLTextViewForElement:self.sintomiTextView withLabel:@"Sintomi" andFrame:CGRectMake(0, 105, 480, 55)];
    [self.sintomiTextView setDelegate:self];
    [self.view addSubview:self.sintomiTextView];
    self.evidenzeTextView = [self createJVFLTextViewForElement:self.evidenzeTextView withLabel:@"Evidenze" andFrame:CGRectMake(0, 160, 480, 55)];
    [self.sintomiTextView setDelegate:self];
    [self.view addSubview:self.evidenzeTextView];
    self.descrizioneTextView = [self createJVFLTextViewForElement:self.descrizioneTextView withLabel:@"Descrizione" andFrame:CGRectMake(0, 215, 480, 55)];
    [self.sintomiTextView setDelegate:self];
    [self.view addSubview:self.descrizioneTextView];
    
    [self refreshInterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(IBAction)apriNuovaSeduta:(id)sender {
    [self.delegate apriNuovaSedutaViewController:self];
}

@end
