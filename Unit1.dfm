object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Towers of Hanoi'
  ClientHeight = 371
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 40
    Width = 65
    Height = 13
    Caption = 'Progress: 0/5'
  end
  object GroupBox2: TGroupBox
    Left = 192
    Top = 112
    Width = 121
    Height = 161
    Caption = 'GroupBox2'
    TabOrder = 0
    OnDragOver = GroupBox2DragOver
  end
  object GroupBox3: TGroupBox
    Left = 335
    Top = 112
    Width = 122
    Height = 161
    Caption = 'GroupBox3'
    TabOrder = 1
    OnDragOver = GroupBox3DragOver
  end
  object GroupBox1: TGroupBox
    Left = 47
    Top = 112
    Width = 121
    Height = 161
    Caption = 'GroupBox1'
    TabOrder = 2
    OnDragOver = GroupBox1DragOver
    object Button1: TButton
      Left = 46
      Top = 20
      Width = 28
      Height = 24
      Caption = '1'
      TabOrder = 0
      OnMouseDown = Button1MouseDown
    end
    object Button2: TButton
      Left = 38
      Top = 43
      Width = 44
      Height = 24
      Caption = '2'
      TabOrder = 1
      OnMouseDown = Button2MouseDown
    end
    object Button3: TButton
      Left = 32
      Top = 66
      Width = 56
      Height = 24
      Caption = '3'
      TabOrder = 2
      OnMouseDown = Button3MouseDown
    end
    object Button4: TButton
      Left = 27
      Top = 89
      Width = 66
      Height = 24
      Caption = '4'
      TabOrder = 3
      OnMouseDown = Button4MouseDown
    end
    object Button5: TButton
      Left = 22
      Top = 112
      Width = 76
      Height = 24
      Caption = '5'
      TabOrder = 4
      OnMouseDown = Button5MouseDown
    end
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = 'Menu'
      object N2: TMenuItem
        Caption = 'Reset'
        OnClick = N2Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
end
