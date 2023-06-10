﻿using BOs.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace OldCarShowroomNetworkRazorPages.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdressController : ControllerBase
    {
        private readonly BOs.Models.OldCarShowroomNetworkContext _context;
        public AdressController()
        {
            _context = new OldCarShowroomNetworkContext();
        }
        [HttpGet]
        [Route("district/{cityid}")]
        public ActionResult<List<District>> listDistricts(string cityid)
        {


            return _context.Districts.Where(d => d.CityId.Equals(cityid)).ToList();

        }
        [HttpGet]
        [Route("ward/{districtid}")]
        public ActionResult<List<Ward>> listWards(string districtid)
        {


            return _context.Wards.Where(w => w.DistrictId.Equals(districtid)).ToList();

        }
    }
}
