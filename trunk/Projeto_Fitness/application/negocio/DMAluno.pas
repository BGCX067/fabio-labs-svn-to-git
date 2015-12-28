unit DMAluno;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TAluno = class(TDataModule)
    DataSetProvider: TDataSetProvider;
    CDSAluno: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSAlunoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Aluno: TAluno;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TAluno.CDSAlunoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsInsert then
  begin
    CDSAluno.FieldByName('ALUNO_ID').AsInteger := 0;
  end;
end;

procedure TAluno.DataModuleCreate(Sender: TObject);
begin
  CDSAluno.Open;
end;

end.
