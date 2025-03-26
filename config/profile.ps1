# $PROFILE
Set-PSReadLineOption -Colors @{
    "Command" = "`e[97m"
    "Comment" = "`e[97m"
    "ContinuationPrompt" = "`e[97m"
    "Default" = "`e[97m"
    "Emphasis" = "`e[97m"
    "Error" = "#F75F8F"
    "InlinePrediction" = "`e[90m"
    "Keyword" = "#DA68FB"
    "ListPrediction" = "`e[90m"
    "ListPredictionSelected" = "`e[90m"
    "ListPredictionTooltip" = "`e[90m"
    "Member" = "`e[35m"
    "Number" = "`e[32m"
    "Operator" = "`e[34m"
    "Parameter" = "`e[32m"
    "Selection" = "`e[35m"
    "String" = "`e[32m"
    "Type" = "`e[35m"
    "Variable" = "`e[96m"
}

# $PSStyle
$PSStyle.Formatting.FormatAccent = "`e[32m"
$PSStyle.Formatting.ErrorAccent = "`e[91m"
$PSStyle.Formatting.Error = "`e[31m"
$PSStyle.Formatting.Warning = "`e[33m"
$PSStyle.Formatting.Verbose = "`e[93m"
$PSStyle.Formatting.Debug = "`e[33m"
$PSStyle.Formatting.TableHeader = "`e[37m"
$PSStyle.Formatting.CustomTableHeaderLabel = "`e[37m"
$PSStyle.Formatting.FeedbackName = "`e[37m"
$PSStyle.Formatting.FeedbackText = "`e[90m"
$PSStyle.Formatting.FeedbackAction = "`e[97m"
$PSStyle.Progress.Style = "`e[34m"
$PSStyle.FileInfo.Directory = "`e[90m"
$PSStyle.FileInfo.SymbolicLink = "`e[34m"
$PSStyle.FileInfo.Executable = "`e[31m"

# Install-Module PSReadLine -Repository PSGallery -Scope CurrentUser -Force
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# winget install starship
Invoke-Expression (&starship init powershell)

# winget install zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })