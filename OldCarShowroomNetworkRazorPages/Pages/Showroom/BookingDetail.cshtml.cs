﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using REPOs;
using System.Threading.Tasks;

namespace OldCarShowroomNetworkRazorPages.Pages.Showroom
{
	[Authorize(Roles = "Staff")]
	public class BookingDetailModel : PageModel
    {
        public readonly BookingRepository _bookingRepo;

        public BookingDetailModel(BookingRepository bookingRepo)
        {
            _bookingRepo = bookingRepo;
        }

        public BOs.Models.Booking booking { get; set; }
		public string Msg { get; set; }
		public async Task<IActionResult> OnGetAsync(string UserName, int? carId)
        {
            booking = await _bookingRepo.GetAll()
                    .Include(b => b.UsernameNavigation)
                    .Include(b => b.Car)
                    .Include(b => b.Car.ManufactoryNavigation)
                    .Include(b => b.Car.CarNameNavigation)
                    .Include(b => b.Car.CarModelYearNavigation)
                    .Include(b => b.Car.Showroom)
                    .Include(b => b.Car.UsernameNavigation)
                    .Include(b => b.Car.VehiclesNavigation)
                    .Include(b => b.Car.ColorInsideNavigation)
                    .Include(b => b.Car.ColorNavigation)
                    .Include(b => b.Car.DriveNavigation)
                    .Include(b => b.Car.FuelNavigation)
                    .Include(b => b.SlotNavigation)
                    .FirstOrDefaultAsync(b => b.CarId == carId && b.Username.Equals(UserName) && b.Notification.Equals(1));
            if (booking == null)
            {
                Msg = "Đã xảy ra lỗi";
                return Page();
            }
            if (booking.Car.Notification == 3)
			{
				Msg = "Xe này đã được bán không thể chấp nhận bán xe lần nữa";
				return Page();
			}
			if (booking.Car.Notification == 2)
			{
				Msg = "Xe này bị từ chối ký chối bởi showroom. Không thể chấp nhận bán xe";
				return Page();
			}

			return Page();
        }
    }
}
