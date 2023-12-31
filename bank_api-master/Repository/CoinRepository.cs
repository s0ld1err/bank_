﻿using Bank.Entities;
using Bank.Interfaces;

namespace Bank.Repository
{
    public class CoinRepository : ICoinRepository
    {
        private readonly ApplicationDbContext _context;
        public CoinRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public void CreateCoin(Coin coin)
        {
            coin.When = DateTime.Now;
            coin.Deleted = false;

            _context.Coins.Add(coin);
            _context.SaveChanges();
        }

        public void Delete (int id)
        {
            var deleteCoin = _context.Coins.FirstOrDefault(dc => dc.Id == id);
            deleteCoin.Deleted = true;

            _context.SaveChanges();
        }


        public Coin EditCoin(Coin coin)
        {
            var editedCoin = _context.Coins.FirstOrDefault(c => c.Id == coin.Id && !c.Deleted);

            if (editedCoin != null)
            {
                editedCoin.Name = coin.Name;
                editedCoin.Description = coin.Description;
                editedCoin.Updated = DateTime.Now;

                _context.SaveChanges();
            }

            return editedCoin;
        }


        public List<Coin> GetAll()
        {
            var coins = _context.Coins.ToList().Where(c => !c.Deleted);
            return coins.ToList();
        }

        public Coin GetCoinById(int coinId)
        {
            var coin = _context.Coins.FirstOrDefault(c => c.Id == coinId && !c.Deleted);

            return coin;
        }

        public Coin GetCoin(int coinId)
        {
            var coin = _context.Coins.FirstOrDefault(c => c.Id == coinId && !c.Deleted);

            return coin;
        }

        public Coin GetCoinByName(string name)
        {
            var coin = _context.Coins.FirstOrDefault(c => c.Name == name && !c.Deleted);
            return coin;
        }
    }
}