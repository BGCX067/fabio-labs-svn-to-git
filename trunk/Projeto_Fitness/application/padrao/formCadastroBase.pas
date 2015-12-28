unit formCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFformCadastroBase = class(TFformBase)
    DataSource: TDataSource;
    PageControl1: TPageControl;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    Panel: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    btnGravar: TButton;
    btnExcluir: TButton;
    pnPesquisa: TPanel;
    DBGrid1: TDBGrid;
    edPesquisa: TEdit;
    procedure DataSourceStateChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FformCadastroBase: TFformCadastroBase;

implementation

{$R *.dfm}

procedure TFformCadastroBase.btnCancelarClick(Sender: TObject);
begin
  inherited;
  DataSource.DataSet.Cancel;
end;

procedure TFformCadastroBase.btnEditarClick(Sender: TObject);
begin
  inherited;
  DataSource.DataSet.Edit;
end;

procedure TFformCadastroBase.btnExcluirClick(Sender: TObject);
begin
  inherited;
  DataSource.DataSet.Delete;
end;

procedure TFformCadastroBase.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    DataSource.DataSet.Post;
    if (DataSource.DataSet as TClientDataSet).ChangeCount > 0 then
      (DataSource.DataSet as TClientDataSet).ApplyUpdates(0);
  except
    on e:Exception do
    begin
      (DataSource.DataSet as TClientDataSet).CancelUpdates;
      raise Exception.Create('Erro: ' + e.Message);
    end;
  end;
end;

procedure TFformCadastroBase.btnNovoClick(Sender: TObject);
begin
  inherited;
  DataSource.DataSet.Append;
end;

procedure TFformCadastroBase.DataSourceStateChange(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := DataSource.DataSet.State in [dsBrowse];
  btnEditar.Enabled := DataSource.DataSet.State in [dsBrowse];
  btnCancelar.Enabled := DataSource.DataSet.State in [dsEdit, dsInsert];
  btnGravar.Enabled := DataSource.DataSet.State in [dsEdit, dsInsert];
  btnExcluir.Enabled := DataSource.DataSet.State in [dsBrowse];
end;

procedure TFformCadastroBase.FormCreate(Sender: TObject);
begin
  if DataSource.DataSet <> Nil then
    DataSource.DataSet.Open;
  inherited;

end;

end.
