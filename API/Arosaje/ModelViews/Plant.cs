using System;
using System.Collections.Generic;

namespace Arosaje.ModelViews;

public partial class Plant
{
    public string? Id { get; set; }

    public string? IdUser { get; set; }

    public string? Name { get; set; }

    public DateTime? BeginAt { get; set; }

    public DateTime? EndAt { get; set; }

    public string? Description { get; set; }

    public byte[]? Picture { get; set; }

    public double Latitude { get; set; }

    public double Longitude { get; set; }
}
