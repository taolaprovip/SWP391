﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using BOs.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using System.IO;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace OldCarShowroomNetworkRazorPages.Pages.Car
{
    [Authorize(Roles = "User")]
    public class CreateModel : PageModel
    {
        private readonly BOs.Models.OldCarShowroomNetworkContext _context;
        private readonly INotyfService _toastNotification;

        public CreateModel(OldCarShowroomNetworkContext context, INotyfService toastNotification)
        {
            _context = new OldCarShowroomNetworkContext();
            _toastNotification = toastNotification;
        }

        public IActionResult OnGet()
        {
        ViewData["CarModelYear"] = new SelectList(_context.CarModelYears, "CarModelYearId", "CarModelYear1");
        ViewData["CarName"] = new SelectList(_context.CarNames, "CarNameId", "CarName1");
        ViewData["ColorInside"] = new SelectList(_context.Colors, "ColorId", "ColorName");
        ViewData["Color"] = new SelectList(_context.Colors, "ColorId", "ColorName");
        ViewData["Drive"] = new SelectList(_context.Drives, "DriveId", "DriveName");
        ViewData["Fuel"] = new SelectList(_context.Fuels, "FuelId", "FuelName");
        ViewData["ImageCar"] = new SelectList(_context.ImageCars, "ImageId", "ImageId");
        ViewData["Manufactory"] = new SelectList(_context.Manufactorys, "ManufactoryId", "ManufactoryName");
        ViewData["Username"] = new SelectList(_context.Users, "Username", "FullName");
        ViewData["Vehicles"] = new SelectList(_context.Vehicles, "VehiclesId", "VehiclesName");
            return Page();
        }

        [BindProperty]
        public BOs.Models.Car Car { get; set; }

        [BindProperty]
        public BOs.Models.Showroom Showroom { get; set; }

        [BindProperty]
        public BOs.Models.ImageCar ImageCar { get; set; }
		public string Msg1 { get; set; }
		public string Msg2 { get; set; }
		public string Msg3 { get; set; }
		public string Msg4 { get; set; }
		// To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
		public async Task<IActionResult> OnPostAsync(IFormFile uploadimg, IFormFile uploadimgmain, int? id)
        {
			ViewData["CarModelYear"] = new SelectList(_context.CarModelYears, "CarModelYearId", "CarModelYear1");
			ViewData["CarName"] = new SelectList(_context.CarNames, "CarNameId", "CarName1");
			ViewData["ColorInside"] = new SelectList(_context.Colors, "ColorId", "ColorName");
			ViewData["Color"] = new SelectList(_context.Colors, "ColorId", "ColorName");
			ViewData["Drive"] = new SelectList(_context.Drives, "DriveId", "DriveName");
			ViewData["Fuel"] = new SelectList(_context.Fuels, "FuelId", "FuelName");
			ViewData["ImageCar"] = new SelectList(_context.ImageCars, "ImageId", "ImageId");
			ViewData["Manufactory"] = new SelectList(_context.Manufactorys, "ManufactoryId", "ManufactoryName");
			ViewData["Username"] = new SelectList(_context.Users, "Username", "FullName");
			ViewData["Vehicles"] = new SelectList(_context.Vehicles, "VehiclesId", "VehiclesName");
			if (id == null)
            {
                return NotFound();
            }
            var Showroomid = _context.Showrooms.FirstOrDefault(e => e.ShowroomId == id);
            string userLogin = HttpContext.Session.GetString("Key");
            var user = _context.Users.FirstOrDefault(s => s.Email.Equals(userLogin));

            Car.Username = user.Username;
            Car.Showroom = Showroomid;
            Car.Notification = 0;
            Car.Status = false;
            Car.Note = string.Empty;
            Car.Expense = 100000;
            Car.CreatedAt= DateTime.Now;
            if(Car.NumberOfKilometersTraveled == null || Car.NumberOfKilometersTraveled <= 0 )
            {

				Msg2 = "Vui lòng nhập km đúng";

				return Page();
			}
			if (Car.MaxPrice == null || Car.MinPrice == null)
			{

				Msg1 = "Vui lòng nhập tiền";

				return Page();
			}
			if (Car.MaxPrice <= 0 || Car.MinPrice <= 0)
			{

				Msg1 = "Không được nhập số âm";

				return Page();
			}
			if (Car.MaxPrice <=  Car.MinPrice)
            {

				Msg1 = "Giá cao phải lớn hơn giá thấp";
				
				return Page();
			}

            if (Car.NumberOfDoors <= 0 || Car.NumberOfDoors >5 || Car.NumberOfDoors == null) 
            {
                Msg3 = "Sô cửa cần nhập > 0 và <5";
				return Page();
			}
			if (Car.NumberOfSeats <= 0 || Car.NumberOfSeats > 5 || Car.NumberOfSeats == null)
			{
				Msg4 = "Sô chỗ ngồi cần nhập > 0 và <5";
				return Page();
			}

			_context.Cars.Add(Car);
            await _context.SaveChangesAsync();
            
            
            // Kiểm tra xem có file ảnh được tải lên hay không
            if (uploadimg != null && uploadimg.Length > 0)
            {
                // Lưu trữ file ảnh vào thư mục hoặc dịch vụ lưu trữ của bạn
                // Ví dụ: sử dụng thư viện FileHelper để lưu trữ ảnh trong thư mục "wwwroot/images/showroom"
                string imagePath = "wwwroot/images/car" + Guid.NewGuid().ToString() + "_" + uploadimg.FileName;
                using (var stream = new FileStream(imagePath, FileMode.Create))
                {
                    await uploadimg.CopyToAsync(stream);
                }

                // Tạo đối tượng ImageShowroom và lưu thông tin ảnh vào cơ sở dữ liệu
                ImageCar image = new ImageCar
                {
                    Url = imagePath.Replace("wwwroot", ""),
                    ImageMain = false,
                    CarId = Car.CarId
                };
                _context.ImageCars.Add(image);
                await _context.SaveChangesAsync();
            }
            if (uploadimgmain != null && uploadimgmain.Length > 0)
            {
                // Lưu trữ file ảnh vào thư mục hoặc dịch vụ lưu trữ của bạn
                // Ví dụ: sử dụng thư viện FileHelper để lưu trữ ảnh trong thư mục "wwwroot/images/showroom"
                string imagePath = "wwwroot/images/car" + Guid.NewGuid().ToString() + "_" + uploadimgmain.FileName;
                using (var stream = new FileStream(imagePath, FileMode.Create))
                {
                    await uploadimgmain.CopyToAsync(stream);
                }

                // Tạo đối tượng ImageShowroom và lưu thông tin ảnh vào cơ sở dữ liệu
                ImageCar image = new ImageCar
                {
                    Url = imagePath.Replace("wwwroot", ""),
                    ImageMain = true,
                    CarId = Car.CarId
                };
                _context.ImageCars.Add(image);
                await _context.SaveChangesAsync();
                _toastNotification.Success("Tạo xe thành công");
            }
            return RedirectToPage("./Index");
        }
        private bool ShowroomExists(int id)
        {
            return _context.Showrooms.Any(e => e.ShowroomId == id);
        }
    }
}
