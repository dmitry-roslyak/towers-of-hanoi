unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ActnList;

type
  TDynamicArray = array of TStringList;

  TForm1 = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    About1: TMenuItem;

    procedure GroupBox2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GroupBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure GroupBox3DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  array1: TDynamicArray;
  dragToIndex: Integer;
  dragFromIndex: Integer;
  time1: TDateTime;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  time1 := Now();
  SetLength(array1, 3);
  array1[0] := TStringList.Create;
  array1[1] := TStringList.Create;
  array1[2] := TStringList.Create;

  array1[0].Add('5');
  array1[0].Add('4');
  array1[0].Add('3');
  array1[0].Add('2');
  array1[0].Add('1');
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  time1 := Now();
  SetLength(array1, 3);
  array1[0] := TStringList.Create;
  array1[1] := TStringList.Create;
  array1[2] := TStringList.Create;

  array1[0].Add('5');
  array1[0].Add('4');
  array1[0].Add('3');
  array1[0].Add('2');
  array1[0].Add('1');

  Button5.Top := GroupBox1.Top - 0 * (Button1.Height - 1);
  Button4.Top := GroupBox1.Top - 1 * (Button1.Height - 1);
  Button3.Top := GroupBox1.Top - 2 * (Button1.Height - 1);
  Button2.Top := GroupBox1.Top - 3 * (Button1.Height - 1);
  Button1.Top := GroupBox1.Top - 4 * (Button1.Height - 1);

  Button1.Parent := GroupBox1;
  Button2.Parent := GroupBox1;
  Button3.Parent := GroupBox1;
  Button4.Parent := GroupBox1;
  Button5.Parent := GroupBox1;
  Label1.Caption := 'Progress: 0/5';
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  MessageDlg('Towers of Hanoi' + sLineBreak + 'Ver. 1.05 beta' + sLineBreak +
      'Copyright © kadzima 2020 All Rights Reserved.', mtInformation, [mbOk],
    0);
end;

procedure TForm1.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var
  btn: TButton absolute Sender;
begin
  if Button = mbLeft then
    btn.BeginDrag(true);
end;

procedure TForm1.Button2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var
  btn: TButton absolute Sender;
begin
  if Button = mbLeft then
    btn.BeginDrag(true);
end;

procedure TForm1.Button3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var
  btn: TButton absolute Sender;
begin
  if Button = mbLeft then
    btn.BeginDrag(true);
end;

procedure TForm1.Button4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var
  btn: TButton absolute Sender;
begin
  if Button = mbLeft then
    btn.BeginDrag(true);
end;

procedure TForm1.Button5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

var
  btn: TButton absolute Sender;
begin
  if Button = mbLeft then
    btn.BeginDrag(true);
end;

procedure dragFrom(Source: TObject);
var
  btn: TButton absolute Source;
begin
  if btn.Parent.Name = 'GroupBox1' then
  begin
    dragFromIndex := 0;
  end
  else if btn.Parent.Name = 'GroupBox2' then
  begin
    dragFromIndex := 1;
  end
  else if btn.Parent.Name = 'GroupBox3' then
  begin
    dragFromIndex := 2;
  end;
end;

procedure Move(Sender, Source: TObject);

var
  btn: TButton absolute Source;
  box: TGroupBox absolute Sender;
begin
  array1[dragToIndex].Add(btn.Caption);
  array1[dragFromIndex].Delete(array1[dragFromIndex].Count - 1);

  btn.Top := box.Top - (array1[dragToIndex].Count - 1) * (btn.Height - 1);

  btn.Parent := box;
end;

procedure MoveCheck(Sender, Source: TObject);
var
  btn: TButton absolute Source;
  count: Integer;
begin
  dragFrom(Source);
  count := array1[dragToIndex].Count;

  if (array1[dragFromIndex].IndexOf(btn.Caption) = array1[dragFromIndex].Count - 1) and
    ((count < 1) or (array1[dragToIndex][count - 1] > btn.Caption)) then
    Move(Sender, Source);
end;

procedure TForm1.GroupBox1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  dragToIndex := 0;
  MoveCheck(Sender, Source);
end;

procedure TForm1.GroupBox2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  dragToIndex := 1;
  MoveCheck(Sender, Source);
end;

procedure TForm1.GroupBox3DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  i, last: Integer;
  complete: Integer;
begin
  dragToIndex := 2;
  MoveCheck(Sender, Source);
  last := array1[2].Count - 1;
  complete := 5;
  for i := 0 to last do
  begin
    if array1[2][i] = inttostr(complete) then
      complete := complete - 1
  end;
  Label1.Caption := 'Progress: ' + inttostr(5 - complete) + '/5';
  if complete = 0 then
  begin
    Label1.Caption := 'Progress: Win!' + sLineBreak + 'Your time: ' + TimeToStr
      (Now() - time1);
  end;

end;

end.
