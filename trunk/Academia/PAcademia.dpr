program PAcademia;

uses
  Forms,
  UMain in 'UMain.pas' {Form1},
  CadastroAluno in 'CadastroAluno.pas' {FCadastroAluno};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
