using System;

namespace FormsOverDataSamples
{
  public class Product
  {
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public DateTime IntroductionDate { get; set; }
    public decimal Cost { get; set; }
    public decimal Price { get; set; }
    public bool IsDiscontinued { get; set; }
  }
}
