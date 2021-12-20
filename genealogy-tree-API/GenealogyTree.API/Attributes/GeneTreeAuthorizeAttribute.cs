using GenealogyTree.Business.Authorization;
using GenealogyTree.Domain.Enums;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;

namespace GenealogyTree.API.Attributes
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class GeneTreeAuthorizeAttribute : Attribute, IAuthorizationFilter
    {
        private readonly IEnumerable<UserRoleEnum> allowRoles;

        public GeneTreeAuthorizeAttribute()
        {
            allowRoles = new List<UserRoleEnum>
            {
                UserRoleEnum.Admin,
                UserRoleEnum.User
            };
        }
        public GeneTreeAuthorizeAttribute(UserRoleEnum role)
        {
            allowRoles = new List<UserRoleEnum>
            {
                role
            };
        }


        public void OnAuthorization(AuthorizationFilterContext context)
        {
            try
            {
                var token = context.HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
                if (token != null)
                {

                    var jwtSecurityToken = TokenService.ValidateToken(token);
                    int.TryParse(TokenService.GetClaim(ClaimTypes.Role, jwtSecurityToken), out var userRole);
                    if (!allowRoles.Contains((UserRoleEnum)userRole))
                    {
                        context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
                    }
                }
                else
                {
                    context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
                }
            }
            catch
            {
                context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
            }
        }
    }
}
