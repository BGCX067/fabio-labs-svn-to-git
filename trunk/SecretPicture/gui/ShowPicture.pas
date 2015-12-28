unit ShowPicture;

interface

uses
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
  SecretePicture,
  JPEG;

type
  TFShowPicture = class(TForm)
    MainPanel: TPanel;
    LabelTitulo: TLabel;
    LabelId: TLabel;
    LabelYear: TLabel;
    LabelMonth: TLabel;
    LabelLegend: TLabel;
    Panel1: TPanel;
    Image: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FPicture : TSecretePicture;
  public
    { Public declarations }
    constructor create(Owner : TComponent; aPicture : TSecretePicture);
  end;

var
  FShowPicture: TFShowPicture;

implementation

{$R *.dfm}

{ TForm3 }

constructor TFShowPicture.create(Owner : TComponent; aPicture: TSecretePicture);
begin
  Inherited create(Owner);
  FPicture := aPicture;
end;

procedure TFShowPicture.FormShow(Sender: TObject);
begin
  LabelId.Caption := 'Id: ' + IntToStr(FPicture.Id);
  LabelYear.Caption := 'Year: ' + FPicture.Year;
  LabelMonth.Caption := 'Month: ' + FPicture.Month;
  Image.Picture.Assign(FPicture.Picture);
end;

end.


