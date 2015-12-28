program ProjectSecretPicture;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form2},
  SecretePicture in 'SecretePicture.pas',
  ShowPicture in 'ShowPicture.pas' {FShowPicture};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
