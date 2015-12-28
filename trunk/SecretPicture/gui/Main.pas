unit Main;

interface

uses
  SecretePicture,
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  JPEG,
  Generics.Collections, ControlPicture;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure showPicture(Id : integer);
    function loadPicture(Id : integer):TSecretePicture;
    function getImage(var aImage : TSecretePicture):Boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses ShowPicture;


procedure TForm2.Button1Click(Sender: TObject);
var
  APicture : TSecretePicture;
begin
  APicture := TSecretePicture.create;
  APicture.Id := 2;
  APicture.Year := '2014';
  APicture.Month := '11';
  getImage(APicture);
  TControlPicture.setPicture(APicture);
end;

function TForm2.getImage(var aImage : TSecretePicture):Boolean;
var
  Dialog : TOpenDialog;
begin
  Dialog := TOpenDialog.Create(nil);
  try
    aImage.Picture := TJPEGImage.Create;
    Dialog.Execute();
    if Dialog.FileName <> EmptyStr then
      aImage.Picture.LoadFromFile(Dialog.FileName);
  finally
    Dialog.Free;
  end;
end;

function TForm2.loadPicture(Id: integer): TSecretePicture;
begin
end;

procedure TForm2.showPicture(Id: integer);
var
 ShowPicture : TFShowPicture;
begin
  ShowPicture := TFShowPicture.Create(Self, loadPicture(Id) );
  ShowPicture.Show;
end;

end.
