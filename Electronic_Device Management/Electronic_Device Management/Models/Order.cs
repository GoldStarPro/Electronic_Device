using System;
using System.Collections.Generic;

namespace Electronic_Device_Management.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public string? CustomerName { get; set; }

    public DateTime? OrderDate { get; set; }

    public decimal? TotalAmount { get; set; }

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
