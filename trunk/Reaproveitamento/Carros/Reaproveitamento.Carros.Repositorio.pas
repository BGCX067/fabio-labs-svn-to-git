unit Reaproveitamento.Carros.Repositorio;

interface

Uses
  DBClient,
  Generics.Collections,
  Reaproveitamento.Carros.Negocio;

type
  TRepositorioCarro = class(TClientDataSet)
  public
    function obterLista():TList<TCarro>;
    constructor create(AXMLFilePath : string);
  end;

implementation

{ TRepositorioCarro }

constructor TRepositorioCarro.create(AXMLFilePath: string);
begin
  Inherited Create(Nil);
  LoadFromFile(AXMLFilePath);
end;

function TRepositorioCarro.obterLista: TList<TCarro>;
begin
  Result := TList<TCarro>.Create;
  First;
  while not(Eof) do
  begin
    Result.Add( TCarro.create(FieldByName('id').AsInteger, FieldByName('name').AsString) );
    Next;
  end;
end;

end.
