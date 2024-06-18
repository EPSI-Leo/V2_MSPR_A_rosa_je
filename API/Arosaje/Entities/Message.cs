using System;
using System.Collections.Generic;

namespace Arosaje.Entities;

public partial class Message
{
    public int Id { get; set; }

    public int IdSender { get; set; }

    public int IdReceiver { get; set; }

    public string Content { get; set; } = null!;
    
    public DateTime Timestamp { get; set; }
}
