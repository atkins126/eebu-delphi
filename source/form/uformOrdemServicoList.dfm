inherited formOrdemServicoList: TformOrdemServicoList
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = 'formOrdemServicoList'
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
    Left = 11
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
    object pnl_head: TPanel
      Left = 21
      Top = 1
      Width = 976
      Height = 80
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'ORDENS DE SERVI'#199'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Bombardier'
      Font.Style = []
      Padding.Top = 10
      Padding.Bottom = 10
      ParentColor = True
      ParentFont = False
      TabOrder = 0
    end
    object pnl_body: TPanel
      Left = 21
      Top = 83
      Width = 976
      Height = 554
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object bvl_4: TBevel
        Left = 0
        Top = 77
        Width = 976
        Height = 2
        Align = alTop
        ExplicitTop = 103
      end
      object dbg_vendas: TDBGrid
        Left = 0
        Top = 79
        Width = 976
        Height = 475
        Cursor = crHandPoint
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = False
        DataSource = ds_os
        DrawingStyle = gdsClassic
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Courier New'
        TitleFont.Style = [fsUnderline]
        OnDrawColumnCell = dbg_vendasDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOLICITADO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPETENCIA'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESSOA'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENDEDOR'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACAO'
            Width = 150
            Visible = True
          end>
      end
      object pnl_search: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 77
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lb_start: TLabel
          Left = 32
          Top = 14
          Width = 92
          Height = 15
          Caption = 'PER'#205'ODO INICIAL'
        end
        object lb_end: TLabel
          Left = 172
          Top = 14
          Width = 83
          Height = 15
          Caption = 'PER'#205'ODO FINAL'
        end
        object lb_user: TLabel
          Left = 312
          Top = 14
          Width = 59
          Height = 15
          Caption = 'VENDEDOR'
        end
        object lb_pessoa: TLabel
          Left = 472
          Top = 14
          Width = 41
          Height = 15
          Caption = 'PESSOA'
        end
        object lbe_search: TLabeledEdit
          Left = 782
          Top = 32
          Width = 160
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          EditLabel.Width = 60
          EditLabel.Height = 15
          EditLabel.Caption = 'PESQUISAR'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'Calibri'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          MaxLength = 30
          ParentCtl3D = False
          TabOrder = 0
          OnKeyDown = lbe_searchKeyDown
        end
        object dtp_end: TDateTimePicker
          Left = 172
          Top = 32
          Width = 130
          Height = 23
          BiDiMode = bdLeftToRight
          Date = 42977.000000000000000000
          Time = 0.435999409717624100
          ParentBiDiMode = False
          TabOrder = 2
        end
        object dtp_start: TDateTimePicker
          Left = 32
          Top = 32
          Width = 130
          Height = 23
          BiDiMode = bdLeftToRight
          Date = 42977.000000000000000000
          Time = 0.435999409717624100
          ParentBiDiMode = False
          TabOrder = 1
        end
        object edb_pessoa: TButtonedEdit
          Left = 472
          Top = 32
          Width = 300
          Height = 21
          Cursor = crHandPoint
          CharCase = ecUpperCase
          Ctl3D = False
          Images = dmRepository.iml_16
          LeftButton.DisabledImageIndex = 24
          LeftButton.HotImageIndex = 24
          LeftButton.ImageIndex = 24
          LeftButton.PressedImageIndex = 24
          LeftButton.Visible = True
          ParentCtl3D = False
          ReadOnly = True
          RightButton.DisabledImageIndex = 23
          RightButton.HotImageIndex = 23
          RightButton.ImageIndex = 23
          RightButton.PressedImageIndex = 23
          TabOrder = 4
          OnChange = edb_userChange
          OnLeftButtonClick = edb_pessoaLeftButtonClick
          OnRightButtonClick = edb_pessoaRightButtonClick
        end
        object edb_user: TButtonedEdit
          Left = 312
          Top = 32
          Width = 150
          Height = 21
          Cursor = crHandPoint
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Images = dmRepository.iml_16
          LeftButton.DisabledImageIndex = 24
          LeftButton.HotImageIndex = 24
          LeftButton.ImageIndex = 24
          LeftButton.PressedImageIndex = 24
          LeftButton.Visible = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          RightButton.DisabledImageIndex = 23
          RightButton.HotImageIndex = 23
          RightButton.ImageIndex = 23
          RightButton.PressedImageIndex = 23
          TabOrder = 3
          OnChange = edb_userChange
          OnLeftButtonClick = edb_userLeftButtonClick
          OnRightButtonClick = edb_userRightButtonClick
        end
      end
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
      TabOrder = 2
      object btn_venda_store: TButton
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
        Action = act_store
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
      object btn_rollback: TButton
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
        Action = act_rollback
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
      object btn_venda_cancelar: TButton
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
        Action = act_destroy
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
      object btn_venda_itens: TButton
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
        Action = act_imprimir
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
      object btn_venda_update: TButton
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
        Action = act_update
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
  end
  object act_os: TActionList
    Images = dmRepository.iml_32
    OnUpdate = act_osUpdate
    Left = 418
    Top = 297
    object act_rollback: TAction
      Caption = 'ESC - RETORNAR'
      ImageIndex = 0
      ShortCut = 27
      OnExecute = act_rollbackExecute
    end
    object act_store: TAction
      Caption = 'F2 - NOVO'
      ImageIndex = 1
      ShortCut = 113
      OnExecute = act_storeExecute
    end
    object act_update: TAction
      Caption = 'F3 - EDITAR'
      ImageIndex = 2
      ShortCut = 114
      OnExecute = act_updateExecute
    end
    object act_destroy: TAction
      Caption = 'F4 - REMOVER'
      ImageIndex = 3
      ShortCut = 115
      OnExecute = act_destroyExecute
    end
    object act_imprimir: TAction
      Caption = 'IMPRIMIR'
      ImageIndex = 8
      ShortCut = 121
      OnExecute = act_imprimirExecute
    end
  end
  object fdmt_os: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 331
    Top = 297
    object fdmt_osID: TStringField
      FieldName = 'ID'
      Size = 32
    end
    object fdmt_osREFERENCIA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'REFERENCIA'
    end
    object fdmt_osCOMPETENCIA: TDateField
      FieldName = 'COMPETENCIA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object fdmt_osSOLICITADO: TDateField
      FieldName = 'SOLICITADO'
    end
    object fdmt_osPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 255
    end
    object fdmt_osVENDEDOR: TStringField
      FieldName = 'VENDEDOR'
      Size = 255
    end
    object fdmt_osOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object fdmt_osSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 100
    end
  end
  object ds_os: TDataSource
    DataSet = fdmt_os
    Left = 331
    Top = 353
  end
  object ppm_os: TPopupMenu
    AutoPopup = False
    Images = dmRepository.iml_32
    Left = 418
    Top = 354
    object REIMPRIMIR: TMenuItem
      Caption = 'REIMPRIMIR COMPROVANTE'
      ImageIndex = 8
      ShortCut = 116
    end
    object IDENTIFICARPESSOA: TMenuItem
      Caption = 'IDENTIFICAR PESSOA'
      ImageIndex = 2
      ShortCut = 117
    end
    object GERARNFCe: TMenuItem
      Caption = 'GERAR NFC-e'
      ImageIndex = 6
      ShortCut = 118
    end
    object GERARNFe: TMenuItem
      Caption = 'GERAR NF-e'
      ImageIndex = 6
      ShortCut = 119
    end
    object GERARNOTAFISCAL: TMenuItem
      Caption = 'GERAR NOTA FISCAL'
      ImageIndex = 6
      ShortCut = 120
    end
    object IMPRIMIR: TMenuItem
      Action = act_imprimir
    end
  end
  object tmr_focus: TTimer
    Enabled = False
    OnTimer = tmr_focusTimer
    Left = 328
    Top = 421
  end
end
