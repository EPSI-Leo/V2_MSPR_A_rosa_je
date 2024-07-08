using System.Text.RegularExpressions;

namespace Arosaje.Services
{

    public partial class ConnectionStringHelper
    {
        [GeneratedRegex(@"\$\{(.*?)\}")]
        private static partial Regex EnvVarRegex();
        public static string BuildConnectionString(IConfiguration configuration, string connectionStringName)
        {
            string connectionString = configuration.GetConnectionString(connectionStringName)!;
            connectionString = EnvVarRegex().Replace(connectionString, match =>
            {
                string key = match.Groups[1].Value;
                string value = configuration[key] ?? throw new Exception($"Configuration key '{key}' not found.");
                return value;
            });
            return connectionString;
        }
    }
}
