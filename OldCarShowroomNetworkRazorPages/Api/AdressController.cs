﻿using BOs.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Text.Json;

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
        [HttpGet]
        [Route("city/{cityid}/district/{districtid}/ward/{wardid}")]
        public ActionResult<List<Showroom>> ListShowrooms(string cityid, string districtid, string wardid)
        {
            List<Showroom> list = _context.Showrooms.Where(s => s.CityId.Equals(cityid) && s.DistrictId.Equals(districtid) && s.Wards.Equals(wardid))
        .ToList();
            foreach (var i in list)
            {
                ImageShowroom imageShowroom = _context.ImageShowrooms
                .FirstOrDefault(s => s.ShowroomId == i.ShowroomId && s.ImageMain == true);
                imageShowroom.Showroom = null;
                if (imageShowroom != null)
                {
                    i.ImageShowrooms.Add(imageShowroom);
                }
            }
            return list;
        }
        [HttpGet]
        [Route("imageShowroom/{id}")]
        public ActionResult<ImageShowroom> ListShowroomsImage(int id)
        {
            ImageShowroom imageShowroom = _context.ImageShowrooms
                .FirstOrDefault(s => s.ShowroomId == id && s.ImageMain == true);
            return imageShowroom;
        }
    }
}
