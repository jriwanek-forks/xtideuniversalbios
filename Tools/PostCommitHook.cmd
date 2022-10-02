@echo off
if exist ..\CommitInProgress goto NoError1
echo PostCommitHook was called but no CommitInProgress file could be found!>con
echo Something is very wrong as this should not happen!>con
pause<con>con
exit 1
:NoError1
del ..\CommitInProgress
exit 0