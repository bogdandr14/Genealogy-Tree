using GenealogyTree.Business.Helpers;
using GenealogyTree.Domain.Entities;
using GenealogyTree.Domain.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace GenealogyTree.Business.Authorization
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate _next;

        public JwtMiddleware(RequestDelegate next)
        {
            this._next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            if (token != null)
            {
                JwtSecurityToken jwtToken = TokenService.ValidateToken(token);
                if (jwtToken != null)
                {
                    attachUserToContext(context, jwtToken);
                }
            }
            await _next(context);
        }

        public void attachUserToContext(HttpContext context, JwtSecurityToken jwtToken)
        {
            context.Items["Username"] = jwtToken.Claims.First(x => x.Type == JwtRegisteredClaimNames.UniqueName).Value;
            context.Items["FullName"] = jwtToken.Claims.First(x => x.Type == JwtRegisteredClaimNames.GivenName).Value + " " +
                                        jwtToken.Claims.First(x => x.Type == JwtRegisteredClaimNames.FamilyName).Value;
            context.Items["Email"] = jwtToken.Claims.First(x => x.Type == JwtRegisteredClaimNames.Email).Value;

        }
    }
}
