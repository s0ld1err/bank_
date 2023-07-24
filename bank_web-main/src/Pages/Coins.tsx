import React, { useEffect, useState } from 'react';
import { Button } from 'react-bootstrap';
import ComplexTable from '../Components/ComplexTable';
import { useNavigate } from 'react-router-dom';
import ApiFetch from '../service/ApiCalls/request';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus } from '@fortawesome/free-solid-svg-icons';

const Coins = () => {
  const navigate = useNavigate();
  const [data, setData] = useState(null);
  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(ApiFetch.fetchCoins);
        const json = await response.json();
        setData(json);
      } catch (error) {
        console.error(error);
      }
    };
    fetchData();
  }, []);
  return (
    <>
      {data !== null && (
        <div style={{ textAlign: 'center' }}>
          <h1 style={{ padding: '30px' }}>Welcome to COINS</h1>
          <ComplexTable url = {ApiFetch.deleteCoin} data={data}/>
          <br/>
          <div style={{ marginBottom: '20px' }}>
            <span style={{ marginRight: '10px' }}>Add a new coin</span>
            <Button variant="primary" onClick={() => { navigate("/addCoin") }}>
              <FontAwesomeIcon icon={faPlus} />
            </Button>
          </div>
        </div>
      )}
    </>
  );
};

export default Coins;
