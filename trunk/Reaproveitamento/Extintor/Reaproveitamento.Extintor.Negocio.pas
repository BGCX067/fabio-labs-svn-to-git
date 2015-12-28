unit Reaproveitamento.Extintor.Negocio;

interface

uses
  Generics.Collections,
  ADPLTableAttribute,
  ADPLColumnAttribute,
  ADPLKeyAttribute,
  AClassRef,
  DB,
  ADPLTypes,
  Reaproveitamento.Extintor.AppConfig;

type
  TSexo = (sMasculino, sFeminino);

  TEmpresa = class
  private
    FId: integer;
    FCNPJ: string;
    FFantasia: string;
    FRazao: string;
  public
    property Id : integer read FId;
    property Fantasia : string read FFantasia write FFantasia;
    property Razao : string read FRazao write FRazao;
    property CNPJ : string read FCNPJ write FCNPJ;
  end;

  TCliente = class
  private
    FId: integer;
    FNascimento: TDateTime;
    FSexo: TSexo;
    FNome: string;
  public
    property Id : integer read FId;
    property Nome : string read FNome write FNome;
    property Sexo : TSexo read FSexo write FSexo;
    property Nascimento : TDateTime read FNascimento write FNascimento;
  end;

  [TADPLTableAttribute('TIPO_EXTINTOR')]
  TTipoExtintor = class(TAClassRef)
  private
    FDescricao: string;
    FId: integer;
  public
    [TADPLKeyAttribute('ID', ftInteger, 'Código', true)]
    [TADPLColumnAttribute('ID', ftInteger, 0, true, true, 'Código', true, '000000', false, '1')]
    property Id : integer read FId write FId;
    [TADPLColumnAttribute('DESCRICAO', ftString, 20, true, false, 'Descrição', true, '', false, '2')]
    property DESCRICAO : string read FDescricao write FDescricao;

    procedure LazyLoad(); override;
  end;

  [TADPLTableAttribute('CAPACIDADE')]
  TCapacidadeExtintor = class(TAClassRef)
  private
    FId: integer;
    FValor: integer;
  public
    [TADPLKeyAttribute('ID', ftInteger, 'Código', true)]
    [TADPLColumnAttribute('ID', ftInteger, 0, true, true, 'Código', true, '000000', false, '1')]
    property Id : integer read FId write FId;
    [TADPLColumnAttribute('VALOR', ftInteger, 0, true, false, 'Capacidade', true, '', false, '2')]
    property VALOR : integer read FValor write FValor;

    procedure LazyLoad(); override;
  end;

  TPeca = class
  private
    FId: integer;
    FDescricao: string;
  public
    property Id : integer read FId;
    property Descricao : string read FDescricao write FDescricao;
  end;

  TPecas = TList<TPeca>;

  [TADPLTableAttribute('FABRICANTE')]
  TFabricante = class(TAClassRef)
  private
    FId: integer;
    FDescricao: string;
  public
    [TADPLKeyAttribute('ID', ftInteger, 'Código', true)]
    [TADPLColumnAttribute('ID', ftInteger, 0, true, true, 'Código', true, '000000', false, '1')]
    property Id : integer read FId write FId;
    [TADPLColumnAttribute('DESCRICAO', ftString, 20, true, false, 'Descrição', true, '', false, '2')]
    property Descricao : string read FDescricao write FDescricao;

    procedure LazyLoad(); override;

    constructor Create(); overload;
    constructor Create(AId : integer; ADescricao : string); overload;
  end;

  [TADPLTableAttribute('EXTINTOR')]
  TExtintor = class(TAClassRef)
  private
    FId: integer;
    FAnoFabricacao: string;
    FCapacidade: TCapacidadeExtintor;
    FTipo: TTipoExtintor;
    FFabricante: TFabricante;
    FCapacidadeID: integer;
    FFabricanteID: integer;
    FCODIGO_BARRA: string;
    FTipoExtintorID: integer;
    FCodigoBarra: string;
  public
    [TADPLKeyAttribute('ID', ftInteger, 'Código', true)]
    [TADPLColumnAttribute('ID', ftInteger, 0, true, true, 'Código', true, '000000', false, '1')]
    property Id : integer read FId write FId;
    [TADPLColumnAttribute('TIPO_EXTINTOR_ID', ftInteger, 0, true, false, 'Tipo', true, '', false, '2')]
    property TipoExtintorID : integer read FTipoExtintorID write FTipoExtintorID;
    [TADPLColumnAttribute('CAPACIDADE_ID', ftInteger, 0, true, false, 'Capacidade', true, '', false, '3')]
    property CapacidadeID : integer read FCapacidadeID write FCapacidadeID;
    [TADPLColumnAttribute('FABRICANTE_ID', ftInteger, 0, true, true, 'Código', true, '', false, '4')]
    property FabricanteID : integer read FFabricanteID write FFabricanteID;
    [TADPLColumnAttribute('ANO_FABRICACAO', ftString, 4, true, false, 'Ano Fabricação', true, '', false, '5')]
    property AnoFabricacao : string read FAnoFabricacao write FAnoFabricacao;
    [TADPLColumnAttribute('CODIGO_BARRA', ftString, 13, true, false, 'Código de Barras', true, '', false, '6')]
    property CodigoBarra : string read FCodigoBarra write FCodigoBarra;

    // Objetos carregados através de LazyLoad
    property Tipo : TTipoExtintor read FTipo write FTipo;
    property Fabricante : TFabricante read FFabricante write FFabricante;
    property Capacidade : TCapacidadeExtintor read FCapacidade write FCapacidade;

    procedure LazyLoad(); override;

  end;

  TItensOrdemServico = class
  private
    FId: integer;
    FOSId: integer;
    FSelo: string;
    FPecas: TPecas;
    FExtintor: TExtintor;
  public
    property Id : integer read FId;
    property OSId : integer read FOSId write FOSId;
    property Extintor : TExtintor read FExtintor write FExtintor;
    property Selo : string read FSelo write FSelo;
    property Pecas : TPecas read FPecas write FPecas;

    constructor create();
    destructor destroy(); overload;
  end;

  TItensOS = TList<TItensOrdemServico>;

  TOrdemServico = class
  private
    FId: integer;
    FItens: TItensOS;
    FCliente: TCLiente;
    FData: TDateTime;
  public
    property Id : integer read FId;
    property Data : TDateTime read FData write FData;
    property Cliente : TCLiente read FCliente write FCliente;
    property Itens : TItensOS read FItens write FItens;

    constructor create();
    destructor destroy();
  end;

implementation

uses
  ADPLHelper, ADPLFacade, SysUtils, Reaproveitamento.Extintor.Excecoes;

{ TItensOrdemServico }

constructor TItensOrdemServico.create;
begin
  Pecas := TPecas.Create;
end;

destructor TItensOrdemServico.destroy;
begin
  Pecas.Free;
end;

{ TOrdemServico }

constructor TOrdemServico.create;
begin
  Itens := TItensOS.Create;
end;

destructor TOrdemServico.destroy;
begin
  Itens.Free;
end;

{ TExtintor }
procedure TExtintor.LazyLoad;
var
  Fac : TADPLFacade;
  Helper : THelper;
begin
  Fac := TADPLFacade.NewInstance;
  Helper := Fac.OpenConnect(C_TEXTODACONEXAO, C_PROVIDER);
  try
    TAClassRef(FCapacidade) := Fac.SelectOne(TCapacidadeExtintor.Create, 'ID = ' + intToStr(FCapacidadeId), Helper);
    TAClassRef(FTipo)       := Fac.SelectOne(TTipoExtintor.Create, 'ID = ' + intToStr(FTipoExtintorID), Helper);
    TAClassRef(FFabricante)  := Fac.SelectOne(TFabricante.Create, 'ID = ' + intToStr(FFabricanteID), Helper);
  except
    on e:TExcexaoLazyLoad do
      raise TExcexaoLazyLoad.Create('Erro ao tentar executar LazyLoad!');
  end;
  inherited;
end;

{ TFabricante }

constructor TFabricante.Create;
begin

end;

constructor TFabricante.Create(AId: integer; ADescricao: string);
begin
  FId := AId;
  FDescricao := ADescricao;
end;

procedure TFabricante.LazyLoad;
begin
  inherited;

end;

{ TTipoExtintor }

procedure TTipoExtintor.LazyLoad;
begin
  inherited;

end;

{ TCapacidadeExtintor }

procedure TCapacidadeExtintor.LazyLoad;
begin
  inherited;

end;

end.
