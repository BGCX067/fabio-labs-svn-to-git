program ProjectSecretPicture;

uses
  Forms,
  Main in '..\gui\Main.pas' {Form2},
  SecretePicture in '..\business\SecretePicture.pas',
  ShowPicture in '..\gui\ShowPicture.pas' {FShowPicture},
  ControlPicture in '..\control\ControlPicture.pas',
  ADPLFacade in '..\..\..\convertormdelphi\ADPLFacade.pas',
  AClassRef in '..\..\..\convertormdelphi\AClassRef.pas',
  ADPLColumnAttribute in '..\..\..\convertormdelphi\ADPLColumnAttribute.pas',
  ADPLKeyAttribute in '..\..\..\convertormdelphi\ADPLKeyAttribute.pas',
  ADPLTableAttribute in '..\..\..\convertormdelphi\ADPLTableAttribute.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
