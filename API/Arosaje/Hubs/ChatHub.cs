using Arosaje.Entities;
using Microsoft.AspNetCore.SignalR;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Arosaje.Hubs;
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
        string id = Context.User.FindFirst(ClaimTypes.NameIdentifier).Value;
        Groups.AddToGroupAsync(Context.ConnectionId, id);
        return base.OnConnectedAsync();
    }
}
