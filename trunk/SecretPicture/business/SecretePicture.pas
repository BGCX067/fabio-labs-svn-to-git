unit SecretePicture;

interface

uses
  JPEG,
  AClassRef,
  DB,
  Graphics,
  ADPLTableAttribute,
  ADPLKeyAttribute,
  ADPLColumnAttribute;

Type
  [TADPLTableAttribute('PICTURE')]
  TSecretePicture = class(TAClassRef)
  private
    FYear: string;
    FPicture: TJPEGImage;
    FMonth: string;
    FId: integer;
  public
    [TADPLKeyAttribute('ID',ftInteger, 'ID', false)]
    [TADPLColumnAttribute('ID', ftInteger, 0, true, true, 'ID', true, '', false, '1')]
    property Id : integer read FId write FId;
    [TADPLColumnAttribute('YEAR', ftString, 4, true, true, 'Year', true, '', false, '1')]
    property Year : string read FYear write FYear;
    [TADPLColumnAttribute('MONTH', ftString, 2, true, true, 'Month', true, '', false, '1')]
    property Month : string read FMonth write FMonth;
    [TADPLColumnAttribute('PICTURE', ftBlob, 0, true, true, 'Picture', true, '', false, '1')]
    property Picture : TJPEGImage read FPicture write FPicture;

    procedure LazyLoad(); override;

    constructor create();
    destructor destroy; override;
  end;

implementation

{ TSecretePicture }

constructor TSecretePicture.create;
begin
end;

destructor TSecretePicture.destroy;
begin
  Picture.Free;
end;

procedure TSecretePicture.LazyLoad;
begin
  inherited;

end;

end.
