inherited formContabilistaCreateEdit: TformContabilistaCreateEdit
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formContabilistaCreateEdit'
  ClientHeight = 740
  ClientWidth = 1024
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  StyleElements = []
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
      Caption = 'CONTABILISTA'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bombardier'
      Font.Style = []
      Padding.Top = 15
      Padding.Bottom = 15
      ParentBackground = False
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
      Color = clWhite
      Padding.Top = 10
      Padding.Bottom = 10
      ParentBackground = False
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
        ExplicitLeft = 421
        ExplicitTop = -6
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
      Height = 554
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object lb_cnpj: TLabel
        Left = 472
        Top = 14
        Width = 35
        Height = 15
        Caption = '* CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb_cpf: TLabel
        Left = 341
        Top = 14
        Width = 29
        Height = 15
        Caption = '* CPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb_fone: TLabel
        Left = 180
        Top = 158
        Width = 36
        Height = 15
        Caption = '* Fone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lb_fax: TLabel
        Left = 312
        Top = 158
        Width = 27
        Height = 15
        Caption = '* Fax'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bvl_3: TBevel
        Left = 0
        Top = 88
        Width = 970
        Height = 2
      end
      object lb_cep: TLabel
        Left = 32
        Top = 102
        Width = 29
        Height = 15
        Caption = '* CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbe_crc: TLabeledEdit
        Tag = 1
        Left = 632
        Top = 32
        Width = 300
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 30
        EditLabel.Height = 15
        EditLabel.Caption = '* CRC'
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
        MaxLength = 15
        ParentFont = False
        TabOrder = 3
        Text = ''
      end
      object mke_cnpj: TMaskEdit
        Tag = 1
        Left = 472
        Top = 32
        Width = 150
        Height = 23
        Color = clWhite
        EditMask = '##.###.###/####-##;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 18
        ParentFont = False
        TabOrder = 2
        Text = ''
      end
      object mke_cpf: TMaskEdit
        Tag = 1
        Left = 342
        Top = 32
        Width = 120
        Height = 23
        Color = clWhite
        EditMask = '###.###.###-##;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 14
        ParentFont = False
        TabOrder = 1
        Text = ''
      end
      object lbe_codigo_municipio: TLabeledEdit
        Tag = 1
        Left = 32
        Top = 176
        Width = 140
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 119
        EditLabel.Height = 15
        EditLabel.Caption = '* C'#243'digo do munic'#237'pio'
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
        MaxLength = 7
        NumbersOnly = True
        ParentFont = False
        TabOrder = 9
        Text = ''
      end
      object lbe_email: TLabeledEdit
        Tag = 1
        Left = 452
        Top = 176
        Width = 290
        Height = 23
        CharCase = ecLowerCase
        EditLabel.Width = 42
        EditLabel.Height = 15
        EditLabel.Caption = '* E-mail'
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
        MaxLength = 60
        ParentFont = False
        TabOrder = 12
        Text = ''
      end
      object mke_fone: TMaskEdit
        Tag = 1
        Left = 182
        Top = 176
        Width = 120
        Height = 23
        EditMask = '(##)####-####;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 10
        Text = ''
      end
      object mke_fax: TMaskEdit
        Tag = 1
        Left = 312
        Top = 176
        Width = 130
        Height = 23
        EditMask = '(##)####-####;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 13
        ParentFont = False
        TabOrder = 11
        Text = ''
      end
      object lbe_nome: TLabeledEdit
        Tag = 1
        Left = 32
        Top = 32
        Width = 300
        Height = 23
        CharCase = ecUpperCase
        Color = clWhite
        EditLabel.Width = 43
        EditLabel.Height = 15
        EditLabel.Caption = '* Nome'
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
        Text = ''
      end
      object lbe_logradouro: TLabeledEdit
        Tag = 1
        Left = 142
        Top = 120
        Width = 300
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 72
        EditLabel.Height = 15
        EditLabel.Caption = '* Logradouro'
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
        MaxLength = 60
        ParentFont = False
        TabOrder = 5
        Text = ''
      end
      object lbe_numero: TLabeledEdit
        Tag = 1
        Left = 452
        Top = 120
        Width = 80
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 55
        EditLabel.Height = 15
        EditLabel.Caption = '* N'#250'mero'
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
        MaxLength = 8
        ParentFont = False
        TabOrder = 6
        Text = ''
      end
      object lbe_complemento: TLabeledEdit
        Left = 542
        Top = 120
        Width = 200
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 75
        EditLabel.Height = 15
        EditLabel.Caption = 'Complemento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 7
        Text = ''
      end
      object lbe_bairro: TLabeledEdit
        Tag = 1
        Left = 752
        Top = 120
        Width = 180
        Height = 23
        CharCase = ecUpperCase
        EditLabel.Width = 42
        EditLabel.Height = 15
        EditLabel.Caption = '* Bairro'
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
        MaxLength = 60
        ParentFont = False
        TabOrder = 8
        Text = ''
      end
      object mke_cep: TMaskEdit
        Tag = 1
        Left = 32
        Top = 120
        Width = 100
        Height = 23
        EditMask = '#####-###;0;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        MaxLength = 9
        ParentFont = False
        TabOrder = 4
        Text = ''
        OnExit = mke_cepExit
      end
    end
  end
  object acl_contabilista: TActionList
    Images = dmRepository.iml_32
    Left = 392
    Top = 381
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
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'https://viacep.com.br/ws/78048258/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 488
    Top = 32
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 560
    Top = 33
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 640
    Top = 34
  end
end
