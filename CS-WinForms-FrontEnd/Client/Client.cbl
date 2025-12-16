       identification division.
       program-id. Client as "Client.Client".
       working-storage section.

 
       linkage section.
       01 lnk-record-info.
         03 lnk-record-num pic x(8).
         03 lnk-firstname pic x(25).
         03 lnk-lastname pic x(25).


*      Call to the client side native cobol program  

       procedure division using lnk-record-info.
           call "NativeCobolClient" using lnk-record-info.
       goback.

