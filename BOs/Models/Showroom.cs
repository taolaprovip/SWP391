﻿using System;
using System.Collections.Generic;

#nullable disable

namespace BOs.Models
{
    public partial class Showroom
    {
        public Showroom()
        {
            Cars = new HashSet<Car>();
            ImageShowrooms = new HashSet<ImageShowroom>();
        }

        public int ShowroomId { get; set; }
        public string ShowroomName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Website { get; set; }
        public string CityId { get; set; }
        public string DistrictId { get; set; }
        public string Wards { get; set; }

        public virtual City City { get; set; }
        public virtual District District { get; set; }
        public virtual Ward WardsNavigation { get; set; }
        public virtual ICollection<Car> Cars { get; set; }
        public virtual ICollection<ImageShowroom> ImageShowrooms { get; set; }
    }
}
