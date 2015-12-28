unit uStep3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, uFormDefault, FMX.Layouts,
  FMX.ListBox, Data.DBXFirebird, Data.DB, Data.SqlExpr;

type
  TfStep3 = class(TFormDefault)
    lbxAvaliableTables: TListBox;
    lbxSelectedTables: TListBox;
    lbAvaliableTables: TLabel;
    lbSelectedTables: TLabel;
    btnAllTables: TButton;
    procedure btnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbxAvaliableTablesDblClick(Sender: TObject);
    procedure btnAllTablesClick(Sender: TObject);
    procedure lbxSelectedTablesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStep3: TfStep3;

implementation

{$R *.fmx}

uses uStep4, uDM;

procedure TfStep3.btnAllTablesClick(Sender: TObject);
begin
  inherited;
  while lbxAvaliableTables.Items.Count > 0 do
  begin
    lbxSelectedTables.Items.Add( lbxAvaliableTables.Items.Strings[ 0 ] );
    lbxAvaliableTables.Items.Delete( 0 );
  end;
end;

procedure TfStep3.btnNextClick(Sender: TObject);
var
  fStep4 : TfStep4;
begin
  inherited;
  fStep4 := TfStep4.Create(Self);
  fStep4.SelectedTables := lbxSelectedTables.Items;
  fStep4.ShowModal;
end;

procedure TfStep3.FormCreate(Sender: TObject);
begin
  inherited;
  DM.SQLConnection.GetTableNames( lbxAvaliableTables.Items, False );
end;

procedure TfStep3.lbxAvaliableTablesDblClick(Sender: TObject);
begin
  inherited;
  lbxSelectedTables.Items.Add( lbxAvaliableTables.Items.Strings[ lbxAvaliableTables.ItemIndex ] );
  lbxAvaliableTables.Items.Delete( lbxAvaliableTables.ItemIndex );
end;

procedure TfStep3.lbxSelectedTablesDblClick(Sender: TObject);
begin
  inherited;
  lbxAvaliableTables.Items.Add( lbxSelectedTables.Items.Strings[ lbxSelectedTables.ItemIndex ] );
  lbxSelectedTables.Items.Delete( lbxSelectedTables.ItemIndex );
end;

end.
