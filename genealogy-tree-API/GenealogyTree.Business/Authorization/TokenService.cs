using GenealogyTree.Business.Helpers;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Enums;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace GenealogyTree.Business.Authorization
{
    public class TokenService
    {
        public static readonly string UserRole = "user_role";

        public static string GenerateToken(User user, UserRoleEnum userRole)
        {

            var authClaims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.UniqueName, user.Username),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim(JwtRegisteredClaimNames.GivenName, user.Person.FirstName),
                new Claim(JwtRegisteredClaimNames.FamilyName, user.Person.LastName),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(UserRole, ((int)userRole).ToString())
            };

            var authSignIngKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ConstantsJwt.Secret));

            var token = new JwtSecurityToken(
                ConstantsJwt.Issuer,
                ConstantsJwt.Audience,
                authClaims,
                expires: DateTime.UtcNow.AddMinutes(104),
                signingCredentials: new SigningCredentials(authSignIngKey, SecurityAlgorithms.HmacSha256)
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public static string GetClaim(string token, string claimName)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var securityToken = tokenHandler.ReadToken(token) as JwtSecurityToken;
            return securityToken.Claims.FirstOrDefault(claim => claim.Type == claimName)?.Value;
        }

        public static bool ValidateToken(string token)
        {
            // Token handler used in order to validate the token
            var tokenHandler = new JwtSecurityTokenHandler();
            // Get the secret key from the jwtSettings instance
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ConstantsJwt.Secret));

            try
            {
                // Validate the token and store it in the validatedToken variable
                tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    IssuerSigningKey = key,
                    ValidIssuer = ConstantsJwt.Issuer,
                    ValidAudience = ConstantsJwt.Audience,
                    ClockSkew = TimeSpan.Zero // This is used so that the token expires exactly at its expiry time, not 5 minutes later
                }, out SecurityToken validatedToken);
                return true;
            }
            catch
            {
                // Return false if validation fails
                return false;
            }
        }
    }
}
