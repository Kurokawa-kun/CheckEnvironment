# CheckEnvironment
※ 主に海外の方から利用されることを想定しているため、説明は英語で書いています。<br>
The common library which provides envrionment check functionality on MT5. This module streamlines conventional main check procedule called in OnInit function, such as server name check, account type check and exclusive execution on a chart window etc.<br>

# How to use
1. Extract the zip file into MT5 data folder.
2. Include the header file.
3. Call CheckEnvironment function in OnInit.

The following is an example:

```
#include <CheckEnvironment.mqh>

int OnInit()
{
   //  Call CheckEnvironment function
   if (!CheckEnvironment(ChkExpertAllowed | ChkDllAllowed, NULL, NULL, NULL, NULL))
   {
      return INIT_FAILED;
   }

   //  Other initializations
   ...
   
   return INIT_SUCCEEDED;
}
```

# CheckEnvironment
bool CheckEnvironment(string CompanyName, string TerminalName, string ServerNames, string FileName)
## Parameters
<table>
  <tr>
    <th>Parameter names</th>
    <th>Details</th>
  </tr>
  <tr>
    <td>CompanyName</td>
    <td>Choose following options you would like to check:
      <ul>
        <li>ChkTerminalName</li>
        <li>ChkServerName</li>
        <li>ChkFileName</li>
        <li>ChkRealAccountOnly</li>
        <li>ChkConnection</li>
        <li>ChkExpertAllowed</li>
        <li>ChkDllAllowed</li>
        <li>ChkExclusiveInChart</li>
        <li>ChkExclusiveInTerminal</li>
    </ul>
    </td>
  </tr>
  <tr>
    <td>TerminalName</td>
    <td>This parameter is checked when you specify ChkTerminalName option. If you don't need to check terminal name, you should set NULL.
    </td>
  </tr>
  <tr>
    <td>ServerNames</td>
    <td>This parameter is checked when you specify ChkServerName option. You should write in comma separated format, such as:<br>
      "AAAA server,BBBB server,CCCC server"<br>
      If you don't need to check server name, you should set NULL.
    </td>
  </tr>
  <tr>
    <td>FileName</td>
    <td>This parameter is checked when you specify ChkFileName option. This option is to prevent the binary file from changing its name. If you don't need to check file name, you should set NULL.
    </td>
  </tr>
</table>

## Return value
This function returns true when the system satisfy all conditions. In other cases, it returns false and shows an error message.

# Note
Due to some changes in the instantiation process of indicator in MT5, you have to eliminate manually the instance in addition to return INIT_FAILED. See Example3.mq5.

```
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
```
