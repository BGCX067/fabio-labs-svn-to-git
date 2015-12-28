unit uStep4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, uFormDefault, Data.DB,
  Datasnap.DBClient, Generics.Collections, FMX.Edit, FMX.Layouts, FMX.Memo,
  mor.Attribut, mor.Entity;

type
  TfStep4 = class(TFormDefault)
    cbCreateSigletonDBConnection: TCheckBox;
    cbCreateSliceControl: TCheckBox;
    cbCreateFacadeWithUI: TCheckBox;
    edTargetLocation: TEdit;
    lbTargetLocation: TLabel;
    lbLog: TLabel;
    mmLog: TMemo;
    procedure btnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SelectedTables : TStrings;
  end;

var
  fStep4: TfStep4;

implementation

{$R *.fmx}

uses uStep3, uDM;

procedure TfStep4.btnNextClick(Sender: TObject);
var
  I: Integer;
  Entities : TList<TEntity>;
  J: Integer;
begin
  inherited;
  Entities := TList<TEntity>.Create();
  try
    for I := 0 to Pred( SelectedTables.Count )do
    begin
      Dm.ClientDataSet.Close;
      Dm.ClientDataSet.CommandText := 'SELECT * FROM ' + Trim( SelectedTables.Strings[I] );
      Dm.ClientDataSet.Open;
      Entities.Add(TEntity.Create(edTargetLocation.Text));
      Entities.Items[I].EntityName := SelectedTables.Strings[I];
      for J := 0 to Pred(Dm.ClientDataSet.Fields.Count) do
      begin
        Entities.Items[I].Attributes.Add(TAttribut.Create);
        if J = 0 then
          Entities.Items[I].EntityPKName := Dm.ClientDataSet.Fields[J].FieldName;
        Entities.Items[I].Attributes.Items[J].AttribName := Dm.ClientDataSet.Fields[J].FieldName;
        Entities.Items[I].Attributes.Items[J].AttribType := Dm.ClientDataSet.Fields[J].DataType;
        Entities.Items[I].Attributes.Items[J].AttribSize := Dm.ClientDataSet.Fields[J].Size;
      end;
      try
        Entities.Items[I].builtEntityClass;
        Entities.Items[I].builtEntityRepositoryClass;
        Entities.Items[I].builtEntityControlClass;
        Entities.Items[I].builtEntityFacadeClass;
      except
        on E:Exception do
          mmLog.Lines.Add(E.Message);
      end;
    end;
  Except
    On E:Exception do
      ShowMessage('Error:' + e.Message );
  end;
  Application.Terminate;
end;

procedure TfStep4.FormCreate(Sender: TObject);
begin
  SelectedTables := TStrings.Create;
  inherited;
end;

end.
