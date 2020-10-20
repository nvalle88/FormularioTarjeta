using Card.Entity.DTO;
using Card.Services.Interface;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Utilidades;
using Utilidades.Extensores;

namespace Card.Services
{
    public class ServiceZoho : IServiceZoho
    {
        private string GetIdLog()
        {

            try
            {
                return Guid.NewGuid().ToString();
            }
            catch (Exception ex)
            {
                LoggerBase.WriteLog("GetIdLog", $"{ex.Serializar()}", TypeError.Error);
                return DateTime.Now.Ticks.ToString();
            }
        }

        private async Task<T> InterpretarRespuesta<T>(HttpResponseMessage httpResponse, string idLog)
        {
            try
            {
                var respuesta = await httpResponse.Content.ReadAsAsync<T>();

                switch (httpResponse.StatusCode)
                {
                    case HttpStatusCode.OK:
                        LoggerBase.WriteLog(GetType().ToString(),
                            $"{idLog} - RespuestaServicio: ({respuesta.Serializar()})",
                            TypeError.Trace);
                        return respuesta;

                    case HttpStatusCode.BadRequest:
                        LoggerBase.WriteLog(GetType().ToString(),
                            $"{idLog} - RespuestaServicio: ({respuesta.Serializar()})",
                            TypeError.Error);
                        return respuesta;

                    case HttpStatusCode.InternalServerError:
                        LoggerBase.WriteLog(GetType().ToString(),
                            $"{idLog} - Exception: ({respuesta.Serializar()})",
                            TypeError.Error);
                        throw new Exception("Error interno del servidor");

                    default:
                        LoggerBase.WriteLog(GetType().ToString(),
                            $"{idLog} - Exception: ({respuesta.Serializar()})",
                            TypeError.Error);
                        throw new Exception("No se puede obtener respuesta del servicio");
                }
            }
            catch (Exception e)
            {
                LoggerBase.WriteLog(GetType().ToString(),
                    $"{idLog} - Exception: ({e?.Message})",
                    TypeError.Error);
                throw new Exception("Error interno del servidor");
            }
        }

        private static string HideNumber(string number, int padNumber)
        {
            string hiddenString = number.Substring(number.Length - padNumber).PadLeft(number.Length, '*');
            return hiddenString;
        }

        //public async Task<ReturnCardInfo> SendCardInfo1(SendCardInfo sendCardInfo, int tryCallService)
        //{
        //    var idLog = GetIdLog();
        //    try
        //    {

                

        //        using (var client = new HttpClient())
        //        {


        //            var url = $"{LoggerBase.UrlBase}{LoggerBase.ApiCreditCardinfo}" +
        //            $"auth_type={LoggerBase.AuthType}&zapikey={LoggerBase.ZApiKey}";

        //            LoggerBase.WriteLog($"{idLog} - SendCardInfo - tryCallService: {tryCallService}", $"{url} - {sendCardInfo.Id}", TypeError.Trace);

        //            MultipartFormDataContent content = new MultipartFormDataContent();


        //            var request = JsonConvert.SerializeObject(new
        //            {
        //                sendCardInfo.CardNum,
        //                sendCardInfo.CVV,
        //                sendCardInfo.ExpDate,
        //                sendCardInfo.Id,

        //            });
        //            var contentMultipart = new StringContent(request, Encoding.UTF8, "application/json");

        //            content.Add(contentMultipart, "arguments");
        //            var urlnew= "https://www.zohoapis.com/crm/v2/functions/payterms/actions/execute?auth_type=apikey&zapikey=1003.c501090155e5b666305bfb9da1374afb.e359e73389e177b57233b4147ce21b34";
                    
        //            //System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
                
        //            return InterpretarRespuesta<ReturnCardInfo>(
        //                 await client.PostAsync(urlnew, content), idLog).Result;

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        LoggerBase.WriteLog($"{idLog} - SendCardInfo - tryCallService: {tryCallService}", $"{ex.Serializar()}", TypeError.Error);
        //        if (tryCallService > LoggerBase.TryCallService)
        //            return new ReturnCardInfo();

        //        tryCallService += 1;
        //        return await SendCardInfo(sendCardInfo, tryCallService);
        //    }
        //}

        public async Task<ResponseCard> SendCardInfo(SendCardInfo sendCardInfo, int tryCallService)
        {
            var idLog = GetIdLog();
            try
            {
                using (var client = new HttpClient())
                {

                   // var url  = "https://www.zohoapis.com/crm/v2/functions/payterms/actions/execute?auth_type=apikey&zapikey=1003.c501090155e5b666305bfb9da1374afb.e359e73389e177b57233b4147ce21b34";

                    var url = $"{LoggerBase.UrlBase}{LoggerBase.ApiCreditCardinfo}" +
                   $"auth_type={LoggerBase.AuthType}&zapikey={LoggerBase.ZApiKey}";

                    LoggerBase.WriteLog($"{idLog} - SendCardInfo - tryCallService: {tryCallService}", $"{url} - {sendCardInfo.Id}", TypeError.Trace);

                    MultipartFormDataContent content = new MultipartFormDataContent();


                    var request = JsonConvert.SerializeObject(new
                    {
                        sendCardInfo.CardNum,
                        sendCardInfo.CVV,
                        sendCardInfo.ExpDate,
                        sendCardInfo.Id,

                    });
                    var contentMultipart = new StringContent(request, Encoding.UTF8, "application/json");

                    content.Add(contentMultipart, "arguments");

                    System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

                    var httpResponse = await client.PostAsync(url, content);

                    LoggerBase.WriteLog($"{idLog} - Respuesta del Servicio", $"StatusCode: {httpResponse.StatusCode}", TypeError.Trace);


                    if (httpResponse.IsSuccessStatusCode)
                    {
                        return new ResponseCard
                        {
                            IsSuccess = true,
                            Message = string.Empty,

                        };
                    }

                    try
                    {
                        var respuesta = await httpResponse.Content.ReadAsAsync<ReturnCardInfo>();

                        LoggerBase.WriteLog($"{idLog} - Respuesta del Servicio Excepción", $"StatusCode: {httpResponse.StatusCode}, Respuesta: {respuesta.Serializar()}", TypeError.Trace);

                        return new ResponseCard
                        {
                            IsSuccess = false,
                            Message = respuesta.message,
                        };
                    }
                    catch (Exception ex)
                    {
                        LoggerBase.WriteLog($"{idLog} - Respuesta del Servicio Excepción", $"StatusCode: {httpResponse.StatusCode}, Excepcion: {ex.Serializar()}", TypeError.Trace);

                        return new ResponseCard
                        {
                            IsSuccess = false,
                            Message = ex.Message,
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                LoggerBase.WriteLog($"{idLog} - Excepción", $" Excepcion: {ex.Serializar()}", TypeError.Trace);
                if (tryCallService > LoggerBase.TryCallService)
                    return new ResponseCard
                    {
                        IsSuccess = false,
                        Message = ex.Message,
                    };

                tryCallService += 1;
                return await SendCardInfo(sendCardInfo, tryCallService);
            }
        }
    }


}
