unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Venda,
  Vcl.ActnList;

type
  TForm2 = class(TForm)
    pnDescricaoItem: TPanel;
    pnTotalVenda: TPanel;
    pnQTD: TPanel;
    pnPrecoUnitario: TPanel;
    pnTotalItem: TPanel;
    pnInfoGeral: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    pnCodigo: TPanel;
    Panel15: TPanel;
    pnCumpoFiscal: TPanel;
    Panel13: TPanel;
    reCupomFiscal: TRichEdit;
    pnLogo: TPanel;
    imLogo: TImage;
    edCodigo: TEdit;
    Label1: TLabel;
    ActionList: TActionList;
    acFinalizarVenda: TAction;
    procedure edCodigoExit(Sender: TObject);
    procedure acFinalizarVendaExecute(Sender: TObject);
  private
    { Private declarations }
    venda : Tvenda;
  public
    { Public declarations }
    procedure setDescricaoItem(value : string);
    procedure setTotalVenda(value : string);
    procedure setQTD(value : string);
    procedure setPrecoUnitario(value : string);
    procedure setTotalItem(value : string);
    procedure setInfoGeral(value : string);
    procedure setCupomFiscal(value : TStringList);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Fachada;

{ TForm2 }

procedure TForm2.acFinalizarVendaExecute(Sender: TObject);
begin
  TFachada.FinalizarVenda(venda);
end;

procedure TForm2.edCodigoExit(Sender: TObject);
begin
  if not Assigned( venda ) then
    venda := TFachada.addItem(edCodigo.Text)
  else
    TFachada.addItem(venda, edCodigo.Text);

  setTotalVenda(Venda.getTotalVenda);
  setDescricaoItem(venda.Itens.Last.Descricao);
  setPrecoUnitario(venda.Itens.Last.getValorUnitario);
  setTotalItem(venda.Itens.Last.getValorTotal);
  setQTD(venda.Itens.Last.getQuantidade);
  setCupomFiscal(venda.getItens);
end;

procedure TForm2.setCupomFiscal(value: TStringList);
begin
  reCupomFiscal.Lines := value;
end;

procedure TForm2.setDescricaoItem(value: string);
begin
  pnDescricaoItem.Caption := Value;
end;

procedure TForm2.setInfoGeral(value: string);
begin
  pnInfoGeral.Caption := value;
end;

procedure TForm2.setPrecoUnitario(value: string);
begin
  pnPrecoUnitario.Caption := value;
end;

procedure TForm2.setQTD(value: string);
begin
  pnQTD.Caption := value;
end;

procedure TForm2.setTotalItem(value: string);
begin
  pnTotalItem.Caption := value;
end;

procedure TForm2.setTotalVenda(value: string);
begin
  pnTotalVenda.Caption := value;
end;

end.
