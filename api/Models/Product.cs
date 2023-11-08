using Microsoft.EntityFrameworkCore;

namespace api.Models
{
    public class Product : DbContext
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Presentation { get; set; }
        public decimal Price { get; set; }
        public DateTime RegistrationDate { get; set; }
    }
}
