using Arosaje.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace Arosaje.ModelViews
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ArosajeContext _context;

        public UsersController(ArosajeContext context)
        {
            _context = context;
        }

        // POST: api/Users/Register
        [HttpPost("Register")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> Register([FromBody] User user)
        {
            // Vérifier si l'utilisateur existe déjà
            if (_context.Users.Any(u => u.Username == user.Username))
            {
                return Conflict("Ce nom d'utilisateur est déjà utilisé.");
            }

            // Générer une clé unique aléatoire
            user.Id = Guid.NewGuid().ToString();

            // Ajouter l'utilisateur à la base de données
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            // Retourner la réponse avec l'ID de l'utilisateur
            return CreatedAtAction(nameof(GetUserById), new { id = user.Id }, new { Id = user.Id, Message = "Utilisateur créé avec succès !" });
        }


        // POST: api/Users/Login
        [HttpPost("Login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Login([FromBody] User user)
        {
            // Vérifier si l'utilisateur existe
            var existingUser = _context.Users.FirstOrDefault(u => u.Username == user.Username);

            if (existingUser == null)
            {
                return NotFound("Utilisateur non trouvé.");
            }

            // Vous pouvez ajouter d'autres vérifications ici (par exemple, vérifier le mot de passe)
            // Pour l'instant, la vérification se fait uniquement sur le nom d'utilisateur.

            // Retourner l'ID de l'utilisateur en tant que partie de la réponse
            return Ok(new { Id = existingUser.Id, Message = "Connexion réussie !" });
        }
    


        // GET: api/Users/GetUserById/{id}
        [HttpGet("GetUserById/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult GetUserById(string id)
        {
            var user = _context.Users.Find(id);

            if (user == null)
            {
                return NotFound("Utilisateur non trouvé.");
            }

            return Ok(user);
        }

        // GET: api/Users/GetAllUsers
        [HttpGet("GetAllUsers")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult GetAllUsers()
        {
            var users = _context.Users.ToList();

            if (users == null || users.Count == 0)
            {
                return NotFound("Aucun utilisateur trouvé.");
            }

            return Ok(users);
        }


        // DELETE: api/Users/DeleteUser/{id}
        [HttpDelete("DeleteUser/{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound("Utilisateur non trouvé.");
            }

            // Remove the user from the database
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return Ok(new { Message = "Utilisateur supprimé avec succès !" });
        }


    }



}
