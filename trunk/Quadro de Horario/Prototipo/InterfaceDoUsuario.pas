unit InterfaceDoUsuario;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  QuadroDeHorario,
  Generics.Collections, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxEdit, cxVGrid, cxDBVGrid, cxInplaceContainer;

type
  TForm5 = class(TForm)
  private
    { Private declarations }
    procedure carregaDadosEstaticos();
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

{ TForm5 }

procedure TForm5.carregaDadosEstaticos;
var
  Turmas : TList<TTurma>;
  Professores : TList<TProfessor>;
  Prof_Fabio,
  Prof_Suelen,
  Prof_Aline,
  Prof_Magda : TProfessor;

  Disciplinas : TList<TDisciplina>;
  Disc_Port,
  Disc_Mate,
  Disc_Hist,
  Disc_Cien : TDisciplina;
begin
  // Informando as Turmas
  Turmas := TList<TTurma>.Create;
  Turmas.Add( TTurma.create(1, '1º Ano') );
  Turmas.Add( TTurma.create(2, '2º Ano') );
  Turmas.Add( TTurma.create(3, '3º Ano') );
  Turmas.Add( TTurma.create(4, '4º Ano') );
  Turmas.Add( TTurma.create(5, '5º Ano') );
  Turmas.Add( TTurma.create(6, '6º Ano') );
  Turmas.Add( TTurma.create(7, '7º Ano') );

  // Informando os Professores
  Professores := TList<TProfessor>.Create;
  Prof_Fabio := TProfessor.Create(1, 'Fábio');
  Prof_Fabio.Disponibilidades.Add( TDisponibilidade.Create(TurnoNoturno, True, True, True, True, False));
  Professores.Add( Prof_Fabio );

  Prof_Suelen := TProfessor.Create(2, 'Suelen');
  Prof_Suelen.Disponibilidades.Add( TDisponibilidade.Create(TurnoNoturno, False, True, True, True, True));
  Professores.Add( Prof_Suelen );

  Prof_Aline := TProfessor.Create(3, 'Aline');
  Prof_Aline.Disponibilidades.Add( TDisponibilidade.Create(TurnoNoturno, False, True, True, True, False));
  Professores.Add( Prof_Aline );

  Prof_Magda := TProfessor.Create(3, 'Magda');
  Prof_Magda.Disponibilidades.Add( TDisponibilidade.Create(TurnoNoturno, False, True, True, False, False));
  Professores.Add( Prof_Magda );

  // Informando as Disciplinas
  Disciplinas := TList<TDisciplina>.Create;
  Disc_Port := TDisciplina.Create(1, 'Produguês');
  Disc_Port.Professores.Add(Prof_Aline);

  Disc_Mate := TDisciplina.Create(2, 'Matemática');
  Disc_Mate.Professores.Add(Prof_Fabio);

  Disc_Cien := TDisciplina.Create(3, 'Ciência');
  Disc_Cien.Professores.Add(Prof_Magda);

  Disc_Hist := TDisciplina.Create(4, 'História');
  Disc_Hist.Professores.Add(Prof_Suelen);

  Disciplinas.AddRange := [Disc_Port, Disc_Mate, Disc_Cien, Disc_Hist];
end;

end.
