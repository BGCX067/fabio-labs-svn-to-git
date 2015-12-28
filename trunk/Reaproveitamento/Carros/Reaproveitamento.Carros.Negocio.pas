unit Reaproveitamento.Carros.Negocio;

interface

type
  TCarro = class
  private
    FName: string;
    FId: integer;
  public
    property Id : integer read FId write FId;
    property Name : string read FName write FName;

    constructor create(AId : integer; AName : string);
  end;

implementation

{ TCarro }

constructor TCarro.create(AId: integer; AName: string);
begin
  FId := AId;
  FName := AName;
end;

end.
