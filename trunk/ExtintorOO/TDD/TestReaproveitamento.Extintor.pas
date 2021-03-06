unit TestReaproveitamento.Extintor;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, variants,
  Generics.Collections,
  Reaproveitamento.Extintor.Negocio,
  Reaproveitamento.Extintor.Fachada;

type
  // Test methods for class TFachada

  TestTFachada = class(TTestCase)
  strict private
    FFachada: TFachada;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TeTestobterListaExtintor;
    procedure TestobterListaExtintor;
    procedure TestobterItemExtintor;
    procedure TestadicionarItemExtintor;
    procedure TestmodificarItemExtintor;
    procedure TestremoverItemExtintor;
  end;

implementation

procedure TestTFachada.SetUp;
begin
end;

procedure TestTFachada.TearDown;
begin
end;

procedure TestTFachada.TestobterListaExtintor;
var
  ReturnValue: TList<TExtintor>;
begin
  ReturnValue := TFachada.obterListaDeExtintores;
  Assert( ReturnValue <> Nil );
end;

procedure TestTFachada.TestobterItemExtintor;
var
  ReturnValue: TExtintor;
  AChave: Variant;
begin
  AChave := 1;
  ReturnValue := TFachada.obterExtintor(AChave);
  Assert( ReturnValue <> Nil );
end;

procedure TestTFachada.TestadicionarItemExtintor;
var
  ReturnValue: TExtintor;
  AItem: TExtintor;
  AFabricante   : TFabricante;
  ACapacidade   : TCapacidadeExtintor;
  ATipoExtintor : TTipoExtintor;

begin
  AFabricante := TFachada.obterFabricante(1);
  if AFabricante = nil then
    AFabricante := TFachada.adicionarFabricante(TFabricante.Create(0, 'PREVEN��O'));

  AItem := TExtintor.Create;
  AItem.TipoExtintorID := 1;
  AItem.CapacidadeId := 1;
  AItem.FabricanteID := AFabricante.Id;
  AItem.AnoFabricacao := '2010';
  AItem.CodigoBarra := '0000001';

  ReturnValue := TFachada.adicionarExtintor(AItem);
  Assert( ReturnValue <> Nil );
end;

procedure TestTFachada.TestmodificarItemExtintor;
var
  ReturnValue: Boolean;
  AItem: TExtintor;
  AFabricante : TFabricante;
begin
  AFabricante := TFachada.obterFabricante(1);
  if AFabricante = nil then
    AFabricante := TFachada.adicionarFabricante(TFabricante.Create(0, 'PREVEN��O'));

  AItem := TExtintor.Create;
  AItem.TipoExtintorID := 1;
  AItem.CapacidadeId := 4;
  AItem.FabricanteID := AFabricante.Id;
  AItem.AnoFabricacao := '2012';
  AItem.CodigoBarra := '0000001';

  ReturnValue := TFachada.modificarExtintor(AItem);
  Assert( ReturnValue );
end;

procedure TestTFachada.TestremoverItemExtintor;
var
  ReturnValue: Boolean;
  AItem: TExtintor;
begin
  AItem := TExtintor.Create;


  ReturnValue := TFachada.removerExtintor(AItem);
  Assert( ReturnValue );
end;

procedure TestTFachada.TeTestobterListaExtintor;
var
  AFiltroSQL : string;
  ReturnValue: TList<TExtintor>;
begin
  AFiltroSQL := 'ID = 1';
  ReturnValue := TFachada.obterListaDeExtintores(AFiltroSQL);
  Assert( ReturnValue <> Nil );
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFachada.Suite);
end.

