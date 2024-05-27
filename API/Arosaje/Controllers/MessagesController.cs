using Arosaje.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Arosaje.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessagesController : ControllerBase
    {
        private readonly ArosajeContext _context;

        public MessagesController(ArosajeContext context)
        {
            _context = context;
        }

        // GET: api/Messages
        [HttpGet]
        [Authorize]
        [Route("api/messages")]
        public async Task<IActionResult> GetMessages()
        {
            var messages = await _context.Messages
                                .OrderByDescending(m => m.Timestamp)
                                .ToListAsync();
            return Ok(messages);
        }
    }
}