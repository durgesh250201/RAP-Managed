CLASS lhc_emply DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_instance_authorizations FOR INSTANCE AUTHORIZATION
        importing
        REQUEST requested_authorizations FOR Emply
        RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES IMPORTING keys REQUEST requested_features FOR Emply RESULT result.
    METHODS approval FOR MODIFY IMPORTING keys FOR ACTION Emply~approval RESULT result.
ENDCLASS.

CLASS lhc_emply IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD Approval.
    READ ENTITIES OF zr_emply01tp
    IN LOCAL MODE ENTITY Emply
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).
  ENDMETHOD.


ENDCLASS.

CLASS lsc_EMPLY DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_emply IMPLEMENTATION.

  METHOD cleanup_finalize.

  ENDMETHOD.

  METHOD save_modified.
    DATA: ls      TYPE zi_emply01tp,
          lt_ephd TYPE TABLE OF zdrm_emptb,
          lt_epbs TYPE TABLE OF zi_empskltp,
          ls_bs   TYPE zdrm_emptb,
          lt_bs   TYPE TABLE OF zdrm_emptb,
          ls_tb   TYPE zdrm_empsk,
          lt_tb   TYPE TABLE OF zdrm_empsk.

    IF create IS NOT INITIAL.
      lt_ephd = CORRESPONDING #( create-emply MAPPING FROM ENTITY  ).
      lt_epbs = CORRESPONDING #( create-empskl ).
    ENDIF.

    IF update IS NOT INITIAL.
      lt_ephd = CORRESPONDING #( update-emply MAPPING FROM ENTITY ).
      lt_epbs = CORRESPONDING #( update-empskl ).
    ENDIF.

    IF delete IS NOT INITIAL.
      lt_ephd = CORRESPONDING #( delete-emply MAPPING FROM ENTITY ).
      lt_epbs = CORRESPONDING #( delete-empskl ).
    ENDIF.

    READ TABLE lt_ephd ASSIGNING FIELD-SYMBOL(<ls_ephd>) INDEX 1.
    IF sy-subrc EQ 0.
      ls_bs-eid      = <ls_ephd>-eid.
      ls_bs-fname    = <ls_ephd>-fname.
      ls_bs-lname    = <ls_ephd>-lname.
      ls_bs-gender   = <ls_ephd>-gender.
      ls_bs-dept     = <ls_ephd>-dept.
      ls_bs-status   = <ls_ephd>-Status.
      ls_bs-doj      = <ls_ephd>-doj.
      ls_bs-dol      = <ls_ephd>-dol.
      ls_bs-salary   = <ls_ephd>-salary.
      ls_bs-currency = <ls_ephd>-Currency.
      APPEND ls_bs TO lt_bs.
    ENDIF.

    LOOP AT lt_epbs ASSIGNING FIELD-SYMBOL(<ls_epbs>).
        ls_tb-eid = <ls_epbs>-eid.
        ls_tb-sid = <ls_epbs>-sid.
        ls_tb-sname = <ls_epbs>-sname.
        ls_tb-exp = <ls_epbs>-exp.
        ls_tb-hotskill = <ls_epbs>-Hotskill.
        APPEND ls_tb TO lt_tb.
    ENDLOOP.

    IF lt_bs IS NOT INITIAL AND delete IS INITIAL.
        MODIFY zdrm_emptb FROM TABLE @lt_bs.
    ENDIF.

    IF lt_tb IS NOT INITIAL AND delete IS INITIAL.
        MODIFY zdrm_empsk FROM TABLE @lt_tb.
    ENDIF.

    IF delete IS NOT INITIAL.

        IF lt_bs IS NOT INITIAL AND lt_tb IS NOT INITIAL.
            DELETE zat_po_hd FROM TABLE @lt_bs.
            IF sy-subrc EQ 0.
                DELETE zdrm_emptb FROM TABLE @lt_tb.
            ENDIF.
        ENDIF.

        IF lt_tb IS NOT INITIAL AND lt_bs IS INITIAL .
            DELETE zdrm_empsk FROM TABLE @lt_tb.
        ENDIF.

     ENDIF.

  ENDMETHOD.

ENDCLASS.
