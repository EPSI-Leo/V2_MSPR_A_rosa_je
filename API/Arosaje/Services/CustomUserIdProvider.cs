using Microsoft.AspNetCore.SignalR;
using System.Security.Claims;

namespace Arosaje.Services
{
    public class CustomUserIdProvider : IUserIdProvider
    {
        public string GetUserId(HubConnectionContext connection)
        {
            // Assuming the user's ID is stored in the claims after authentication
            return connection.User?.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        }
    }
}
