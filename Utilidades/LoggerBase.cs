using log4net;
using System;
using System.Reflection;

namespace Utilidades
{

    /// <summary>
    /// 
    /// </summary>
    public enum TypeError
    {
        Trace,
        Warning,
        Error,
        Debug
    }


    /// <summary>
    /// 
    /// </summary>
    public class LoggerBase
    {
        #region Instancias

        /// <summary>
        /// Logger
        /// </summary>
        public static readonly ILog Logger = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        #endregion Instancias

        public static readonly int TryCallService;

        #region Uri
        public static readonly string UrlBase;
        #endregion Uri

        #region Apis
        public static readonly string ApiCreditCardinfo;
        public static readonly string AuthType;
        public static readonly string ZApiKey;

        #endregion

        #region Constructor

        static LoggerBase()
        {
            try
            {
                UrlBase = System.Configuration.ConfigurationManager.AppSettings["UrlBase"];
                ApiCreditCardinfo = System.Configuration.ConfigurationManager.AppSettings["ApiCreditCardinfo"];
                AuthType = System.Configuration.ConfigurationManager.AppSettings["AuthType"];
                ZApiKey = System.Configuration.ConfigurationManager.AppSettings["ZApiKey"];
                
                var number = System.Configuration.ConfigurationManager.AppSettings["TryCallService"];

                if (int.TryParse(number, out int resultNumber))
                {
                    TryCallService = resultNumber;
                }
                else
                {
                    TryCallService = 1;
                }

            }
            catch (Exception ex)
            {
                Logger.Error(ex);
                throw;
            }
        }

        #endregion Constructor



        public static void WriteLog(string logModule, string message, TypeError typeError)
        {
            try
            {
                switch (typeError)
                {
                    case TypeError.Trace:
                        Logger.InfoFormat("{0} - {1}", logModule, message);
                        break;
                    case TypeError.Warning:
                        Logger.WarnFormat("{0} - {1}", logModule, message);
                        break;
                    case TypeError.Error:
                        Logger.ErrorFormat("{0} - {1}", logModule, message);
                        break;
                    case TypeError.Debug:
                        Logger.DebugFormat("{0} - {1}", logModule, message);
                        break;
                }
            }
            catch
            {
            }
        }

    }
}