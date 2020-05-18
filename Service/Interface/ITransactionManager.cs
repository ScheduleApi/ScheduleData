using General.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Service.Interface
{
    public interface ITransactionManager
    {
        IList<ScheduleModel> GetAllSchedule();
        ScheduleModel CreateSchedule(ScheduleModel model);
        ScheduleModel UpdateSchedule(ScheduleModel model);
        void RemoveSchedule(int Id);
    }
}
