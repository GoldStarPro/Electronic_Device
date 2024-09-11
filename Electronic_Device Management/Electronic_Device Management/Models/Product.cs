using System;
using System.Collections.Generic;

namespace Electronic_Device_Management.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string? ProductName { get; set; }

    public int? CategoryId { get; set; }

    public string? Brand { get; set; }

    public decimal? Price { get; set; }

    public int? QuantityInStock { get; set; }

    public virtual Category? Category { get; set; }

    public virtual ICollection<ImportDetail> ImportDetails { get; set; } = new List<ImportDetail>();

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
