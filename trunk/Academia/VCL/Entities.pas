unit Entities;

interface

uses
  Windows, Messages, SysUtils, Classes, Variants;

type
  TSexo = (sMasculino, sFeminino);

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
    FSexo : TSexo;
    FHeight: Double;
    FWeight: Double;
    FLogradouro: string;
    FBairro: string;
    FUF: string;
    FCEP: string;
    FNumero: string;
    FComplemento: string;
    FCidade: string;
  public
    property Name : string read FNome write FNome;
    property DOB : TDateTime read FDOB write FDOB;
    property Sexo : TSexo read FSexo write FSexo;
    property Weight : Double read FWeight write FWeight;
    property Height : Double read FHeight write FHeight;
    property CEP : string read FCEP write FCEP;
    property Logradouro : string read FLogradouro write FLogradouro;
    property Numero : string read FNumero write FNumero;
    property Complemento : string read FComplemento write FComplemento;
    property Cidade : string read FCidade write FCidade;
    property UF : string read FUF write FUF;
    property Bairro : string read FBairro write FBairro;
  end;

  TAluno = class(TPessoa)
  private
    Fid : Integer;
    FFoto: TMemoryStream;
    FEmail: string;
    FFoneOutro: string;
    FCelular: string;
    procedure setFoto(stream : TMemoryStream);
    function getFoto():TMemoryStream;
  public
    constructor create();

    property Celular : string read FCelular write FCelular;
    property FoneOutro : string read FFoneOutro write FFoneOutro;
    property Email : string read FEmail write FEmail;
    property Foto : TMemoryStream read getFoto write setFoto;
  end;

  TPagamento = class(TEntidade)
  private
    FValor: Currency;
    FData: TDateTime;
    FDescricao: string;
    FMatriculaID: Integer;
  public
    property MatriculaID : Integer read FMatriculaID write FMatriculaID;
    property Descricao : string read FDescricao write FDescricao;
    property Data : TDateTime read FData write FData;
    property Valor : Currency read FValor write FValor;
  end;

  TArrayOfPagamento = array of TPagamento;

  TMatricula = class(TEntidade)
  private
    FAluno: TAluno;
    FData: TDateTime;
    FPagamentos: TArrayOfPagamento;
    Id : Integer; // mudar a visibilidade da variavel TEntites Id
  public
    property Matricula : Integer read FId write FId;
    property Aluno : TAluno read FAluno write FAluno;
    property Data : TDateTime read FData write FData;
    property Pagamentos : TArrayOfPagamento read FPagamentos write FPagamentos;
  end;

  TProduto = class(TEntidade)
  private
    FDescricao : string;
    FValor : Currency;
  public
    property Descricao : string read FDescricao write FDescricao;
    property Valor : Currency read FValor write FValor;
  end;

implementation

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
