using Arosaje.Entities;
using Arosaje.ModelViews;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Arosaje.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlantsController : ControllerBase
    {
        private readonly ArosajeContext _context;

        public PlantsController(ArosajeContext context)
        {
            _context = context;
        }

        // GET: api/Plants/GetPlantById/{id}
        [HttpGet("GetPlantById/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetPlantById(string id)
        {
            var plant = _context.Plants.Find(id);

            if (plant == null)
            {
                return NotFound("Plante non trouvee.");
            }


            return Ok(plant);
        }
        // GET: api/Plants/GetAllPlants
        [HttpGet("GetAllPlants")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult GetAllPlants()
        {
            var plants = _context.Plants.ToList();

            if (plants == null || plants.Count == 0)
            {
                return NotFound("Aucune plante trouvee.");
            }

            var response = new
            {
                TotalItems = plants.Count,
                Plants = plants
            };

            return Ok(response);
        }


        // POST: api/Plants/CreatePlant
        [HttpPost("CreatePlant")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> CreatePlant([FromBody] Plant plant)
        {


            _context.Plants.Add(plant);
            await _context.SaveChangesAsync();

            // Return the response with the ID of the plant
            return CreatedAtAction(nameof(GetPlantById), new { id = plant.Id }, new { Id = plant.Id, Message = "Plante creee avec succes " });
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] Plant updatedPlant)
        {
            if (id != updatedPlant.Id)
            {
                return BadRequest("L'ID spécifié ne correspond pas à l'ID de la plante.");
            }

            // Vérifiez si la plante existe dans la base de données
            var existingPlant = _context.Plants.Find(id);
            if (existingPlant == null)
            {
                return NotFound("Plante non trouvée.");
            }

            // Mettez à jour les propriétés de la plante existante avec les valeurs de la plante mise à jour
            existingPlant.IdUser = updatedPlant.IdUser;
            existingPlant.Name = updatedPlant.Name;
            existingPlant.BeginAt = updatedPlant.BeginAt;
            existingPlant.EndAt = updatedPlant.EndAt;
            existingPlant.Description = updatedPlant.Description;
            existingPlant.Picture = updatedPlant.Picture;
            existingPlant.Latitude = updatedPlant.Latitude;
            existingPlant.Longitude = updatedPlant.Longitude;

            // Mettez à jour la base de données
            _context.SaveChanges();

            return NoContent(); // 204 No Content
        }
   


    // DELETE: api/Plants/DeletePlant/{id}
    [HttpDelete("DeletePlant/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeletePlant(string id)
        {
            var plant = await _context.Plants.FindAsync(id);

            if (plant == null)
            {
                return NotFound("Plante non trouvee.");
            }

            // Remove the plant from the database
            _context.Plants.Remove(plant);
            await _context.SaveChangesAsync();

            return Ok(new { Message = "Plante supprimee avec succes !" });
        }

        // GET: api/Plants/GetPlantsByUserId/{userId}
        [HttpGet("GetPlantsByUserId/{userId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetPlantsByUserId(int userId)
        {
            var plants = _context.Plants.Where(p => p.IdUser == userId).ToList();

            if (plants == null || plants.Count == 0)
            {
                return NotFound("Aucune plante trouvee pour cet utilisateur.");
            }

            var response = new
            {
                TotalItems = plants.Count,
                Plants = plants
            };

            return Ok(response);
        }
    }
}
