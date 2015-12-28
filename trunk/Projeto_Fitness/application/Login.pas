unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFLogin = class(TFformBase)
    Panel: TPanel;
    btnCancelar: TButton;
    btnEntrar: TButton;
    Label1: TLabel;
    edLogin: TEdit;
    edSenha: TEdit;
    Label2: TLabel;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses DMUsuario, CadastroUsuario, menu;

procedure TFLogin.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TFLogin.btnEntrarClick(Sender: TObject);
begin
  inherited;
  if Usuario.verificaCrediciais(edLogin.Text, edSenha.Text) then
  begin
    FMenu.Visible := True;
    Self.Visible := False;
  end
  else
  begin
    ShowMessage('Usuario ou senha inválidos!');
  end;
end;

procedure TFLogin.FormShow(Sender: TObject);
begin
  inherited;
  edLogin.SetFocus;
end;

end.
