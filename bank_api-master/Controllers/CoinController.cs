using Microsoft.AspNetCore.Mvc;
using Bank.Entities;
using Bank.Repository;
using System.Collections.Generic;
using Bank.Interfaces;

namespace Bank.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CoinController : ControllerBase
    {
        private readonly ILogger<CoinController> _logger;
        private readonly ICoinRepository _coinRepository;

        public CoinController(ILogger<CoinController> logger, ICoinRepository coinRepository)
        {
            _logger = logger;
            _coinRepository = coinRepository;
        }

        // GET: /coin
        [HttpGet]
        public ActionResult<List<Coin>> GetAll()
        {
            return _coinRepository.GetAll();
        }

        // GET: /coin/5
        [HttpGet("{id}")]
        public ActionResult<Coin> GetCoinById(int id)
        {
            return _coinRepository.GetCoinById(id);
        }

        // POST: /coin
        [HttpPost]
        public ActionResult<Coin> CreateCoin(Coin coin)
        {
            _coinRepository.CreateCoin(coin);
            return CreatedAtAction(nameof(GetCoinById), new { id = coin.Id }, coin);
        }

        // PUT: /coin/5
        [HttpPut("{id}")]
        public ActionResult<Coin> EditCoin(int id, Coin coin)
        {
            if (id != coin.Id)
            {
                return BadRequest();
            }
            return _coinRepository.Edit(coin);
        }

        // DELETE: /coin/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            _coinRepository.Delete(id);
            return NoContent();
        }
    }
}
