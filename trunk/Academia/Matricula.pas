unit Matricula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, rxToolEdit, UMain;

type
  TFMatricula = class(TForm)
    DateEdit1: TDateEdit;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Matricula : TMatricula;
  public
    { Public declarations }
    constructor create(Matricula : TMatricula; sender : TComponent);
  end;

var
  FMatricula: TFMatricula;

implementation

{$R *.dfm}

{ TForm2 }

constructor TFMatricula.create(Matricula: TMatricula; sender: TComponent);
begin
  inherited create(sender);
  Self.Matricula := Matricula;
end;

procedure TFMatricula.FormShow(Sender: TObject);
var
  Aluno : TAluno;
begin
  DateEdit1.Date := Matricula.Data;

  Aluno := TAluno.create;
  Aluno.Name := 'Kátia';
  Aluno.DOB := Now;
  Aluno.Foto.LoadFromFile('D:\Users\fabio.lindemberg\Pictures\images.bmp');
  ComboBox1.AddItem(Aluno.Name, Aluno);
end;

end.


