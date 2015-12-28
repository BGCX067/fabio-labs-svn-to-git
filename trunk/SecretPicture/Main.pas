unit Main;

interface

uses
  SecretePicture,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG;

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
begin
  showPicture(1);
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
  Result := TSecretePicture.Create;
  Result.Id := 1;
  Result.Year := '2012';
  Result.Month := '11';
  try
    getImage(Result);
  except

  end;
end;

procedure TForm2.showPicture(Id: integer);
var
 ShowPicture : TFShowPicture;
begin
  ShowPicture := TFShowPicture.Create(Self, loadPicture(Id) );
  ShowPicture.Show;
end;

end.
