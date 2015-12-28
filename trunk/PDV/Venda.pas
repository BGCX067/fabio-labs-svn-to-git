unit Venda;

interface

uses AClassRef, Item, generics.Collections, Classes, SysUtils;

type
  TVenda = class(TAClassRef)
  private
    FId: integer;
    FItens: TList<TItem>;
    FData: TDateTime;
    FCupom : TStringList;
  public
    function getTotalVenda():string;
    function getItens():TStringList;
    function getNumeroCupom():String;
    function getData():String;
    function getCNPF():String;
    procedure addRodapeInfo(info :string);

    property Id : integer read FId write FId;
    property Itens : TList<TItem> read FItens write FItens;
    property Data : TDateTime read FData write FData;

    constructor create();

  end;
implementation

{ TVenda }

procedure TVenda.addRodapeInfo(info: string);
begin
  FCupom.Add(info);
end;

constructor TVenda.create;
begin
  Itens := TList<TItem>.Create;
  FCupom := TStringList.Create;
end;

function TVenda.getCNPF: String;
begin
  Result := '81.741.110/0001-06';
end;

function TVenda.getData: String;
begin
  Result := FormatDateTime('"Data: "dd/mm/yyyy "Hora: "hh:mm',  FData);
end;

function TVenda.getItens: TStringList;
var
  TextoCupom : TStringList;
  Item : TItem;
begin
  TextoCupom := TStringList.Create;
  try
    TextoCupom.Add('                   ' + getCNPF + '                   ');
    TextoCupom.Add('--------------------------------------------------------');
    TextoCupom.Add(getNumeroCupom + '  ' + getData);
    TextoCupom.Add('--------------------------------------------------------');
    TextoCupom.Add('Código      Descrição            QTD   V.Unit  V.Total  ');
    for Item in Itens do
      TextoCupom.Add(FormatFloat('00000000000', Item.Id) +' '+
                     Copy(Item.Descricao +'                    ', 1, 20)+' '+
                     Item.getQuantidade +' '+
                     Item.getValorUnitario + ' ' +
                     Item.getValorTotal);
    if FCupom.Count > 0 then

    Result.AddStrings(FCupom);
    Result := TextoCupom;

  finally
    //TextoCupom.Free;
  end;
end;

function TVenda.getNumeroCupom: String;
begin
  Result := FormatFloat('"Cupom: "00000', FId);
end;

function TVenda.getTotalVenda: string;
var
  Item : TItem;
  Total : double;
begin
  Total := 0;
  for Item in Itens do
    Total := Total + Item.Quantidade * Item.ValorUnitario;
  Result := FormatFloat('"R$ "0,.00', Total);
end;

end.
