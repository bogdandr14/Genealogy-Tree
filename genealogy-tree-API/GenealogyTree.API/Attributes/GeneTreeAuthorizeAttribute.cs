using GenealogyTree.Business.Auth;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;

namespace GenealogyTree.API.Attributes
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class GeneTreeAuthorizeAttribute : Attribute, IAuthorizationFilter
    {
        private readonly IEnumerable<UserRoles> allowRoles;

        public GeneTreeAuthorizeAttribute()
        {
            allowRoles = new List<UserRoles>
            {
                UserRoles.Admin,
                UserRoles.User
            };
        }
        public GeneTreeAuthorizeAttribute(UserRoles role)
        {
            allowRoles = new List<UserRoles>
            {
                role
            };
        }

        private static void AppendUnauthorizedRequest(AuthorizationFilterContext context)
        {
            context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            try
            {
                var token = context.HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
                if (token != null && TokenService.ValidateToken(token))
                {
                    bool parseSucceded = int.TryParse(TokenService.GetClaim(token, TokenService.UserRole), out var userRole);
                    if (!parseSucceded || !allowRoles.Contains((UserRoles)userRole))
                    {
                        AppendUnauthorizedRequest(context);
                    }
                }
                else
                {
                    AppendUnauthorizedRequest(context);
                }
            }
            catch
            {
                AppendUnauthorizedRequest(context);
            }
        }
    }
}
