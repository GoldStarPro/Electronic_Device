using Electronic_Device_Management.Models;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Electronic_Device_Management.Controllers
{
    public class AdminController : Controller
    {
        private readonly ElectronicDeviceContext _context;

        public AdminController(ElectronicDeviceContext context)
        {
            _context = context;
        }

        public IActionResult Dashboard()
        {
            // Tổng số sản phẩm hiện có
            ViewBag.TotalProducts = _context.Products.Sum(p => p.QuantityInStock);

            // Số sản phẩm tồn kho
            ViewBag.InStockProducts = _context.Products.Where(p => p.QuantityInStock > 0).Count();

            // Số sản phẩm đã bán
            ViewBag.TotalSoldProducts = _context.OrderDetails.Sum(od => od.QuantitySold);

            return View();
        }
    }
}
