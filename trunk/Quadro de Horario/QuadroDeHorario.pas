unit QuadroDeHorario;

interface

Uses
  Generics.Collections;

Type
  TPlanilhaDeHorario = class
  private
    FDescricao: string;
    FAula2: string;
    FAula3: string;
    FAula1: string;
    FAula6: string;
    FAula4: string;
    FAula5: string;
  public
    property Descricao : string read FDescricao write FDescricao;
    property Aula1 : string read FAula1 write FAula1;
    property Aula2 : string read FAula2 write FAula2;
    property Aula3 : string read FAula3 write FAula3;
    property Aula4 : string read FAula4 write FAula4;
    property Aula5 : string read FAula5 write FAula5;
    property Aula6 : string read FAula6 write FAula6;

    constructor create(ADescricao, AAula1, AAula2, AAula3, AAula4, AAula5, AAula6 : string); overload;
    constructor create(); overload;
  end;

  TTurno = (TurnoMatinal, TurnoVerpertino, TurnoNoturno);

  TTurma = class
  private
    FId: integer;
    FNome: string;
  public
    property Id : integer read FId write FId;
    property Nome : string read FNome write FNome;
    constructor create(AId : integer; ANome : string);
  End;

  TDisponibilidade = class
  private
    FAula2: Boolean;
    FAula3: Boolean;
    FAula1: Boolean;
    FAula4: Boolean;
    FAula5: Boolean;
    FTurno: TTurno;
  public
    property Turno : TTurno read FTurno write FTurno;
    property Aula1 : Boolean read FAula1 write FAula1;
    property Aula2 : Boolean read FAula2 write FAula2;
    property Aula3 : Boolean read FAula3 write FAula3;
    property Aula4 : Boolean read FAula4 write FAula4;
    property Aula5 : Boolean read FAula5 write FAula5;

    constructor Create(ATurno : TTurno; AAula1, AAula2, AAula3, AAula4, AAula5 : Boolean );
  end;

  TProfessor = class
  private
    FDisponibilidades: TList<TDisponibilidade>;
    FId: integer;
    FNome: string;
  public
    property Id : integer read FId write FId;
    property Nome : string read FNome write FNome;
    property Disponibilidades : TList<TDisponibilidade> read FDisponibilidades write FDisponibilidades;

    constructor Create(AId : integer; ANome : string);
  end;

  TDisciplina = class
  private
    FId: integer;
    FNome: string;
    FProfessores: TList<TProfessor>;
  public
    property Id : integer read FId write FId;
    property Nome : string read FNome write FNome;
    property Professores : TList<TProfessor> read FProfessores write FProfessores;

    Constructor Create(AId : integer; ANome : string);
  end;


implementation

{ TQuadroDeHorario }

constructor TPlanilhaDeHorario.create(ADescricao, AAula1, AAula2, AAula3, AAula4, AAula5, AAula6 : string);
begin
  FDescricao := ADescricao;
  FAula1 := AAula1;
  FAula2 := AAula2;
  FAula3 := AAula3;
  FAula4 := AAula4;
  FAula5 := AAula5;
  FAula6 := AAula6;
end;

constructor TPlanilhaDeHorario.create;
begin
end;

{ TTurma }

constructor TTurma.create(AId: integer; ANome: string);
begin
  FId := AId;
  FNome := ANome;
end;

{ TProfessor }

constructor TProfessor.Create(AId : integer; ANome : string);
begin
  FId := AId;
  FNome := ANome;
  Disponibilidades := TList<TDisponibilidade>.Create;
end;

{ TDisponibilidade }

constructor TDisponibilidade.Create(ATurno: TTurno; AAula1, AAula2, AAula3, AAula4, AAula5: Boolean);
begin
  FTurno := ATurno;
  FAula1 := AAula1;
  FAula2 := AAula2;
  FAula3 := AAula3;
  FAula4 := AAula4;
  FAula5 := AAula5;
end;

{ TDisciplina }

constructor TDisciplina.Create(AId: integer; ANome: string);
begin
  FId := AId;
  FNome := ANome;
  Professores := TList<TProfessor>.Create;
end;

end.
