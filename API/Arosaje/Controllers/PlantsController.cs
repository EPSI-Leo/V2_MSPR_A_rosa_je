using Arosaje.Entities;
using Arosaje.ModelViews;
using Microsoft.AspNetCore.Authorization;
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

        // GET: api/Plants/GetMyPlants
        [HttpGet("GetMyPlants")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [Authorize]
        public IActionResult GetMyPlants()
        {
            // Récupérer l'ID de l'utilisateur à partir du token JWT
            var userId = User.FindFirst("UserId")?.Value;

            // Vérifier si l'ID de l'utilisateur est présent dans le token JWT
            if (string.IsNullOrEmpty(userId))
            {
                return Unauthorized("Utilisateur non autorisé.");
            }

            // Récupérer les plantes de l'utilisateur
            var userPlants = _context.Plants
                .Where(p => p.IdUser == Convert.ToInt32(userId))
                .ToList();

            if (userPlants == null || userPlants.Count == 0)
            {
                return NotFound("Aucune plante trouvée pour cet utilisateur.");
            }

            // Récupérer les plantes de l'utilisateur
            var userPlantsList = _context.Plants
                .Where(p => p.IdUser == Convert.ToInt32(userId))
                .ToList();

            if (userPlantsList == null || userPlantsList.Count == 0)
            {
                return NotFound("Aucune plante trouvée pour cet utilisateur.");
            }

            // Récupérer les conseils associés à chaque plante avec les noms d'utilisateur
            var userPlantsWithAdvices = new List<object>();

            foreach (var plant in userPlantsList)
            {
                var plantAdvices = _context.Advices
                    .Where(a => a.IdPlant == plant.Id)
                    .Select(a => new
                    {
                        Id = a.Id,
                        IdPlant = a.IdPlant,
                        UserFirstName = _context.Users.FirstOrDefault(u => u.Id == a.IdUser) != null ? _context.Users.First(u => u.Id == a.IdUser).FirstName : null,
                        UserLastName = _context.Users.FirstOrDefault(u => u.Id == a.IdUser) != null ? _context.Users.First(u => u.Id == a.IdUser).LastName : null,
                        Advice1 = a.Advice1
                    })
                    .ToList();

                userPlantsWithAdvices.Add(new
                {
                    Plant = plant,
                    Advices = plantAdvices
                });
            }

            return Ok(userPlantsWithAdvices);
        }


        // GET: api/Plants/GetAllPlants
        [HttpGet("GetAllPlants")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [Authorize] // Ajout de l'attribut Authorize
        public IActionResult GetAllPlants()
        {
            var plants = _context.Plants
                .Join(
                    _context.Users,
                    plant => plant.IdUser,
                    user => user.Id,
                    (plant, user) => new
                    {
                        plant.Id,
                        plant.Name,
                        plant.BeginAt,
                        plant.EndAt,
                        plant.Description,
                        plant.Picture,
                        plant.Latitude,
                        plant.Longitude,
                        plant.IdUser,
                        UserFirebaseUid = user.FirebaseUid,
                        UserUsername = user.Email
                    }
                )
                .ToList();

            if (plants == null || plants.Count == 0)
            {
                return NotFound("Aucune plante trouvée.");
            }

            return Ok(plants);
        }

        // POST: api/Plants/AddPlant
        [HttpPost("AddPlant")]
        [Authorize]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> AddPlant([FromBody] PlantCreateRequest request)
        {
            // Récupérer l'ID de l'utilisateur à partir du token JWT
            var userId = User.FindFirst("UserId")?.Value;

            // Vérifier si l'ID de l'utilisateur est présent dans le token JWT
            if (string.IsNullOrEmpty(userId))
            {
                return Unauthorized("Utilisateur non autorisé.");
            }

            // Créer un nouvel objet Plant à partir des données de la demande et de l'ID utilisateur
            var plant = new Plant
            {
                IdUser = Convert.ToInt32(userId),
                Name = request.Name,
                BeginAt = request.BeginAt,
                EndAt = request.EndAt,
                Description = request.Description,
                Picture = request.Picture,
                Latitude = request.Latitude,
                Longitude = request.Longitude
            };

            _context.Plants.Add(plant);
            await _context.SaveChangesAsync();

            // Retourner la réponse avec l'ID de la plante
            return Ok("Plante créée avec succès.");

        }

        public class PlantCreateRequest
        {
            public string Name { get; set; }
            public DateTime BeginAt { get; set; }
            public DateTime EndAt { get; set; }
            public string Description { get; set; }
            public byte[] Picture { get; set; }
            public double Latitude { get; set; }
            public double Longitude { get; set; }
        }
    }


}
