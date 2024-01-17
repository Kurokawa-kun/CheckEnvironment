//+------------------------------------------------------------------+
//|                                                     Example2.mq5 |
//|                                         Copyright 2024, Kurokawa |
//|                                   https://twitter.com/ImKurokawa |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Kurokawa"
#property link      "https://twitter.com/ImKurokawa"
#property version   "1.00"
#include <CheckEnvironment.mqh>

int OnInit()
{
   if (!CheckEnvironment(ChkExpertAllowed | ChkDllAllowed, NULL, NULL, NULL, NULL))
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
