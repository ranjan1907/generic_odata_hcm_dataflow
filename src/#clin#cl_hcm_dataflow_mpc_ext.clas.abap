class /CLIN/CL_HCM_DATAFLOW_MPC_EXT definition
  public
  inheriting from /CLIN/CL_HCM_DATAFLOW_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS /CLIN/CL_HCM_DATAFLOW_MPC_EXT IMPLEMENTATION.


METHOD define.

  super->define( ).

  CALL METHOD /clin/cl_genodata=>get_instance
    RECEIVING
      re_o_instance      = DATA(lo_genodata)
    EXCEPTIONS
      object_not_created = 1
      OTHERS             = 2.
  IF sy-subrc = 0.
    CALL METHOD lo_genodata->define_dynamic
      EXPORTING
        im_v_app   = 'Dataflow'
      CHANGING
        ch_o_model = model.
  ENDIF.

ENDMETHOD.
ENDCLASS.
