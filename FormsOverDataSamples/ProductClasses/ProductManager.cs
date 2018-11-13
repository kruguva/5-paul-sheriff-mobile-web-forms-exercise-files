using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace FormsOverDataSamples
{
  public class ProductManager
  {
    #region GetProducts Method
    /// <summary>
    /// Get all Products from Product table
    /// </summary>
    /// <returns>A List of Product objects</returns>
    public List<Product> GetProducts()
    {
      DataTable dt = new DataTable();
      SqlDataAdapter da = null;

      da = new SqlDataAdapter("SELECT * FROM Product",
                              AppSettings.Instance.ConnectString);

      da.Fill(dt);

      var query = 
        (from dr in dt.AsEnumerable()
          select new Product
          {
            ProductId = Convert.ToInt32(dr["ProductId"]),
            ProductName = dr["ProductName"].ToString(),
            IntroductionDate =
              DataConvert.ConvertTo<DateTime>(dr["IntroductionDate"],
                default(DateTime)),
            Cost = DataConvert.ConvertTo<decimal>(
              dr["Cost"], default(decimal)),
            Price = DataConvert.ConvertTo<decimal>(
              dr["Price"], default(decimal)),
            IsDiscontinued = DataConvert.ConvertTo<bool>(
              dr["IsDiscontinued"], default(bool))
          });

      return query.ToList();
    }
    #endregion

    #region GetProduct Method
    /// <summary>
    /// Get a single Product from the Product table
    /// </summary>
    /// <param name="productId">A Product ID to find</param>
    /// <returns>A Product object</returns>
    public Product GetProduct(int productId)
    {
      DataTable dt = new DataTable();
      SqlDataAdapter da = null;
      SqlCommand cmd = null;

      cmd = new SqlCommand("SELECT * FROM Product WHERE ProductId = @ProductId",
        new SqlConnection(AppSettings.Instance.ConnectString));
      cmd.Parameters.Add(new SqlParameter("@ProductId", productId));

      da = new SqlDataAdapter(cmd);
      da.Fill(dt);

      Product entity =
        (from dr in dt.AsEnumerable()
         select new Product
         {
           ProductId = Convert.ToInt32(dr["ProductId"]),
           ProductName = dr["ProductName"].ToString(),
           IntroductionDate =
             DataConvert.ConvertTo<DateTime>(dr["IntroductionDate"],
               default(DateTime)),
           Cost = DataConvert.ConvertTo<decimal>(
             dr["Cost"], default(decimal)),
           Price = DataConvert.ConvertTo<decimal>(
             dr["Price"], default(decimal)),
           IsDiscontinued = DataConvert.ConvertTo<bool>(
             dr["IsDiscontinued"], default(bool))
         }).FirstOrDefault();
      
      return entity;
    }
    #endregion

    #region Insert Method
    public bool Insert(Product entity)
    {
      return true;
    }
    #endregion

    #region Update Method
    public bool Update(Product entity)
    {
      return true;
    }
    #endregion

    #region Delete Method
    public bool Delete(int productId)
    {
      return true;
    }
    #endregion

  }
}
