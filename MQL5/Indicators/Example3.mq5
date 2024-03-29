//+------------------------------------------------------------------+
//|                                                     Example3.mq5 |
//|                                         Copyright 2024, Kurokawa |
//|                                   https://twitter.com/ImKurokawa |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Kurokawa"
#property link      "https://twitter.com/ImKurokawa"
#property version   "1.00"
#include <CheckEnvironment.mqh>

#property indicator_separate_window
#property indicator_color1 clrBlue
input int Param1 = 50;

int OnInit()
{
   if (!CheckEnvironment(ChkExclusiveInChart, NULL, NULL, NULL, NULL))
   {
      //  Eliminate this instance from the chart.
      //  Because of the difference between MT4 and MT5, you have to manually delete
      //   the instance of this indicator. Then you should return INIT_FAILED.
      for (int s = 0; s < ChartGetInteger(0, CHART_WINDOWS_TOTAL); s++)
      {
         for (int i = 0; i < ChartIndicatorsTotal(0, s); i++)
         {
            if (ChartIndicatorName(0, s, i) == MQLInfoString(MQL_PROGRAM_NAME))
            {
               ChartIndicatorDelete(0, s, MQLInfoString(MQL_PROGRAM_NAME));
               break;
            }
         }
      }
      return INIT_FAILED;
   }
   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
   return(rates_total);
}
