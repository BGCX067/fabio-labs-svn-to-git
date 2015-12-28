unit mor.Attribut;

interface

Uses
  DB;

Type
  TAttribut = Class
  private
    FAttribName: String;
    FAttribType: TFieldType;
    FAttribSize: Integer;
    procedure SetAttribName(const Value: String);
    procedure SetAttribSize(const Value: Integer);
    procedure SetAttribType(const Value: TFieldType);

  public
    property AttribName : String read FAttribName write SetAttribName;
    property AttribType  : TFieldType read FAttribType write SetAttribType;
    property AttribSize  : Integer read FAttribSize write SetAttribSize;
  End;


implementation

{ TAttribut }

procedure TAttribut.SetAttribName(const Value: String);
begin
  FAttribName := Value;
end;

procedure TAttribut.SetAttribSize(const Value: Integer);
begin
  FAttribSize := Value;
end;

procedure TAttribut.SetAttribType(const Value: TFieldType);
begin
  FAttribType := Value;
end;

end.
