using System;
using System.Collections.Generic;

namespace Electronic_Device_Management.Models;

public partial class Import
{
    public int ImportId { get; set; }

    public string? SupplierName { get; set; }

    public DateTime? ImportDate { get; set; }

    public decimal? TotalAmount { get; set; }

    public virtual ICollection<ImportDetail> ImportDetails { get; set; } = new List<ImportDetail>();
}
