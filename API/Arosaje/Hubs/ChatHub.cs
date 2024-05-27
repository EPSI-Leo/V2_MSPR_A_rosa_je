namespace Arosaje.Hubs;

using Arosaje.Entities;
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

public class ChatHub : Hub
{
    private readonly ArosajeContext _context;

    public ChatHub(ArosajeContext context)
    {
        _context = context;
    }

    public async Task SendMessage(int senderId, int receiverId, string message)
    {
        var chatMessage = new Message
        {
            IdSender = senderId,
            IdReceiver = receiverId,
            Content = message,
            Timestamp = DateTime.Now
        };

        _context.Messages.Add(chatMessage);
        await _context.SaveChangesAsync();

        await Clients.User(receiverId.ToString()).SendAsync("ReceiveMessage", senderId, message);
    }

    public override Task OnConnectedAsync()
    {
        string name = Context.User.Identity.Name;
        Groups.AddToGroupAsync(Context.ConnectionId, name);
        return base.OnConnectedAsync();
    }
}
