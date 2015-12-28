program PQuadroDeHorario;

uses
  Forms,
  InterfaceDoUsuario in 'InterfaceDoUsuario.pas' {Form5},
  QuadroDeHorario in '..\QuadroDeHorario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
