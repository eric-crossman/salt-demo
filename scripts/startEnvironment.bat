REM *** Utility script to start all virtual machines in the Salt Demo environment.

REM *** VM 1 - SaltMaster
call az vm start --name SaltMaster

REM *** VM 2 - MediaWiki
call az vm start --name MediaWiki
