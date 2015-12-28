program PDV;

uses
  Vcl.Forms,
  TelaPrincipal in 'TelaPrincipal.pas' {Form2},
  Fachada in 'Fachada.pas',
  AClassRef in 'AClassRef.pas',
  Venda in 'Venda.pas',
  Item in 'Item.pas',
  ControleVenda in 'ControleVenda.pas',
  RepositorioItem in 'RepositorioItem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
