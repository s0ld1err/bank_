using Bank.Entities;
using Microsoft.AspNetCore.Mvc;

namespace Bank.Interfaces
{
    public interface ICoinRepository
    {
        void CreateCoin(Coin coin);
        //Coin GetCoinById(int id);
        Coin GetCoin(int id);
        //GetAll
        List<Coin> GetAll();
        //GetByName
        Coin GetCoinByName(string name);
        //Edit
        Coin EditCoin(Coin coin);
        //Delete
        void Delete(int id);
    }
}