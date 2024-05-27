using System;
using System.Collections.Generic;

namespace Arosaje.Entities;

public partial class Plant
{
    public int Id { get; set; }

    public int IdUser { get; set; }

    public string Name { get; set; } = null!;

    public DateTime BeginAt { get; set; }

    public DateTime EndAt { get; set; }

    public string Description { get; set; } = null!;

    public byte[] Picture { get; set; } = null!;

    public double Latitude { get; set; }

    public double Longitude { get; set; }

    public virtual ICollection<Advice> Advices { get; set; } = new List<Advice>();

    public virtual User IdUserNavigation { get; set; } = null!;
}
