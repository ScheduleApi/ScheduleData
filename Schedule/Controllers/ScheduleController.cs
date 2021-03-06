﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Service.Interface;
using General.Model;
using Service.Manager;
using Schedule.Helper;

namespace Schedule.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]/[action]")]

    public class ScheduleController : Controller
    {
        private readonly ITransactionManager ITransactionManager;
        public ScheduleController(IConfiguration config)
        {
            this.ITransactionManager = new TransactionManager(config);
        }
        [HttpGet]
        [Route("~/api/Schedule/GetAllSchedule")]
        public IActionResult GetAllSchedule()
        {
            var CurrentSchedule = ITransactionManager.GetAllSchedule().ToList();
            return Json(new { CurrentSchedule, Status = "OK" });
        }

        [HttpPost]
        [Route("~/api/Schedule/PostSchedule")]
        public IActionResult PostSchedule([FromBody]ScheduleModel model)
        {
            try
            {
                ScheduleModel data = new ScheduleModel();
                data.Title = model.Title;
                data.StartDate = model.StartDate;
                data.EndDate = model.EndDate;
                data.Description = model.Description;
                var getCurrentData = ITransactionManager.CreateSchedule(data);
                return Json(new { getCurrentData, Status = "OK" });
            }
            catch (Exception ex)
            {
                return Json(new { Status = "Error" });
                throw ex;
            }
        }

        [HttpPut]
        [Route("~/api/Schedule/UpdateSchedule")]
        public IActionResult UpdateSchedule([FromBody] ScheduleModel model)
        {
            try
            {
                var data = ITransactionManager.GetAllSchedule().Where(m => m.Id == model.Id).FirstOrDefault();
                data.Id = model.Id;
                if (string.IsNullOrEmpty(model.Title) || string.IsNullOrEmpty(model.Description))
                {
                    data.Title = data.Title;
                    data.Description = data.Description;
                }

                else
                {
                    data.Title = model.Title;
                    data.Description = model.Description;
                }
                data.StartDate = model.StartDate;
                data.EndDate = model.EndDate;
                data.Description = model.Description;

                var getCurrentData = ITransactionManager.UpdateSchedule(data);

                return Json(new { getCurrentData, Status = "OK" });
            }
            catch (Exception ex)
            {
                return Json("Error");
                throw ex;
            }
        }

        [HttpPost]
        [Route("~/api/Schedule/RemoveSchedule")]
        public IActionResult RemoveSchedule(int Id)
        {
            try
            {
                ITransactionManager.RemoveSchedule(Id);
                return Json("OK");
            }
            catch (Exception ex)
            {
                return Json("Error");
                throw ex;
            }
        }
    }
}