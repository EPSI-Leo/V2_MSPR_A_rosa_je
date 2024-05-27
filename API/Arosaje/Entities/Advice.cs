using System;
using System.Collections.Generic;

namespace Arosaje.Entities;

public partial class Advice
{
    public int Id { get; set; }

    public int? IdUser { get; set; }

    public int? IdPlant { get; set; }

    public string? Name { get; set; }

    public string? Advice1 { get; set; }

    public virtual Plant? IdPlantNavigation { get; set; }

    public virtual User? IdUserNavigation { get; set; }
}
