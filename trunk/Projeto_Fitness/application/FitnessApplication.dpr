program FitnessApplication;

uses
  Vcl.Forms,
  menu in 'menu.pas' {FMenu},
  DMDados in 'dados\DMDados.pas' {Dados: TDataModule},
  DMPersistencia in 'dados\DMPersistencia.pas' {Persistencia: TDataModule},
  DMNegocio in 'negocio\DMNegocio.pas' {Negocio: TDataModule},
  DMUsuario in 'negocio\DMUsuario.pas' {Usuario: TDataModule},
  DMEmpresa in 'negocio\DMEmpresa.pas' {Empresa: TDataModule},
  formBase in 'padrao\formBase.pas' {FformBase},
  formCadastroBase in 'padrao\formCadastroBase.pas' {FformCadastroBase},
  CadastroUsuario in 'CadastroUsuario.pas' {FCadastroUsuario},
  Login in 'Login.pas' {FLogin},
  CadastroEmpresa in 'CadastroEmpresa.pas' {FCadastroEmpresa},
  CadastroAluno in 'CadastroAluno.pas' {FCadastroAluno},
  DMAluno in 'negocio\DMAluno.pas' {Aluno: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TPersistencia, Persistencia);
  Application.CreateForm(TUsuario, Usuario);
  Application.CreateForm(TEmpresa, Empresa);
  Application.CreateForm(TAluno, Aluno);
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
