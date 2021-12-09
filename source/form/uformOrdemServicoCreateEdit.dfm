inherited formOrdemServicoCreateEdit: TformOrdemServicoCreateEdit
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formOrdemServicoCreateEdit'
  ClientHeight = 739
  ClientWidth = 1040
  Color = clWindowText
  Position = poDefaultPosOnly
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  ExplicitWidth = 1040
  ExplicitHeight = 739
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
    object pnl_pessoa_header: TPanel
      Left = 21
      Top = 1
      Width = 976
      Height = 80
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'ORDEM SERVI'#199'O'
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
    object pnl_pessoa_footer: TPanel
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
        TabOrder = 0
        TabStop = False
        WordWrap = True
      end
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
        TabOrder = 1
        TabStop = False
        WordWrap = True
      end
    end
    object pnl_pessoa_body: TPanel
      Left = 21
      Top = 83
      Width = 976
      Height = 556
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      TabOrder = 2
      object bvl_2: TBevel
        Left = 0
        Top = 554
        Width = 976
        Height = 2
        Align = alBottom
        ExplicitTop = 88
      end
      object Label5: TLabel
        Left = 32
        Top = 70
        Width = 108
        Height = 15
        Caption = 'Descri'#231#227'o do cliente'
      end
      object Label1: TLabel
        Left = 823
        Top = 14
        Width = 71
        Height = 15
        Caption = 'Data solitado'
      end
      object Label2: TLabel
        Left = 32
        Top = 190
        Width = 72
        Height = 15
        Caption = 'Compet'#234'ncia'
      end
      object Label3: TLabel
        Left = 170
        Top = 190
        Width = 54
        Height = 15
        Caption = '* Situa'#231#227'o'
      end
      object mm_observacao: TMemo
        Left = 32
        Top = 89
        Width = 913
        Height = 89
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object lbe_user: TLabeledEdit
        Tag = 1
        Left = 342
        Top = 32
        Width = 300
        Height = 23
        EditLabel.Width = 100
        EditLabel.Height = 15
        EditLabel.Caption = 'Funcionario - ( F1 )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = lbe_userKeyDown
      end
      object lbe_pessoa: TLabeledEdit
        Tag = 1
        Left = 32
        Top = 32
        Width = 300
        Height = 23
        EditLabel.Width = 74
        EditLabel.Height = 15
        EditLabel.Caption = 'Pessoa - ( F1 )'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnKeyDown = lbe_pessoaKeyDown
      end
      object lbe_referencia: TLabeledEdit
        Left = 652
        Top = 32
        Width = 160
        Height = 23
        TabStop = False
        EditLabel.Width = 58
        EditLabel.Height = 15
        EditLabel.Caption = 'Refer'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dtp_Solicitado: TDateTimePicker
        Left = 823
        Top = 32
        Width = 122
        Height = 23
        Date = 42971.000000000000000000
        Time = 0.603763773149694300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object dtp_competencia: TDateTimePicker
        Left = 32
        Top = 208
        Width = 126
        Height = 23
        Date = 42971.000000000000000000
        Time = 0.603763773149694300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object cbx_situacao: TComboBox
        Left = 170
        Top = 208
        Width = 162
        Height = 23
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Items.Strings = (
          'SERVI'#199'O PENDENTE'
          'EM ANDAMENTO'
          'CANCELADO'
          'CONCLUIDO')
      end
    end
  end
  object acl_Consulta: TActionList
    Images = dmRepository.iml_32
    Left = 736
    Top = 557
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
