       identification division.

       program-id. NativeCobolClient as "NativeCobolClient"


*      mfclisrv.cpy must be included in the working storage
*      section of the client program and in the linkage
*      section of the server program.


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

*      Input-Rec is the area used for transfering data
*      between the user client and the server programs.
*      The size of this data area is defined by the user
*      in the Client/Server Binding configuration file
*      which is read by the mfclient module. mfclient
*      sets up the required memory for this area and
*      returns a pointer to this area back to the user
*      client program

       01 input-rec pic x(64).

       procedure division using lnk-record-info.
           perform until end-connection

*              lnk-client holds the name "mfclient".
*              The first time through we initialize mfclient and
*              establish contact with the server.

               call lnk-client using lnk-param-block
               evaluate true
                   when start-connection
                       set address of input-rec to lnk-dblock-ptr
                   when end-connection
                       exit perform
                   when other
                   
*                   Perform your application client logic here.

                       set address of input-rec to lnk-dblock-ptr
                       move lnk-record-info to input-rec
                       call lnk-client using lnk-param-block
                       move input-rec to ws-record-information
                       move ws-record-information to lnk-record-info
                       set client-ending to true
               end-evaluate
           end-perform

           goback.
