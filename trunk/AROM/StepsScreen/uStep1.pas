unit uStep1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, uFormDefault, FMX.ListBox,
  Data.DBXFirebird, Data.DB, Data.SqlExpr;

type
  TfStep1 = class(TFormDefault)
    cbBDEAliasList: TComboBox;
    lbBDEAliasList: TLabel;
    procedure btnNextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStep1: TfStep1;

implementation

{$R *.fmx}

uses uStep2;

procedure TfStep1.btnNextClick(Sender: TObject);
var
  fStep2 : TfStep2;
begin
  inherited;
  fStep2 := TfStep2.Create(Self);
  fStep2.ShowModal;
end;

end.
