using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Arosaje.ModelViews;
using System;
using System.Linq;
using Arosaje.Entities;
using System.Numerics;

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

        // GET: api/Advices/5
        [HttpGet("{id}")]
        public IActionResult Get(string id)
        {
            var advice = _context.Advices.Find(id);
            if (advice == null)
                return NotFound();

            return Ok(advice);
        }

        // POST: api/Advices
        [HttpPost]
        public IActionResult Post([FromBody] Advice advice)
        {
            advice.Id = GenerateRandomId();
            _context.Advices.Add(advice);
            _context.SaveChanges();

            return CreatedAtAction(nameof(Get), new { id = advice.Id }, advice);
        }

        // Méthode pour générer un ID aléatoire sous forme de chaîne
        private string GenerateRandomId()
        {
            return Guid.NewGuid().ToString();
        }

        // PUT: api/Advices/5
        [HttpPut("{id}")]
        public IActionResult Put(string id, [FromBody] Advice updatedAdvice)
        {
            var existingAdvice = _context.Advices.Find(id);
            if (existingAdvice == null)
                return NotFound();

            existingAdvice.IdUser = updatedAdvice.IdUser;
            existingAdvice.IdPlant = updatedAdvice.IdPlant;
            existingAdvice.Name = updatedAdvice.Name;
            existingAdvice.Advice1 = updatedAdvice.Advice1;

            _context.SaveChanges();

            return NoContent();
        }

        // DELETE: api/Advices/5
        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
        {
            var advice = _context.Advices.Find(id);
            if (advice == null)
                return NotFound();

            _context.Advices.Remove(advice);
            _context.SaveChanges();

            return NoContent();
        }

        // GET: api/Advices/ByUser/5
        [HttpGet("ByUser/{idUser}")]
        public IActionResult GetByUser(string idUser)
        {
            var userAdvices = _context.Advices.Where(a => a.IdUser == idUser).ToList();
            if (userAdvices == null || userAdvices.Count == 0)
                return NotFound("No advices found for the specified user.");

            return Ok(userAdvices);
        }
    }
}
