unit Reaproveitamento.Carros.Controle;

interface

uses
  Generics.Collections,
  Reaproveitamento.Carros.Negocio,
  Reaproveitamento.Carros.Repositorio;

type
  TControleCarro = class
  public
    class function obterLista():TList<TCarro>;
  end;
implementation

{ TControleCarro }

class function TControleCarro.obterLista: TList<TCarro>;
var
  RepositorioCarro : TRepositorioCarro;
begin
  RepositorioCarro := TRepositorioCarro.create('D:\AGFA\xml_data\tb_carro.xml');
  try
    Result := RepositorioCarro.obterLista();
  finally
    RepositorioCarro.Free;
  end;
end;

end.
