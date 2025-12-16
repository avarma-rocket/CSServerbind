       identification division.

       program-id. NativeCobolClient as "NativeCobolClient"

       working-storage section.
       copy "mfclisrv.cpy".
       01 ws-record-information.
         03 ws-record-num pic x(8).
         03 ws-firstname pic x(25).
         03 ws-lastname pic x(25).

       linkage section.
       01 lnk-record-info.
         03 lnk-record-num pic x(8).
         03 lnk-firstname pic x(25).
         03 lnk-lastname pic x(25).

       01 input-rec pic x(64).

       procedure division using lnk-record-info.
           perform until end-connection
               call lnk-client using lnk-param-block
               evaluate true
                   when start-connection
                       set address of input-rec to lnk-dblock-ptr
                   when end-connection
                       exit perform
                   when other
                       set address of input-rec to lnk-dblock-ptr
                       move lnk-record-info to input-rec
                       call lnk-client using lnk-param-block
                       move input-rec to ws-record-information
                       move ws-record-information to lnk-record-info
                       goback
               end-evaluate
           end-perform
           goback.
