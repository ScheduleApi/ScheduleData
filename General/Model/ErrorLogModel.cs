using System;
using System.Collections.Generic;
using System.Text;

namespace General.Model
{
    public class ErrorLogModel
    {
        public int Id { get; set; }
        public string ErrorSource { get; set; }
        public string ErrorMessage { get; set; }
        public string FunctionName { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
