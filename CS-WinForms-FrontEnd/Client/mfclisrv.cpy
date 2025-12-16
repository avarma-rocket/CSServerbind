      *>***********************************************************************
      *>
      *> Copyright (C) 1986-2012 Micro Focus. All rights reserved.
      *>
      *>
      *> Micro Focus Client-Server Bindings (CSBind)
      *>
      *> Source Module mfclisrv.cpy  $Revision: 488425 $
      *>***********************************************************************
      *>
      *> Start of copy file mfclisrv.cpy
      *>
      *>***********************************************************************
      *>-------------------------------------------------------*
      *>  Used for passing information between mfclient,       *
      *>  mfserver, and the user processing programs.          *
      *>  Most of the fields have entries in the configuration *
      *>  file, and default values are assigned for any which  *
      *>  have not been specified.                             *
      *>                                                       *
      *>  If you copy this into LINKAGE SECTION rather than    *
      *>  WORKING STORAGE (for a server program, or e.g. in    *
      *>  order to allocate it at run time), you can define    *
      *>  the constant CSB-LPB-LINKAGE to suppress warnings    *
      *>  about VALUE clauses in linkage. See netxserv.cbl for *
      *>  an example.                                          *
      *>-------------------------------------------------------*
       01  lnk-param-block.
          03  lnk-cntrl-flag       pic x comp-x
      $if CSB-LPB-LINKAGE not defined
                                   value 0
      $end
                                   .
              88 result-ok         value 0.
              88 new-client        value 1.
              88 client-ending     value 2.
              88 start-connection  value 3.
              88 end-connection    value 4.
              88 switch-srv        value 5.
              88 too-many-clients  value 6.
              88 rpc-failed        value 7.
              88 comms-timeout     value 8.
              88 comms-error       value 9 10.
              88 comms-break       value 10.
              88 async-request     value 11.
              88 async-OK          value 12.
              88 async-not-started value 13.
              88 test-async-result value 14.
              88 async-incomplete  value 15.
              88 async-failed      value 16.
              88 get-dblock-size   value 17.
              88 usr-function      value 18.
              88 null-transaction  value 19.
              88 ds-callout        value 20.
              88 mtrans-continued  value 21.
              88 mtrans-complete   value 22.
              88 load-cfg-filename value 23.
              88 redirect-service  value 24.
              88 redirect-cfg-err  value 25.
              88 ds-callout-failed value 26.
              88 no-srv-prog       value 27.
              88 load-inline-cfg   value 28.
              88 use-combined-cfg  value 29.
              88 end-inline-cfg    value 30.
              88 stop-server       value 31.
              88 setup-override    value 32.
              88 get-password      value 33.
              88 invalid-password  value 34.
              88 install-ovrd      value 35.
              88 remove-ovrd       value 36.
              88 server-locked     value 37.
              88 dual-svc          value 38.
              88 get-version-no    value 39.
              88 csmgr-svc         value 31 THRU 42.
              88 use-rdt           value 43.
              88 send-via-rdt      value 44 45.
              88 send-via-comp-rdt value 45.
              88 scfm-delete       value 46.
              88 scfm-start        value 47.
              88 scfm-install      value 48.
              88 scfm-cancelled    value 49.
              88 scfm-complete     value 50.
              88 AAI-use-rdt       value 51.
              88 compressed-data   value 64 thru 127
                                         192 thru 255.
              88 start-mtrans      value 128 thru 255.
              88 val-cli-opts      value 0 2 9 11 14 18 20 39 43.
              88 val-srv-opts      value 0 2 3 9 18 43.
          03  lnk-usr-fcode        pic x comp-x.
          03  lnk-usr-retcode      pic x comp-x.
              88 cstart                 VALUE 1 11.
              88 dstart                 VALUE 2 12.
              88 estart                 VALUE 3 13.
              88 ustart                 VALUE 4 14.
              88 valid-rdt              VALUE 1 2 3 4 11 12 13 14.
              88 compressed-rdt         VALUE 11 12 13 14.
          03  lnk-data-length      pic xx comp-x.
          03  lnk-client-id        pic xx comp-x.
          03  lnk-tagname          pic x(32).
          03  lnk-scrntype         pic x(4).
              88 char-scrn         value "CHAR".
              88 gui-scrn          value "GUI".
              88 adis-scrn         value "ADIS".
          03  lnk-error-val        pic 99.
          03  lnk-error-dtl.
              05  lnk-error-date   pic x(20).
              05  lnk-error-loc    pic x(45).
          03  lnk-error-msg        pic x(175).
          03  lnk-error-msg-len    pic x(4) comp-5.
          03  lnk-client           pic x(8)
      $if CSB-LPB-LINKAGE not defined
                                   value "mfclient"
      $end
                                   .
          03  lnk-cblock-ptr       usage pointer
      $if CSB-LPB-LINKAGE not defined
                                   value NULL
      $end
                                   .
          03  lnk-dblock-ptr       usage pointer
      $if CSB-LPB-LINKAGE not defined
                                   value NULL
      $end
                                   .
          03  lnk-eblock-ptr       usage pointer
      $if CSB-LPB-LINKAGE not defined
                                   value NULL
      $end
                                   .
          03  lnk-ublock-ptr       usage pointer
      $if CSB-LPB-LINKAGE not defined
                                   value NULL
      $end
                                   .
      *> End of source module mfclisrv.cpy
