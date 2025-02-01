using Microsoft.EntityFrameworkCore;
using GameAPI.Models;
namespace GameAPI.Data
{
    public class GameApiContext : DbContext
    {
        public GameApiContext(DbContextOptions<GameApiContext> options)
            : base(options)
        {
        }
    }
}