inherited formVendaCreateEdit: TformVendaCreateEdit
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formVendaCreateEdit'
  ClientHeight = 740
  ClientWidth = 1024
  Color = 3618615
  Position = poDefaultSizeOnly
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  OnShow = FormShow
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
      Top = 59
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
      Height = 58
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'VENDA'
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
      object btn_salvar_orcamento: TButton
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
        Action = act_salvar_orcamento
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
      object btn_cancelar: TButton
        AlignWithMargins = True
        Left = 201
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
        TabOrder = 2
        TabStop = False
        WordWrap = True
      end
      object btn_remover_item: TButton
        AlignWithMargins = True
        Left = 356
        Top = 10
        Width = 150
        Height = 60
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Action = act_remover_item
        Align = alRight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Bombardier'
        Font.Style = [fsUnderline]
        Images = dmRepository.iml_32
        ParentFont = False
        TabOrder = 3
        TabStop = False
        WordWrap = True
      end
      object btn_consultar_orcamento: TButton
        AlignWithMargins = True
        Left = 511
        Top = 10
        Width = 150
        Height = 60
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Action = act_consultar_orcamento
        Align = alRight
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Bombardier'
        Font.Style = [fsUnderline]
        Images = dmRepository.iml_32
        ParentFont = False
        TabOrder = 4
        TabStop = False
        WordWrap = True
      end
    end
    object pnl_main: TPanel
      Left = 21
      Top = 61
      Width = 976
      Height = 576
      Align = alClient
      BevelOuter = bvNone
      Padding.Top = 15
      ParentColor = True
      TabOrder = 2
      object bvl_3: TBevel
        Left = 0
        Top = 173
        Width = 976
        Height = 2
        Align = alTop
        ExplicitTop = 185
      end
      object Bevel1: TBevel
        Left = 0
        Top = 494
        Width = 976
        Height = 2
        Align = alBottom
        ExplicitTop = 88
      end
      object Bevel2: TBevel
        Left = 0
        Top = 91
        Width = 976
        Height = 2
        Align = alTop
        ExplicitTop = 87
      end
      object pnl_categorias_search: TPanel
        Left = 0
        Top = 15
        Width = 976
        Height = 76
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 822
          Top = 14
          Width = 72
          Height = 15
          Caption = 'Compet'#234'ncia'
        end
        object dtp_competencia: TDateTimePicker
          Left = 822
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
          TabOrder = 3
        end
        object lbe_pessoa: TLabeledEdit
          Tag = 1
          Left = 342
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
          TabOrder = 1
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
        object lbe_user: TLabeledEdit
          Tag = 1
          Left = 32
          Top = 32
          Width = 300
          Height = 23
          EditLabel.Width = 91
          EditLabel.Height = 15
          EditLabel.Caption = 'Vendedor - ( F1 )'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = lbe_userKeyDown
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 496
        Width = 976
        Height = 80
        Align = alBottom
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 2
        object lbl_descricao: TLabel
          Left = 2
          Top = 5
          Width = 5
          Height = 26
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbe_subtotal: TLabeledEdit
          Left = 822
          Top = 29
          Width = 122
          Height = 23
          TabStop = False
          EditLabel.Width = 46
          EditLabel.Height = 15
          EditLabel.Caption = 'SubTotal'
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
          Font.Style = [fsBold]
          LabelPosition = lpLeft
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object dbg_categorias: TDBGrid
        Left = 0
        Top = 175
        Width = 976
        Height = 319
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = False
        DataSource = ds_itens
        DrawingStyle = gdsClassic
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Courier New'
        TitleFont.Style = [fsUnderline]
        OnDrawColumnCell = dbg_categoriasDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM_REFERENCIA'
            Title.Caption = 'ITEM'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEM_NOME'
            Title.Caption = 'NOME'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEM_UNIDADE'
            Title.Caption = 'UNIDADE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNITARIO'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUBTOTAL'
            Title.Alignment = taRightJustify
            Width = 100
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 93
        Width = 976
        Height = 80
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        TabOrder = 1
        object lbe_item: TLabeledEdit
          Left = 32
          Top = 32
          Width = 100
          Height = 23
          CharCase = ecUpperCase
          EditLabel.Width = 63
          EditLabel.Height = 15
          EditLabel.Caption = 'Item - ( F1 )'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = lbe_itemKeyDown
        end
        object edt_item_nome: TEdit
          Left = 132
          Top = 32
          Width = 382
          Height = 23
          TabStop = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object lbe_item_preco: TLabeledEdit
          Left = 524
          Top = 32
          Width = 130
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          CharCase = ecUpperCase
          EditLabel.Width = 31
          EditLabel.Height = 15
          EditLabel.Caption = 'Pre'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = lbe_item_precoChange
          OnKeyDown = lbe_item_precoKeyDown
        end
        object lbe_item_qtde: TLabeledEdit
          Left = 664
          Top = 32
          Width = 130
          Height = 23
          TabStop = False
          Alignment = taRightJustify
          CharCase = ecUpperCase
          EditLabel.Width = 24
          EditLabel.Height = 15
          EditLabel.Caption = 'Qtd.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = lbe_item_qtdeChange
          OnExit = lbe_item_qtdeExit
          OnKeyDown = lbe_item_qtdeKeyDown
        end
        object lbe_item_subtotal: TLabeledEdit
          Left = 804
          Top = 32
          Width = 140
          Height = 23
          TabStop = False
          EditLabel.Width = 46
          EditLabel.Height = 15
          EditLabel.Caption = 'Subtotal'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
  end
  object fdmt_itens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 339
    Top = 337
    object fdmt_itensITEM_ID: TStringField
      FieldName = 'ITEM_ID'
      Size = 32
    end
    object fdmt_itensITEM_REFERENCIA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ITEM_REFERENCIA'
    end
    object fdmt_itensITEM_NOME: TStringField
      FieldName = 'ITEM_NOME'
      Size = 120
    end
    object fdmt_itensITEM_UNIDADE: TStringField
      FieldName = 'ITEM_UNIDADE'
      Size = 6
    end
    object fdmt_itensUNITARIO: TCurrencyField
      FieldName = 'UNITARIO'
      DisplayFormat = '###,##0.00'
    end
    object fdmt_itensQTDE: TCurrencyField
      FieldName = 'QTDE'
      DisplayFormat = '###,###0.000'
      currency = False
    end
    object fdmt_itensSUBTOTAL: TCurrencyField
      FieldName = 'SUBTOTAL'
      DisplayFormat = '###,##0.00'
      currency = False
    end
    object fdmt_itensACRESCIMO: TCurrencyField
      FieldName = 'ACRESCIMO'
      DisplayFormat = '###,##0.00'
      currency = False
    end
    object fdmt_itensDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      DisplayFormat = '###,##0.00'
      currency = False
    end
    object fdmt_itensTOTAL: TCurrencyField
      FieldName = 'TOTAL'
      DisplayFormat = '###,##0.00'
      currency = False
    end
    object fdmt_itensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
  end
  object ds_itens: TDataSource
    DataSet = fdmt_itens
    OnDataChange = ds_itensDataChange
    Left = 339
    Top = 393
  end
  object acl_venda: TActionList
    Images = dmRepository.iml_32
    OnUpdate = acl_vendaUpdate
    Left = 432
    Top = 395
    object act_cancelar: TAction
      Caption = 'CANCELAR'
      ImageIndex = 0
      OnExecute = act_cancelarExecute
    end
    object act_remover_item: TAction
      Caption = 'REMOVER ITEM'
      ImageIndex = 3
      OnExecute = act_remover_itemExecute
    end
    object act_consultar_orcamento: TAction
      Caption = 'ORCAMENTO'
      ImageIndex = 10
      OnExecute = act_consultar_orcamentoExecute
    end
    object act_salvar_orcamento: TAction
      Caption = 'ORCAMENTO'
      ImageIndex = 6
      OnExecute = act_salvar_orcamentoExecute
    end
    object act_confirmar: TAction
      Caption = 'CONFIRMAR'
      ImageIndex = 6
      OnExecute = act_confirmarExecute
    end
    object act_descricao: TAction
      Caption = 'Descricao'
      ShortCut = 113
      OnExecute = act_descricaoExecute
    end
  end
end
