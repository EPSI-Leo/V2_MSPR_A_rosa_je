using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Arosaje.ModelViews;

public partial class Plant
{
    [Key]
    public string Id { get; set; } = null!;

    public string IdUser { get; set; } = null!;

    public string Name { get; set; } = null!;

    public DateTime BeginAt { get; set; }

    public DateTime EndAt { get; set; }

    public string Description { get; set; } = null!;

    public byte[] Picture { get; set; } = null!;

    public double Latitude { get; set; }

    public double Longitude { get; set; }
}
