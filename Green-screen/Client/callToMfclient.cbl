      $set sourceformat(variable)
       identification division.

       environment division.
       special-names.
           crt status is key-status.

*      mfclisrv.cpy must be included in the working storage
*      section of the client program and in the linkage
*      section of the server program.

       working-storage section.
       copy "mfclisrv.cpy".

       01 key-status.
         03 key-type pic x.
         03 key-code-1 pic 9(2) comp-x.
         03 key-code-2 pic x redefines key-code-1.
         03 filler pic x.

       01 set-bit-pairs             pic 9(2) comp-x value 1.
       01 user-key-control.
           03 user-key-setting      pic 9(2) comp-x.
           03 filler                pic x value "1".
           03 first-user-key        pic 9(2) comp-x.
           03 number-of-keys        pic 9(2) comp-x.
           
       78 escape-key value 0.
       
       01 ws-record-information.
         03 ws-record-num pic x(8).
         03 ws-firstname pic x(25).
         03 ws-lastname pic x(25).


*      Input-Rec is the area used for transfering data
*      between the user client and the server programs.
*      The size of this data area is defined by the user
*      in the Client/Server Binding configuration file
*      which is read by the mfclient module. mfclient
*      sets up the required memory for this area and
*      returns a pointer to this area back to the user
*      client program

       linkage section.

       01 input-rec pic x(64).


       screen section.
       01 g-record-information.
         02 line 2 col 5 value "Enter Record Number:".
         02 s-record-num line 2 col 25 background-color 15
                         foreground-color 0 pic x(8) to ws-record-num
                         full.

         02 line 4 col 5 value "First Name".
         02 s-firstname line 5 col 5 background-color 15
                        foreground-color 0 pic x(28) using ws-firstname.

         02 line 7 col 5 value "Last Name".
         02 s-lastname line 8 col 5 background-color 15 foreground-color
                       0 pic x(28) using ws-lastname.




       procedure division.
           display spaces upon crt
           display g-record-information
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
                       perform initalise

*                  loop to repeat user input until esc key is pressed
                       perform until client-ending
                           accept s-record-num
                           if key-type = "1"
                           evaluate key-code-1
                               when escape-key
                                   exit perform
                           end-if

*                    move input from screen to working storage and 
*                    re-call the lnk-client to retrieve data provided 
*                    by server through the input-rec

                           move ws-record-information to input-rec
                           call lnk-client using lnk-param-block
                           move input-rec to ws-record-information
                           display s-firstname
                           display s-lastname
                       end-perform
                       set client-ending to true
                       call "system" using "cls"
               end-evaluate
           end-perform
           goback
           .
       

      * Enables the escape key to exit out the program
       initalise.
           move 1 to user-key-setting
           move 0 to first-user-key
           move 1 to number-of-keys
           call x"AF" using set-bit-pairs
                            user-key-control
           .
