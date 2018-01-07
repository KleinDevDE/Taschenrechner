unit Unit1;

{$mode objfpc}{$H+}
{$modeswitch typehelpers}
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Crt;

type
  { THome }

  THome = class(TForm)
    Addieren: TButton;
    ToogleDebug: TBitBtn;
    Num1: TEdit;
    Num2: TEdit;
    Ergebnis: TStaticText;
    DebugText: TStaticText;
    Subtrahieren: TButton;
    Dividieren: TButton;
    Multiplizieren: TButton;
    Taschenrechner: TStaticText;
    procedure AddierenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToogleDebugClick(Sender: TObject);
    procedure DividierenClick(Sender: TObject);
    procedure MultiplizierenClick(Sender: TObject);
    procedure SubtrahierenClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Home: THome;
  Debug: Boolean;

implementation

{$R *.lfm}

{ THome }

function IsNumeric(Value: string; const AllowFloat: Boolean): Boolean;
var
  ValueInt: Integer;
  ValueFloat: Extended;
  ErrCode: Integer;
begin
// Check for integer: Val only accepts integers when passed integer param
Value := SysUtils.Trim(Value);
Val(Value, ValueInt, ErrCode);
Result := ErrCode = 0;      // Val sets error code 0 if OK
if not Result and AllowFloat then
    begin
    // Check for float: Val accepts floats when passed float param
    Val(Value, ValueFloat, ErrCode);
    Result := ErrCode = 0;    // Val sets error code 0 if OK
    end;
end;

function checkNumbs(Num1, Num2 : String):boolean;
begin
  if (Home.Num1.GetTextLen = 0)
  then begin
  Home.Ergebnis.Caption:= 'ERROR - Num1 is empty!';
  if Debug then Home.DebugText.Caption:= 'Num1 = "' + Num1 + '"';
  Result := false;
  Exit;
  end;

  if Home.Num2.GetTextLen = 0
  then begin
  Home.Ergebnis.Caption:= 'ERROR - Num2 is empty!';
  if Debug then Home.DebugText.Caption:= 'Num2 = "' + Num2 + '"';
  Result := false;
  Exit;
  end;

  if not unit1.IsNumeric(Num1, true)
  then begin
  Home.Ergebnis.Caption:= 'ERROR - Num1 isnt a number!';
  if Debug then Home.DebugText.Caption:= 'Num1 = "' + Num1 + '"';
  Result := false;
  Exit;
  end;

  if not unit1.IsNumeric(Num2, true)
  then begin
  Home.Ergebnis.Caption:= 'ERROR - Num2 isnt a number!';
  if Debug then Home.DebugText.Caption:= 'Num2 = "' + Num2 + '"';
  Result := false;
  Exit;
  end;

  Result := true;
end;
procedure THome.AddierenClick(Sender: TObject);
var number1, number2, sum : integer;
begin
  if Unit1.checkNumbs(Num1.Text, Num2.Text)
  then begin
  number1 := StrToInt(Num1.Text);
  number2 := StrToInt(Num2.Text);
  sum := number1 + number2;
  if Debug then Home.DebugText.Caption:= Num1.Text + ' + ' + Num2.Text + ' = ' + sum.ToString;
  Ergebnis.Caption:= sum.ToString;
  end;
end;

procedure THome.FormCreate(Sender: TObject);
begin

end;

procedure THome.ToogleDebugClick(Sender: TObject);
var aPic: TPicture;
begin
  if (Debug)
  then begin
  Debug := false;
  Taschenrechner.Font.Color:= TColor($000000);
      aPic:=TPicture.Create;
      aPic.LoadFromFile('debugOFF.png');
      Home.ToogleDebug.Glyph.Assign(aPic.Bitmap);
      aPic.Free;
  end
  else begin
    Debug := true;
    Taschenrechner.Font.Color:= TColor($000080);
    aPic:=TPicture.Create;
      aPic.LoadFromFile('debugON.png');
      Home.ToogleDebug.Glyph.Assign(aPic.Bitmap);
      aPic.Free;
  end;
end;

procedure THome.DividierenClick(Sender: TObject);
var number1, number2, sum : integer;
begin
  if Unit1.checkNumbs(Num1.Text, Num2.Text)
  then begin
  number1 := StrToInt(Num1.Text);
  number2 := StrToInt(Num2.Text);
  sum := number1 div number2;
  if Debug then Home.DebugText.Caption:= Num1.Text + ' / ' + Num2.Text + ' = ' + sum.ToString;
  Ergebnis.Caption:= sum.ToString;
  end;
end;

procedure THome.MultiplizierenClick(Sender: TObject);
var number1, number2, sum : integer;
begin
  if Unit1.checkNumbs(Num1.Text, Num2.Text)
  then begin
  number1 := StrToInt(Num1.Text);
  number2 := StrToInt(Num2.Text);
  sum := number1 * number2;
  if Debug then Home.DebugText.Caption:= Num1.Text + ' * ' + Num2.Text + ' = ' + sum.ToString;
  Ergebnis.Caption:= sum.ToString;
  end;
end;

procedure THome.SubtrahierenClick(Sender: TObject);
var number1, number2, sum : integer;
begin
  if Unit1.checkNumbs(Num1.Text, Num2.Text)
  then begin
  number1 := StrToInt(Num1.Text);
  number2 := StrToInt(Num2.Text);
  sum := number1 - number2;
  if Debug then Home.DebugText.Caption:= Num1.Text + ' - ' + Num2.Text + ' = ' + sum.ToString;
  Ergebnis.Caption:= sum.ToString;
  end;
end;

end.

