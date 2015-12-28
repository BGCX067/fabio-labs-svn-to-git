unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TEntidade = class
  private
    FId: integer;
  public
    property Id : integer read FId write FId;
  end;

  TPessoa = class(TEntidade)
  private
    FNome: string;
    FDOB: TDateTime;
    FHeight: Double;
    FWeight: Double;
  public
    property Name : string read FNome write FNome;
    property DOB : TDateTime read FDOB write FDOB;
    property Weight : Double read FWeight write FWeight;
    property Height : Double read FHeight write FHeight;
  end;

  TAluno = class(TPessoa)
  private
    FFoto: TMemoryStream;
    procedure setFoto(stream : TMemoryStream);
    function getFoto():TMemoryStream;
  public
    constructor create();

    property Foto : TMemoryStream read getFoto write setFoto;

  end;

  TPagamento = class(TEntidade)
  private
    FValor: Currency;
    FData: TDateTime;
  public
    property Data : TDateTime read FData write FData;
    property Valor : Currency read FValor write FValor;
  end;

  TArrayOfPagamento = array of TPagamento;

  TMatricula = class(TEntidade)
  private
    FAluno: TAluno;
    FData: TDateTime;
    FPagamentos: TArrayOfPagamento;

  public
    property Aluno : TAluno read FAluno write FAluno;
    property Data : TDateTime read FData write FData;
    property Pagamentos : TArrayOfPagamento read FPagamentos write FPagamentos;
  end;

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Aluno1: TMenuItem;
    Matrcula1: TMenuItem;
    Sair1: TMenuItem;
    procedure Aluno1Click(Sender: TObject);
  private
    { Private declarations }
    Aluno : TAluno;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses CadastroAluno;

{$R *.dfm}

procedure TForm1.Aluno1Click(Sender: TObject);
var
  CadastroAluno : TFCadastroAluno;
begin
  if Aluno = nil then
    Aluno := TAluno.create;
  CadastroAluno := TFCadastroAluno.create(Aluno, self);
  CadastroAluno.ShowModal;
  ShowMessage(Aluno.Name);
end;

{ TAluno }

constructor TAluno.create;
begin
  inherited;
end;

function TAluno.getFoto: TMemoryStream;
begin
  if FFoto = nil then
    FFoto := TMemoryStream.Create;
  FFoto.position := 0;
  Result := FFoto;
end;

procedure TAluno.setFoto(stream: TMemoryStream);
begin
  stream.Position := 0;
  FFoto.LoadFromStream(stream);
end;


end.
