CLASS lhc_empl DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Empl
        RESULT result.
    METHODS validate_mandatory_fields
      FOR VALIDATE ON SAVE
      IMPORTING keys FOR Empl~validate_mandatory_fields.

    METHODS set_default_status
      FOR DETERMINE ON SAVE
      IMPORTING
        keys FOR Empl~set_default_status.
    METHODS SetStatusEmployment FOR MODIFY
      IMPORTING keys FOR ACTION Empl~SetStatusEmployment RESULT result.
ENDCLASS.

CLASS lhc_empl IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD set_default_status.
    DATA lt_update TYPE TABLE FOR UPDATE zr_empltp.
    LOOP AT keys INTO DATA(lv_key).
        APPEND VALUE #( eid = lv_key-eid
                              status = 'N' ) TO lt_update.
    ENDLOOP.
    IF lt_update IS NOT INITIAL.
        MODIFY ENTITIES OF zr_empltp IN LOCAL MODE
        ENTITY Empl
        UPDATE FIELDS ( status )
        WITH lt_update.
    ENDIF.
  ENDMETHOD.

  METHOD validate_mandatory_fields.
    READ ENTITIES OF zr_empltp IN LOCAL MODE ENTITY empl FIELDS ( currency ) WITH CORRESPONDING #( keys ) RESULT DATA(detail).

*    DATA : employee TYPE SORTED TABLE OF zdrm_emptb WITH UNIQUE KEY eid.
*    IF detail IS NOT INITIAL.
*      SELECT * FROM zdrm_emptb FOR ALL ENTRIES IN @detail WHERE eid = @detail-eid
*      INTO TABLE @DATA(lt_emp).
*    ENDIF.

    LOOP AT detail INTO DATA(ls_detail).

*      IF NOT line_exists( lt_emp[ ls_detail-Currency ] ).
*        READ TABLE lt_emp INTO DATA(ls_emp) WITH KEY eid = ls_detail-eid.
        IF ls_detail-Currency IS INITIAL.
          APPEND VALUE #(  %tky = ls_detail-%tky
                           %key-eid = ls_detail-eid
                           ) TO failed-empl.

          APPEND VALUE #( %msg = new_message( id = '00'
                                          number = '001'
                                              v1 = 'Currency field is mandatory'
                                        severity = if_abap_behv_message=>severity-error )
                      %key-eid = ls_detail-eid
                       %create = 'X'
                           eid = ls_detail-eid ) TO reported-empl.

        ENDIF.
*      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD SetStatusEmployment.
        MODIFY ENTITIES OF zr_empltp IN LOCAL MODE
           ENTITY Empl
              UPDATE FROM VALUE #( FOR key IN keys
                        ( eid = key-eid
                       status = 'R' " Retired
              %control-status = if_abap_behv=>mk-on ) )
              FAILED failed
              REPORTED reported.

    "Read changed data for action result
    READ ENTITIES OF zr_empltp IN LOCAL MODE
      ENTITY Empl
      ALL FIELDS WITH
      CORRESPONDING #( keys )
      RESULT DATA(empls).

    result = VALUE #( FOR empl IN Empls
             ( %tky   = empl-%tky
               %param = empl ) ).
  ENDMETHOD.

ENDCLASS.
