using System;
using System.Collections.Generic;

namespace Electronic_Device_Management.Models;

public partial class ImportDetail
{
    public int ImportDetailId { get; set; }

    public int? ImportId { get; set; }

    public int? ProductId { get; set; }

    public int? QuantityImported { get; set; }

    public decimal? UnitPrice { get; set; }

    public virtual Import? Import { get; set; }

    public virtual Product? Product { get; set; }
}
