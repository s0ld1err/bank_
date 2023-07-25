import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import ApiFetch from '../service/ApiCalls/request';
import { Coin } from '../Interfaces/Interfaces'; // asigură-te că această cale este corectă

const CoinDetails = () => {
    const [coin, setCoin] = useState<Coin | null>(null);
    const { id, name } = useParams();

    useEffect(() => {
        const fetchData = async () => {
            try {
                let url;
                if (id) {
                    url = ApiFetch.fetchCoin + id;
                }
                if (name) {
                    url = ApiFetch.fetchCoinByName + name;
                }
                if (url) {
                    const response = await fetch(url);
                    const json = await response.json();
                    setCoin(json);
                }
            } catch (error) {
                console.error(error);
            }
        }
        fetchData();
    }, [id, name])
    

    return (
        <div>
            {coin && (
                <div>
                    <h1>{coin.name}</h1>
                    <p>{coin.description}</p>
                    {/* Adaugă aici orice alte detalii dorești să afișezi */}
                </div>
            )}
        </div>
    )
}

export default CoinDetails;
