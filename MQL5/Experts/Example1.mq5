//+------------------------------------------------------------------+
//|                                                     Example1.mq5 |
//|                                         Copyright 2024, Kurokawa |
//|                                   https://twitter.com/ImKurokawa |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Kurokawa"
#property link      "https://twitter.com/ImKurokawa"
#property version   "1.00"
#include <CheckEnvironment.mqh>

int OnInit()
{
   PrintFormat("TERMINAL_COMPANY :%s", TerminalInfoString(TERMINAL_COMPANY));
   PrintFormat("ACCOUNT_SERVER   :%s", AccountInfoString(ACCOUNT_SERVER));
   PrintFormat("TERMINAL_NAME    :%s", TerminalInfoString(TERMINAL_NAME));
   PrintFormat("MQL_PROGRAM_NAME :%s", MQLInfoString(MQL_PROGRAM_NAME));
   
   if (!CheckEnvironment(ChkCompanyName | ChkServerNames, "Hogehoge securities co.,Ltd.", NULL, "AAAA server,BBBB server,CCCC server", NULL))
   {
      return INIT_FAILED;
   }
      
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
}

void OnTick()
{
}
