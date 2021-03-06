inherited formDescription: TformDescription
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formDescription'
  ClientHeight = 740
  ClientWidth = 1024
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitWidth = 1024
  ExplicitHeight = 740
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_principal: TPanel
    Left = 3
    Top = 160
    Width = 1018
    Height = 420
    Align = alCustom
    Anchors = []
    Color = clWhite
    Padding.Left = 20
    Padding.Right = 20
    ParentBackground = False
    TabOrder = 0
    object pnl_header: TPanel
      Left = 21
      Top = 1
      Width = 976
      Height = 80
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'MODELO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bombardier'
      Font.Style = []
      Padding.Top = 15
      Padding.Bottom = 15
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
    object pnl_footer: TPanel
      Left = 21
      Top = 339
      Width = 976
      Height = 80
      Align = alBottom
      BevelOuter = bvNone
      Padding.Top = 10
      Padding.Bottom = 10
      ParentColor = True
      TabOrder = 1
      object btn_cancelar: TButton
        AlignWithMargins = True
        Left = 666
        Top = 10
        Width = 150
        Height = 60
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Action = act_cancelar
        Align = alRight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Bombardier'
        Font.Style = [fsUnderline]
        Images = dmRepository.iml_32
        ParentFont = False
        TabOrder = 0
        TabStop = False
        WordWrap = True
      end
      object btn_confirmar: TButton
        AlignWithMargins = True
        Left = 821
        Top = 10
        Width = 150
        Height = 60
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Action = act_confirmar
        Align = alRight
        Caption = 'F12 - CONFIRMAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Bombardier'
        Font.Style = [fsUnderline]
        Images = dmRepository.iml_32
        ParentFont = False
        TabOrder = 1
        TabStop = False
        WordWrap = True
      end
    end
    object pnl_body: TPanel
      Left = 21
      Top = 81
      Width = 976
      Height = 258
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 976
        Height = 258
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        TabOrder = 0
        object mm_descricao: TMemo
          Left = 2
          Top = 15
          Width = 972
          Height = 241
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object act_description: TActionList
    Images = dmRepository.iml_32
    OnUpdate = act_descriptionUpdate
    Left = 696
    Top = 184
    object act_cancelar: TAction
      Caption = 'ESC - CANCELAR'
      ImageIndex = 0
      ShortCut = 27
      OnExecute = act_cancelarExecute
    end
    object act_confirmar: TAction
      Caption = 'F11 - CONFIRMAR'
      ImageIndex = 6
      ShortCut = 123
      OnExecute = act_confirmarExecute
    end
  end
end
