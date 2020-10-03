using Card.Entity.DTO;
using Card.Services.Interface;
using System;
using System.Net;
using System.Net.Http;
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

        public async Task<ReturnCardInfo> SendCardInfo(SendCardInfo sendCardInfo, int tryCallService)
        {
            var idLog = GetIdLog();
            try
            {
                using (var client = new HttpClient())
                {
                    var request = $"{LoggerBase.UrlBase}{LoggerBase.ApiCreditCardinfo}" +
                        $"auth_type={LoggerBase.AuthType}&zapikey={LoggerBase.ZApiKey}";

                    LoggerBase.WriteLog($"{idLog} - SendCardInfo - tryCallService: {tryCallService}", $"{request} - {sendCardInfo.Id}", TypeError.Trace);

                    using (var multipartFormDataContent = new MultipartFormDataContent())
                    {

                        HttpContent cardNumberContent = new StringContent(sendCardInfo.CardNum); // Le contenu du paramètre P1
                        HttpContent CVVContent = new StringContent(sendCardInfo.CVV);
                        HttpContent ExpDateContent = new StringContent(sendCardInfo.ExpDate);
                        HttpContent IdContent = new StringContent(sendCardInfo.Id);

                        multipartFormDataContent.Add(cardNumberContent, "CardNum");
                        multipartFormDataContent.Add(CVVContent, "CVV");
                        multipartFormDataContent.Add(ExpDateContent, "ExpDate");
                        multipartFormDataContent.Add(IdContent, "Id");

                        var result = client.PostAsync(request, multipartFormDataContent).Result;
                    }

                    return await InterpretarRespuesta<ReturnCardInfo>(
                        await client.GetAsync(request), idLog);
                }
            }
            catch (Exception ex)
            {
                LoggerBase.WriteLog($"{idLog} - SendCardInfo - tryCallService: {tryCallService}", $"{ex.Serializar()}", TypeError.Error);
                if (tryCallService > LoggerBase.TryCallService)
                    return new ReturnCardInfo();

                tryCallService += 1;
                return await SendCardInfo(sendCardInfo, tryCallService);
            }
        }
    }


}
