using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Arosaje.ModelViews;
using System;
using System.Linq;
using Arosaje.Entities;
using System.Numerics;
using Microsoft.AspNetCore.Authorization;

namespace Arosaje.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdvicesController : ControllerBase
    {
        private readonly ArosajeContext _context;

        public AdvicesController(ArosajeContext context)
        {
            _context = context;
        }

        // GET: api/Advices
        [HttpGet]
        [Authorize]
        public IActionResult Get()
        {
            var advices = _context.Advices.ToList();
            var response = new
            {
                totalItems = advices.Count,
                advices = advices
            };

            return Ok(response);
        }

        // POST: api/Advices
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] AdviceCreateRequest request)
        {
            // Récupérez l'ID de l'utilisateur à partir du token JWT
            var userId = User.FindFirst("UserId")?.Value;

            // Vérifiez si l'ID de l'utilisateur est présent dans le token JWT
            if (string.IsNullOrEmpty(userId))
            {
                return Unauthorized("Utilisateur non autorisé.");
            }

            // Créez un nouvel objet Advice à partir des données de la demande et de l'ID utilisateur
            var advice = new Advice
            {
                IdUser = Convert.ToInt32(userId),
                Name = request.Name,
                Advice1 = request.Advice1,
                IdPlant = request.IdPlant 
            };

            _context.Advices.Add(advice);
            _context.SaveChanges();

            return CreatedAtAction(nameof(Get), new { id = advice.Id }, advice);
        }


        public class AdviceCreateRequest
        {
            public string Name { get; set; }
            public string Advice1 { get; set; }
            public int? IdPlant { get; set; } 
        }

    }
}
