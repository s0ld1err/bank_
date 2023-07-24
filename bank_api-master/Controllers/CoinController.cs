using Microsoft.AspNetCore.Mvc;
using Bank.Entities;
using Bank.Repository;
using System.Collections.Generic;
using Bank.Interfaces;

namespace Bank.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class CoinController : ControllerBase
    {
        private readonly ILogger<CoinController> _logger;
        private readonly ICoinRepository _coinRepository;

        public CoinController(ILogger<CoinController> logger, ICoinRepository coinRepository)
        {
            _logger = logger;
            _coinRepository = coinRepository;
        }


        // GET: /coin/GetAll
        [HttpGet]
        public ActionResult<IEnumerable<Coin>> GetAll()
        {
            return _coinRepository.GetAll();
        }



        // GET: /coin/5
        [HttpGet]
        public ActionResult<Coin> GetCoin(int id)
            {
            return _coinRepository.GetCoin(id);
        }

        // POST: /coin
        [HttpPost]
        public ActionResult<Coin> AddCoin(Coin coin)
        {
            _coinRepository.CreateCoin(coin);
            return CreatedAtAction(nameof(GetCoin), new { id = coin.Id }, coin);
        }

        // PUT: /coin/5
        [HttpPut]
        public ActionResult<Coin> EditCoin(Coin coin)
        {
            return _coinRepository.EditCoin(coin);
        }

        // DELETE: /coin/5
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            _coinRepository.Delete(id);
            return NoContent();
        }
    }
}
