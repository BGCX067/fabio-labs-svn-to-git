unit Reaproveitamento.Hospitalar.Negocio;

interface

uses
  Windows,
  Generics.Collections;

type
  TArrayOfString = array of string;

  TProfissional = class
  private
    FName: string;
    FId: integer;
  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;
  end;

  TPrescricao = class
  private
    FIntervalo: string;
    FDescricao: string;
    FResponsavel: TProfissional;
    FICO: TBitmap;
    FId: integer;
    FUnidade: string;
    FDose: string;
    function getMedico: string;
  protected
    property Medico: TProfissional read FResponsavel write FResponsavel;
    property Id: integer read FId write FId;
    property Descricao: string read FDescricao write FDescricao;
    property ICO: TBitmap read FICO write FICO;
    property Intervalo: string read FIntervalo write FIntervalo;
    property Dose: string read FDose write FDose;
    property Unidade: string read FUnidade write FUnidade;
    property Responsavel : string read getMedico;
  end;

  TMedicamento = class(TPrescricao)
  private
    FVia: string;
    FItens: TList<TMedicamento>;
    FHorarios: string;
  public
    property Medico;
    property Id;
    property Descricao;
    property ICO;
    property Intervalo;
    property Dose;
    property Unidade;
    property Responsavel;
    property Via: string read FVia write FVia;
    property Itens: TList<TMedicamento>read FItens write FItens;
    property Horarios : string read FHorarios write FHorarios;

    constructor create(); overload;
    constructor create(Id: integer; Descricao: string; Interfalo: string; Dose: string; Unidade: string; Via: string); overload;
  end;

  TDieta = class(TPrescricao)
  private
    FVia: string;
  public
    property Medico;
    property Id;
    property Descricao;
    property ICO;
    property Intervalo;
    property Dose;
    property Unidade;
    property Via: string read FVia write FVia;
  end;

  TCuidado = class(TPrescricao)
  public
    property Medico;
    property Id;
    property Descricao;
    property ICO;
    property Intervalo;
    property Dose;
    property Unidade;
  end;

  THemoComponente = class(TPrescricao)
  public
    property Medico;
    property Id;
    property Descricao;
    property ICO;
    property Intervalo;
    property Dose;
    property Unidade;
  end;

implementation

{ TMedicamento }

constructor TMedicamento.create(Id: integer; Descricao, Interfalo: string; Dose: string; Unidade, Via: string);
begin
  Itens := TList<TMedicamento>.Create;

  FId := Id;
  FDescricao := Descricao;
  FIntervalo := Interfalo;
  FDose := Dose;
  FUnidade := Unidade;
  Fvia := Via;
end;

constructor TMedicamento.create;
begin
  Itens := TList<TMedicamento>.Create;
end;

{ TPrescricao }

function TPrescricao.getMedico: string;
begin
  if FResponsavel <> nil then
    Result := FResponsavel.Name;
end;

end.
