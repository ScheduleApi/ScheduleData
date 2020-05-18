using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using General.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Service.Interface;
using Service.Manager;

namespace Schedule.Helper
{
    public class HelperController : Controller
    {
        private IConfiguration _config;
        private readonly ITransactionManager ITransactionManager;
        private readonly Logger _logger;
        public HelperController(IConfiguration config)
        {
            this._config = config;
            this._logger = new Logger(config);
            this.ITransactionManager = new TransactionManager(config);

        }

        public string DestinationLogFolder()
        {
            return _config.GetSection("Logging:DestinationFolder:Web").Value.ToString();
        }

        public void InsertLog(string x ,string function, string message)
        {

            _logger.WriteFunctionLog(DestinationLogFolder(),"",function, message, "Web");

        }
    }
}