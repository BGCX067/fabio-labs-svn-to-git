unit SecretePicture;

interface

uses
  JPEG,
  Vcl.Graphics;

Type
  TSecretePicture = class
  private
    FYear: string;
    FPicture: TJPEGImage;
    FMonth: string;
    FId: integer;
  public
    property Id : integer read FId write FId;
    property Year : string read FYear write FYear;
    property Month : string read FMonth write FMonth;
    property Picture : TJPEGImage read FPicture write FPicture;

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

end.
