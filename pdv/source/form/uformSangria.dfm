inherited formSangria: TformSangria
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formSangria'
  ClientHeight = 740
  ClientWidth = 1024
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  ExplicitWidth = 1024
  ExplicitHeight = 740
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_principal: TPanel
    Left = 3
    Top = 250
    Width = 1018
    Height = 240
    Align = alCustom
    Anchors = []
    Color = clWhite
    Padding.Left = 20
    Padding.Right = 20
    ParentBackground = False
    TabOrder = 0
    object bvl_1: TBevel
      Left = 21
      Top = 81
      Width = 976
      Height = 2
      Align = alTop
      ExplicitLeft = 0
      ExplicitTop = 88
    end
    object bvl_2: TBevel
      Left = 21
      Top = 157
      Width = 976
      Height = 2
      Align = alBottom
      ExplicitLeft = 0
      ExplicitTop = 88
    end
    object pnl_header: TPanel
      Left = 21
      Top = 1
      Width = 976
      Height = 80
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'INFORMAR SANGRIA'
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
      Top = 159
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
      Top = 83
      Width = 976
      Height = 74
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 2
      object lbe_motivo: TLabeledEdit
        Left = 162
        Top = 32
        Width = 500
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'Motivo'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Calibri'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        MaxLength = 50
        TabOrder = 1
        OnKeyDown = lbe_valorKeyDown
      end
      object lbe_valor: TLabeledEdit
        Left = 32
        Top = 32
        Width = 120
        Height = 23
        EditLabel.Width = 28
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Calibri'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyDown = lbe_valorKeyDown
      end
    end
  end
  object acl_sangria: TActionList
    Images = dmRepository.iml_32
    OnUpdate = acl_sangriaUpdate
    Left = 808
    Top = 112
    object act_cancelar: TAction
      Caption = 'CANCELAR'
      ImageIndex = 0
      OnExecute = act_cancelarExecute
    end
    object act_confirmar: TAction
      Caption = 'CONFIRMAR'
      ImageIndex = 6
      OnExecute = act_confirmarExecute
    end
  end
end
