inherited formTurnoCreateEdit: TformTurnoCreateEdit
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formTurnoCreateEdit'
  ClientHeight = 740
  ClientWidth = 1024
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  ExplicitWidth = 1024
  ExplicitHeight = 740
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_principal: TPanel
    Left = 3
    Top = 10
    Width = 1018
    Height = 720
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
      Top = 637
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
      Caption = 'TURNO'
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
      Top = 639
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
        ExplicitLeft = 381
        ExplicitTop = 3
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
        ExplicitTop = 3
      end
    end
    object pnl_body: TPanel
      Left = 21
      Top = 83
      Width = 976
      Height = 554
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
      object lb_inicio: TLabel
        Left = 452
        Top = 14
        Width = 37
        Height = 15
        Caption = '* In'#237'cio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb_fim: TLabel
        Left = 562
        Top = 14
        Width = 29
        Height = 15
        Caption = '* Fim'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbe_referencia: TLabeledEdit
        Left = 32
        Top = 32
        Width = 100
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 58
        EditLabel.Height = 15
        EditLabel.Caption = 'Referencia'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Calibri'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        NumbersOnly = True
        ReadOnly = True
        TabOrder = 0
      end
      object lbe_nome: TLabeledEdit
        Left = 142
        Top = 32
        Width = 300
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 43
        EditLabel.Height = 15
        EditLabel.Caption = '* Nome'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Calibri'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        MaxLength = 255
        TabOrder = 1
      end
      object med_inicio: TMaskEdit
        Left = 452
        Top = 32
        Width = 100
        Height = 23
        EditMask = '99:99;0;_'
        MaxLength = 5
        TabOrder = 2
        Text = ''
      end
      object med_fim: TMaskEdit
        Left = 562
        Top = 32
        Width = 100
        Height = 23
        EditMask = '99:99;0;_'
        MaxLength = 5
        TabOrder = 3
        Text = ''
      end
    end
  end
  object acl_turno: TActionList
    Images = dmRepository.iml_32
    Left = 656
    Top = 269
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
