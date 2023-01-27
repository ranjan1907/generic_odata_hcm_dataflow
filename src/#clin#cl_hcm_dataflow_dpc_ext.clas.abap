class /CLIN/CL_HCM_DATAFLOW_DPC_EXT definition
  public
  inheriting from /CLIN/CL_HCM_DATAFLOW_DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS /CLIN/CL_HCM_DATAFLOW_DPC_EXT IMPLEMENTATION.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_entity.

    CALL METHOD /clin/cl_genodata=>get_instance
      RECEIVING
        re_o_instance      = DATA(lo_genodata)
      EXCEPTIONS
        object_not_created = 1
        OTHERS             = 2.
    IF sy-subrc = 0.
      SELECT SINGLE entity_name FROM /clin/entity_hd INTO @DATA(lv_entity_name) WHERE app_id = 'Dataflow' AND entity_name = @iv_entity_name.
      IF sy-subrc = 0.
        TRY.
            CALL METHOD lo_genodata->gen_create_entity
              EXPORTING
                iv_app                  = 'Dataflow'
                iv_entity_name          = iv_entity_name
                iv_entity_set_name      = iv_entity_set_name
                iv_source_name          = iv_source_name
                io_data_provider        = io_data_provider
                it_key_tab              = it_key_tab
                it_navigation_path      = it_navigation_path
                io_tech_request_context = io_tech_request_context
              IMPORTING
                er_entity               = er_entity.
          CATCH /iwbep/cx_mgw_busi_exception.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception.
          CATCH /iwbep/cx_mgw_tech_exception .
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
        ENDTRY.
      ELSE.
        TRY.
            CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~create_entity
              EXPORTING
                iv_entity_name          = iv_entity_name
                iv_entity_set_name      = iv_entity_set_name
                iv_source_name          = iv_source_name
                io_data_provider        = io_data_provider
                it_key_tab              = it_key_tab
                it_navigation_path      = it_navigation_path
                io_tech_request_context = io_tech_request_context
              IMPORTING
                er_entity               = er_entity.
          CATCH /iwbep/cx_mgw_busi_exception.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception.
          CATCH /iwbep/cx_mgw_tech_exception.
            RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
        ENDTRY.
      ENDIF.
    ENDIF.

  ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~get_entity.

  CALL METHOD /clin/cl_genodata=>get_instance
    RECEIVING
      re_o_instance      = DATA(lo_genodata)
    EXCEPTIONS
      object_not_created = 1
      OTHERS             = 2.
  IF sy-subrc = 0.
    SELECT SINGLE entity_name FROM /clin/entity_hd INTO @DATA(lv_entity_name) WHERE app_id = 'Dataflow' AND entity_name = @iv_entity_name.
    IF sy-subrc = 0.
      TRY.
          CALL METHOD lo_genodata->gen_get_entity
            EXPORTING
              iv_app                  = 'Dataflow'
              iv_entity_name          = iv_entity_name
              iv_entity_set_name      = iv_entity_set_name
              iv_source_name          = iv_source_name
              it_key_tab              = it_key_tab
              it_navigation_path      = it_navigation_path
              io_tech_request_context = io_tech_request_context
            IMPORTING
              er_entity               = er_entity
              es_response_context     = es_response_context.
        CATCH /iwbep/cx_mgw_busi_exception.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception.
        CATCH /iwbep/cx_mgw_tech_exception .
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
      ENDTRY.
    ELSE.
      TRY.
          CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~get_entity
            EXPORTING
              iv_entity_name          = iv_entity_name
              iv_entity_set_name      = iv_entity_set_name
              iv_source_name          = iv_source_name
              it_key_tab              = it_key_tab
              it_navigation_path      = it_navigation_path
              io_tech_request_context = io_tech_request_context
            IMPORTING
              er_entity               = er_entity
              es_response_context     = es_response_context.
        CATCH /iwbep/cx_mgw_busi_exception.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception.
        CATCH /iwbep/cx_mgw_tech_exception.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
      ENDTRY.
    ENDIF.
  ENDIF.

ENDMETHOD.


METHOD /iwbep/if_mgw_appl_srv_runtime~get_entityset.

  CALL METHOD /clin/cl_genodata=>get_instance
    RECEIVING
      re_o_instance      = DATA(lo_genodata)
    EXCEPTIONS
      object_not_created = 1
      OTHERS             = 2.
  IF sy-subrc = 0.
    SELECT SINGLE entity_name FROM /clin/entity_hd INTO @DATA(lv_entity_name) WHERE app_id = 'Dataflow' AND entity_name = @iv_entity_name.
    IF sy-subrc = 0.
      TRY.
          CALL METHOD lo_genodata->gen_get_entityset
            EXPORTING
              iv_app                  = 'Dataflow'
              iv_entity_name          = iv_entity_name
              iv_entity_set_name      = iv_entity_set_name
              iv_source_name          = iv_source_name
              it_key_tab              = it_key_tab
              it_navigation_path      = it_navigation_path
              io_tech_request_context = io_tech_request_context
            IMPORTING
              er_entityset            = er_entityset
              es_response_context     = es_response_context.
        CATCH /iwbep/cx_mgw_busi_exception.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception.
        CATCH /iwbep/cx_mgw_tech_exception .
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
      ENDTRY.
    ELSE.
      TRY.
          CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~get_entityset
            EXPORTING
              iv_entity_name          = iv_entity_name
              iv_entity_set_name      = iv_entity_set_name
              iv_source_name          = iv_source_name
              it_key_tab              = it_key_tab
              it_navigation_path      = it_navigation_path
              io_tech_request_context = io_tech_request_context
            IMPORTING
              er_entityset            = er_entityset
              es_response_context     = es_response_context.
        CATCH /iwbep/cx_mgw_busi_exception.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception.
        CATCH /iwbep/cx_mgw_tech_exception.
          RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
      ENDTRY.
    ENDIF.
  ENDIF.

ENDMETHOD.
ENDCLASS.
