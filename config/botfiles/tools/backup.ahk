#SingleInstance Force

; Deletes previous backup
FileRemoveDir, C:\ProgramData\ITFBackup\, 1

; Checks to see if deletion was successful
IfExist, C:\ProgramData\ITFBackup\
{
	Gosub fail
	return
}

; Copies IdealTF location to the backup location
IfExist, C:\ProgramData\ITFBackup
{
	IfExist, C:\IdealTF
	{
		FileCopyDir, C:\IdealTF, C:\ProgramData\ITFBackup
	}
}

; Checks to see if backup was successful
IfNotExist, C:\ProgramData\ITFBackup
{
	Gosub fail
	return
}
done:
fail:
ExitApp