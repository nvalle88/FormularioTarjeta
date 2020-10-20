using System.Runtime.Remoting.Messaging;

namespace Card.Entity.DTO
{

    public class ReturnCardInfo
    {
        public string code { get; set; }
        public Details details { get; set; }
        public string message { get; set; }
    }

    public class Details
    {
        public string output { get; set; }
        public string output_type { get; set; }
        public string id { get; set; }
    }

    public class ResponseCard
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }

    }


}
