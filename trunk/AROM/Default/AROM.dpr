program AROM;

uses
  FMX.Forms,
  uFormDefault in 'uFormDefault.pas' {FormDefault},
  uStep1 in '..\StepsScreen\uStep1.pas' {fStep1},
  uStep2 in '..\StepsScreen\uStep2.pas' {fStep2},
  uStep3 in '..\StepsScreen\uStep3.pas' {fStep3},
  uStep4 in '..\StepsScreen\uStep4.pas' {fStep4},
  uDM in '..\Data\uDM.pas' {DM: TDataModule},
  mor.Attribut in 'mor.Attribut.pas',
  mor.Entity in 'mor.Entity.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfStep1, fStep1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
