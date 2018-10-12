REM *** Utility script to stop all virtual machines for Salt Demo

REM *** Stop VM 1 - SaltMaster
call az vm stop --name SaltMaster

REM *** Stop VM 2 - MediaWiki
call az vm stop --name MediaWiki
