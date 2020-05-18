using General.Utility;
using Microsoft.Extensions.Configuration;
using Service.Interface;
using System;
using System.Collections.Generic;
using General.Model;
using Transaction.Dao;

namespace Service.Manager
{
    public class TransactionManager : ITransactionManager
    {
        private readonly SchduleDao SchduleDao;
        private readonly IConfiguration _config;
        private readonly Logger _logger;

        public TransactionManager(IConfiguration _config)
        {
            this.SchduleDao = new SchduleDao(_config);
            this._config = _config;
            this._logger = new Logger(_config);
        }

        public string DestinationLogFolder()
        {
            return _config.GetSection("Logging:DestinationFolder:Service").Value.ToString();
        }

        public IList<ScheduleModel> GetAllSchedule()
        {
            IList<ScheduleModel> data = new List<ScheduleModel>();

            try
            {
                data = SchduleDao.GetAllSchedule();



            }
            catch (Exception ex)
            {
                _logger.WriteFunctionLog(DestinationLogFolder(), "", "GetAllSchedule", ex.Message, "Service");

            }

            return data;
        }

        public ScheduleModel CreateSchedule(ScheduleModel model)
        {
            var data = new ScheduleModel();

            try
            {
                data = SchduleDao.CreateSchedule(model);


            }
            catch (Exception ex)
            {
                _logger.WriteFunctionLog(DestinationLogFolder(), "", "CreateSchedule", ex.Message, "Service");

            }

            return data;
        }

        public ScheduleModel UpdateSchedule(ScheduleModel model)
        {
            var data = new ScheduleModel();

            try
            {
                data = SchduleDao.UpdateSchedule(model);


            }
            catch (Exception ex)
            {
                _logger.WriteFunctionLog(DestinationLogFolder(), "", "UpdateSchedule", ex.Message, "Service");

            }

            return data;
        }

        public void RemoveSchedule(int Id)
        {
            try
            {
                SchduleDao.RemoveSchedule(Id);

            }
            catch (Exception ex)
            {
                _logger.WriteFunctionLog(DestinationLogFolder(), "", "RemoveSchedule", ex.Message, "Service");

            }
        }
    }
}
