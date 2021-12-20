﻿using GenealogyTree.Business.Helpers;
using GenealogyTree.Domain.DTO;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Enums;
using Microsoft.AspNetCore.Http;
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
        public static TokenResponseModel GenerateToken(User user, ICollection<UserRoleEnum> userRoles)
        {
            var authClaims = new List<Claim>
                {
                    new Claim(JwtRegisteredClaimNames.UniqueName, user.Username),
                    new Claim(JwtRegisteredClaimNames.Email, user.Email),
                    new Claim(JwtRegisteredClaimNames.GivenName, user.Person.FirstName),
                    new Claim(JwtRegisteredClaimNames.FamilyName, user.Person.LastName),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                };

            foreach (var userRole in userRoles)
            {
                authClaims.Add(new Claim(ClaimTypes.Role, ((int)userRole).ToString()));
            }

            var authSignIngKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(ConstantsJwt.Secret));

            var token = new JwtSecurityToken(
                ConstantsJwt.Issuer,
                ConstantsJwt.Audience,
                authClaims,
                expires: DateTime.UtcNow.AddMinutes(104),
                signingCredentials: new SigningCredentials(authSignIngKey, SecurityAlgorithms.HmacSha256)
                );

            return new TokenResponseModel
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
            };
        }

        public static string GetClaim(string claimName, JwtSecurityToken token)
        {
            return token.Claims.FirstOrDefault(claim => claim.Type == claimName)?.Value;
        }

        public static JwtSecurityToken ValidateToken(string token)
        {
            // Token handler used in order to validate the token
            var tokenHandler = new JwtSecurityTokenHandler();
            // Get the secret key from the jwtSettings instance
            var key = Encoding.UTF8.GetBytes(ConstantsJwt.Secret);

            try
            {
                // Validate the token and store it in the validatedToken variable
                tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = false,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ClockSkew = TimeSpan.Zero // This is used so that the token expires exactly at its expiry time, not 5 minutes later
                }, out SecurityToken validatedToken);

                return (JwtSecurityToken)validatedToken;
            }
            catch
            {
                // Return null if validation fails
                return null;
            }
        }

        public static bool IsUserLoggedId(HttpContext context)
        {
            var token = context.Request.Cookies["Authorization"]?.Split(" ").Last();
            if (token != null)
            {
                var jwtToken = ValidateToken(token);
                if (jwtToken != null)
                {
                    return true;
                }
            }
            return false;
        }

    }
}
