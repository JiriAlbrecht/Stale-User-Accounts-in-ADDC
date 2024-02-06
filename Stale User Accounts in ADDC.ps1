###############################
# Stale User Accounts in ADDC #
###############################
#
#
###################################
# Author: Jiri Albrecht           #
# https://github.com/JiriAlbrecht #
###################################
#
#
####################################################################
# List of accounts that have not been used for more than 3 months. #
# Lists the last login and last password change.                   #
# Vypise ucty, ktere nebyly pouzity dele jak 3 mesice.             #
# Vypise posledni prihlaseni a posledni zmenu hesla.               #
####################################################################
#
#
#
$3mounthsAgou = (Get-Date).AddMonths(-3)
Get-ADUser -Filter { Enabled -eq $true -and (LastLogonDate -lt $3mounthsAgou -or LastLogonDate -notlike '*') } -Properties LastLogonDate,PasswordLastSet |
    Sort-Object -Property LastLogonDate |
    Format-Table -Property Name,SamAccountName,LastLogonDate,PasswordLastSet