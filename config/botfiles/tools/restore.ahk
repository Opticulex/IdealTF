#SingleInstance Force
; Checks to see if a backup actually exists to stop sad mistakes.
IfNotExist, C:\ProgramData\ITFBackup
{
	ExitApp
}

; Deletes the IdealTF location
IfExist, C:\IdealTF\
{
	FileRemoveDir, C:\IdealTF\, 1
}
; Copies the backup file to the IdealTF location
IfExist, C:\IdealTF\
{
	IfExist, C:\ProgramData\ITFBackup
	{
		FileCopyDir, C:\ProgramData\ITFBackup, C:\IdealTF\
	}
}
; Checks to see if backup was successful
IfNotExist, C:\IdealTF
{
	ExitApp
}
ExitApp