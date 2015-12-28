unit CadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formCadastroBase, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DMUsuario, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls;

type
  TFCadastroUsuario = class(TFformCadastroBase)
    edNome: TDBEdit;
    edLogin: TDBEdit;
    edSenha: TDBEdit;
    edConfirmacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbConfirmacao: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure DataSourceStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroUsuario: TFCadastroUsuario;

implementation

{$R *.dfm}

procedure TFCadastroUsuario.btnGravarClick(Sender: TObject);
begin
  if (edSenha.Text <> edConfirmacao.Text) and
     (DataSource.DataSet.State = dsInsert)  then
  begin
    ShowMessage('As senhas não conferem!');
    edSenha.SetFocus;
    Exit;
  end;
  inherited;

end;

procedure TFCadastroUsuario.DataSourceStateChange(Sender: TObject);
begin
  inherited;
  edSenha.Enabled := DataSource.DataSet.State = dsInsert;
  lbConfirmacao.Visible := DataSource.DataSet.State = dsInsert;
  edConfirmacao.Visible := DataSource.DataSet.State = dsInsert;
end;

end.
