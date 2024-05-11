using Arosaje.Entities;
using BCrypt.Net;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
namespace Arosaje.ModelViews
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly ArosajeContext _context;
        private readonly JwtSettings _jwtSettings;

        public UsersController(ArosajeContext context, IOptions<JwtSettings> jwtSettings)
        {
            _context = context;
           _jwtSettings = jwtSettings.Value; }

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

            user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);

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
            var token = GenerateJwtToken(existingUser);

            // Retourner l'ID de l'utilisateur et le token JWT en tant que partie de la réponse
            return Ok(new { Id = existingUser.Id, Token = token });
        }

        public class LoginModel
        {
            public string Username { get; set; }
            public string Password { get; set; }
        }
        private string GenerateJwtToken(User user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.SecretKey));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new List<Claim>
    {
        new Claim(JwtRegisteredClaimNames.Sub, user.Username),
        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
        new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()), 
    };

            var token = new JwtSecurityToken(
                issuer: _jwtSettings.Issuer,
                audience: _jwtSettings.Audience,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(_jwtSettings.TokenLifetimeMinutes), 
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
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
