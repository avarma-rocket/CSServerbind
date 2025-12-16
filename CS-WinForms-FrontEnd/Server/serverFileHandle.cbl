       identification division.

       environment division.
       configuration section.
           select custFile assign to "custFile.dat"
               organization is indexed
               access is random
               record key is f-record-num of custFile.

       file section.
       fd custFile.
       01 f-record-information.
           03 f-record-num pic x(8).
           03 f-firstname pic x(25).
           03 f-lastname pic x(25).

       working-storage section.
       01 ws-record-information.
           03 ws-record-num pic x(8).
           03 ws-firstname pic x(25).
           03 ws-lastname pic x(25).

       linkage section.
       copy "mfclisrv.cpy".

       01 input-rec pic x(64).
       procedure division using lnk-param-block.
           set address of input-rec to lnk-dblock-ptr
           evaluate true
               when start-connection
                   perform program-initialise
                   exit program
               when client-ending
                   display "bye client!"
                   exit program
               when other
                   perform program-body
           end-evaluate

           goback.

       program-initialise section.
           open i-o custFile
           move 00000001 to ws-record-num
           move "Harry" to ws-firstname
           move "Morley" to ws-lastname

           move ws-record-information to f-record-information
           write f-record-information
               invalid key
                   display "Record Key Invalid or Already Exists"
               not invalid key
                   display "Record Added"
           end-write

           move 00000002 to ws-record-num
           move "Bob" to ws-firstname
           move "Marley" to ws-lastname

           move ws-record-information to f-record-information
           write f-record-information
               invalid key
                   display "Record Key Invalid or Already Exists"
               not invalid key
                   display "Record Added"
           end-write

           move 00000003 to ws-record-num
           move "Test" to ws-firstname
           move "Testington" to ws-lastname

           move ws-record-information to f-record-information
           write f-record-information
               invalid key
                   display "Record Key Invalid or Already Exists"
               not invalid key
                   display "Record Added"
           end-write
           close custFile.
           display "Server Initialised!"
           .

       program-body section.
           move input-rec to ws-record-num
           display "Hello From Server!"
           display "Input from client: " input-rec
           perform search-record
           .

       search-record section.
           open input custFile
           move ws-record-num to f-record-num
           read custFile
               invalid key
                   display "Record Not Found"
               not invalid key
                   move f-record-information to ws-record-information
                   move spaces to input-rec
                   display input-rec
                   move ws-record-information to input-rec
                   display input-rec                   
           end-read
           close custFile
           .
