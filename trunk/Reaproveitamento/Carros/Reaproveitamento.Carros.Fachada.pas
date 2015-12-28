unit Reaproveitamento.Carros.Fachada;

interface

uses
  Generics.Collections,
  Reaproveitamento.Carros.Negocio,
  Reaproveitamento.Carros.Repositorio, Reaproveitamento.Carros.Controle;

type
  TFachadaCarros = class
  public
    class function obterLista():TList<Tcarro>;
  end;

implementation

{ TFachada }

class function TFachadaCarros.obterLista: TList<Tcarro>;
begin
  Result := TControleCarro.obterLista();
end;

end.
