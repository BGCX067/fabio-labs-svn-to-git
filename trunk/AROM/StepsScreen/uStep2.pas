unit uStep2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, uFormDefault, FMX.Edit;

type
  TfStep2 = class(TFormDefault)
    lbAliasName: TLabel;
    lbMyAliasName: TLabel;
    edUser: TEdit;
    edPassword: TEdit;
    lbUser: TLabel;
    lbPassword: TLabel;
    btnTestConnection: TButton;
    procedure btnNextClick(Sender: TObject);
    procedure btnTestConnectionClick(Sender: TObject);
    procedure edUserExit(Sender: TObject);
    procedure edPasswordExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStep2: TfStep2;

implementation

{$R *.fmx}

uses uStep3, uDM;

procedure TfStep2.btnNextClick(Sender: TObject);
var
  fStep3 : TfStep3;
begin
  inherited;
  try
    DM.SQLConnection.Connected := True;
    fStep3 := TfStep3.Create(Self);
    fStep3.ShowModal;
  Except
    ShowMessage('Error: Problems to make connection!');
  end;
end;

procedure TfStep2.btnTestConnectionClick(Sender: TObject);
begin
  inherited;
  try
    DM.SQLConnection.Connected := True;
    ShowMessage('Connected!');
  Except
    ShowMessage('Error: Problems to make connection!');
  end;
end;

procedure TfStep2.edPasswordExit(Sender: TObject);
begin
  inherited;
  DM.SQLConnection.Params.Delete( DM.SQLConnection.Params.IndexOfName('Password') );
  DM.SQLConnection.Params.Add('Password='+edPassWord.Text);
end;

procedure TfStep2.edUserExit(Sender: TObject);
begin
  inherited;
  DM.SQLConnection.Params.Delete( DM.SQLConnection.Params.IndexOfName('User_Name') );
  DM.SQLConnection.Params.Add('User_Name='+edUser.Text);
end;

end.
