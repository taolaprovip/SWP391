using BOs.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using OldCarShowroomNetworkRazorPages.Pagination;
using REPOs;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OldCarShowroomNetworkRazorPages.Pages.Showroom
{
    [Authorize(Roles = "Staff")]
    public class ListUserBooking : PageModel
    {
        public readonly BookingRepository _bookingRepo;

        public ListUserBooking(BookingRepository bookingRepo)
        {
            _bookingRepo = bookingRepo;
        }

        public PaginatedList<BOs.Models.Booking> booking { get; set; }
        public async Task<IActionResult> OnGetAsync(int? pageIndex)
        {
            var pageSize = 4;
            var list = from b in _bookingRepo.GetAll()
                .Include(b => b.UsernameNavigation)
                .Include(b => b.Car)
                .Include(b => b.Car.UsernameNavigation)
                .Include(b => b.Car.ManufactoryNavigation)
                .Include(b => b.Car.CarNameNavigation)
                .Include(b => b.Car.CarModelYearNavigation)
                .Include(b => b.Car.Showroom)
                .Include(b => b.Car.Showroom.City)
                .Include(b => b.Car.Showroom.District)
                .Include(b => b.Car.Showroom.WardsNavigation)
                .Include(b => b.SlotNavigation)
                .Where(b => b.Notification == 1)
                .OrderByDescending(b => b.DayBooking)
                .ThenByDescending(b => b.SlotNavigation.PickupDate)
                select b;

            booking = await PaginatedList<Booking>.CreateAsync(list, pageIndex ?? 1, pageSize);
            return Page();
        }
    }
}
