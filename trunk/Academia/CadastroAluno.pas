unit CadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, UMain, ToolEdit
  {$IFDEF D14}
  , rxToolEdit,
  {$ENDIF}
  ;

type
  TFCadastroAluno = class(TForm)
    Edit1: TEdit;
    DateEdit1: TDateEdit;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1DblClick(Sender: TObject);
  private
    { Private declarations }
    Aluno : TAluno;
  public
    { Public declarations }
    constructor create(Aluno : TAluno; Sender: TComponent); overload;
  end;

var
  FCadastroAluno: TFCadastroAluno;

implementation

{$R *.dfm}

procedure TFCadastroAluno.FormShow(Sender: TObject);
begin
  Edit1.Text := Aluno.Name;
  DateEdit1.Date := Aluno.DOB;
  if Aluno.Foto <> nil then
    Image1.Picture.Bitmap.LoadFromStream(Aluno.Foto);
end;

procedure TFCadastroAluno.Image1DblClick(Sender: TObject);
var
  OpenDialog : TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(Self);
  OpenDialog.Filter := '*.bmp|*.bmp';
  try
    if OpenDialog.Execute then
      Image1.Picture.Bitmap.LoadFromFile(OpenDialog.FileName);
  finally
    OpenDialog.Free;
  end;
end;

constructor TFCadastroAluno.create(Aluno: TAluno; Sender: TComponent);
begin
  inherited create(Sender);
  Self.Aluno := Aluno;
end;

procedure TFCadastroAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Aluno.Name := Edit1.Text;
  Aluno.DOB := DateEdit1.Date;
  Image1.Picture.Bitmap.SaveToStream(Aluno.Foto);
end;

end.
