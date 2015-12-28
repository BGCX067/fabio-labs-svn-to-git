program VCLUserInterface;

uses
  Forms,
  Menu in 'Menu.pas' {FMenu},
  FormCadastro in 'FormCadastro.pas' {FFormCadastro},
  CadastroAluno in 'CadastroAluno.pas' {FCadastroAluno},
  Matricula in 'Matricula.pas' {FMatricula},
  Entities in 'Entities.pas',
  CadastroProduto in 'CadastroProduto.pas' {FCadastroProduto},
  Constants in 'Constants.pas',
  Pagamento in 'Pagamento.pas' {FPagamento},
  PesquisaPadrao in 'PesquisaPadrao.pas' {frmPesquisaPadrao},
  PesquisaAluno in 'PesquisaAluno.pas' {fPesquisaAluno};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
