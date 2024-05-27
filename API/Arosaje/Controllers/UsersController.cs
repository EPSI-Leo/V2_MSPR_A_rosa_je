using Arosaje.Entities;
using JwtRoleAuthentication.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using Arosaje.Models;

namespace Arosaje.ModelViews
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ArosajeContext _context;
        private readonly TokenService _tokenService;
        public UsersController(ArosajeContext context, TokenService tokenService)
        {
            _context = context;
            _tokenService = tokenService;
           }

        // POST: api/Users/Register
        [HttpPost("Register")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Register([FromBody] User user)
        {
            // Vérifier si l'utilisateur existe déjà
            if (_context.Users.Any(u => u.Username == user.Username))
            {
                return BadRequest("Ce nom d'utilisateur est déjà utilisé.");
            }

            user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);

            // Ajouter l'utilisateur à la base de données
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            // Retourner une réponse 200 OK
            return Ok("Utilisateur créé avec succès !");
}
        // POST: api/Users/Login
        [HttpPost("Login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Login([FromBody] LoginModel model)
        {
            // Récupérer l'utilisateur par son nom d'utilisateur
            var existingUser = _context.Users.FirstOrDefault(u => u.Username == model.Username);

            if (existingUser == null)
            {
                return NotFound("Utilisateur ou mot de passe incorrect.");
            }

            // Vérifier le mot de passe haché
            if (!BCrypt.Net.BCrypt.Verify(model.Password, existingUser.Password))
            {
                return NotFound("Utilisateur ou mot de passe incorrect.");
            }

            // Générer le token JWT
            var token = _tokenService.CreateToken(existingUser.Id.ToString());

            // Retourner l'ID de l'utilisateur et le token JWT en tant que partie de la réponse
            return Ok(new { Id = existingUser.Id, Token = token });
        }


        // GET: api/Users/GetUserInfos
        [HttpGet("GetUserInfos")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [Authorize]
        public IActionResult GetUserInfo()
        {
            // Récupérez l'ID de l'utilisateur à partir du token JWT
            var userId = User.FindFirst("UserId")?.Value;

            // Vérifiez si l'ID de l'utilisateur est présent dans le token JWT
            if (string.IsNullOrEmpty(userId))
            {
                return Unauthorized("Utilisateur non autorisé.");
            }

            // Recherchez l'utilisateur dans la base de données en utilisant l'ID extrait du token
            var user = _context.Users.FirstOrDefault(u => u.Id.ToString() == userId);

            // Vérifiez si l'utilisateur existe dans la base de données
            if (user == null)
            {
                return NotFound("Utilisateur non trouvé.");
            }

            // Exclure le mot de passe et l'ID des informations renvoyées
            var userInfo = new
            {
                user.Id,
                user.FirstName,
                user.LastName,
                user.Email,
                user.Username,
                user.Role
            };

            // Retournez les informations de l'utilisateur sans le mot de passe et l'ID
            return Ok(userInfo);
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

            // Supprimer l'utilisateur de la base de données
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            return Ok(new { Message = "Utilisateur supprimé avec succès !" });
        }
    }
}
