import React, { useState, useEffect } from "react";
import ApiFetch from "./service/ApiCalls/request";
import { Table } from "antd";
import type { ColumnsType } from "antd/es/table";
import logo from "./logo.svg";
import "./App.css";
import { appendFile } from "fs";

import { Button, Tooltip } from 'antd';


interface DataTypeDeposit {
  amount: number;
  fromAddress: string;
}

interface DataTypeWithdrawls {
  amount: number;
  toAddress: string;
  wasApprovedByUser2FA: boolean;
}

interface DataTypeTradeOrder {
  amount: number;
  tradeOrderType: {
    name: string;
  };
}

const columnsDeposit: ColumnsType<DataTypeDeposit> = [
  {
    title: "Amount",
    dataIndex: "amount",
    width: 150,
    sorter: (a: DataTypeDeposit, b: DataTypeDeposit) => a.amount - b.amount,
    sortDirections: ['ascend', 'descend'],
  },
  {
    title: "From Address",
    dataIndex: "fromAddress",
  },
];

const columnsTradeOrders: ColumnsType<DataTypeTradeOrder> = [
  {
    title: "Amount",
    dataIndex: "amount",
    width: 150,
    sorter: (a: DataTypeTradeOrder, b: DataTypeTradeOrder) => a.amount - b.amount,
    sortDirections: ['ascend', 'descend'],
  },
  {
    title: "Trade Order Type",
    dataIndex: ["tradeOrderType", "name"],
  },
];

const columnsWithdrawals: ColumnsType<DataTypeWithdrawls> = [
  {
    title: "Amount",
    dataIndex: "amount",
    width: 150,
    sorter: (a: DataTypeWithdrawls, b: DataTypeWithdrawls) => a.amount - b.amount,
    sortDirections: ['ascend', 'descend'],
  },
  {
    title: "ToAddress",
    dataIndex: "toAddress",
  },
  {
    title: "2FA Confirmed",
    dataIndex: "wasApprovedByUser2FA",
    key: "isActive",
    render: (isActive: any) => (isActive ? "True" : "False"),
  },
];

// ======================================
function App() {
  const [data, setData] = useState<any>();
  const [options, setOptions] = useState([]);
  const [tableType, setTableType] = useState("Deposit");

  const handleButtonClick = () => {
    const nextTableType = {
      'Deposit': 'Withdrawal',
      'Withdrawal': 'TradeOrder',
      'TradeOrder': 'Deposit',
    }[tableType] || 'Deposit';

    setTableType(nextTableType);
  };

  useEffect(() => {
    const fetchDropDown = async () => {
      try {
        const response = await fetch(ApiFetch.fetchOperationTypes);
        const data = await response.json();
        const newOptions = data.map((item: any) => ({
          value: item.id,
          label: item.name,
        }));
        setOptions(newOptions);
      } catch (error) {
        console.error(error);
      }
    };
    fetchDropDown();
  }, []);



  
  useEffect(() => {
    const fetchData = async () => {
      try {
        let url = "";
        switch (tableType) {
          case "Deposit":
            url = ApiFetch.fetchDeposits;
            break;
          case "Withdrawal":
            url = ApiFetch.fetchWithdrawals;
            break;
          case "TradeOrder":
            url = ApiFetch.fetchTradeOrder;
            break;
          default:
            url = "";
        }
        if (url) {
          const response = await fetch(url);
          let json = await response.json();
  
          // If this is the first fetch for TradeOrder, sort the data
          if (tableType === 'TradeOrder') {
            json = json.sort((a: DataTypeTradeOrder, b: DataTypeTradeOrder) => a.amount - b.amount);
          }
  
          setData(json);
        }
      } catch (error) {
        console.error(error);
      }
    };
    fetchData();
  }, [tableType]);
  

  console.log("FETCH: ", data);
  console.log("dp value is: ", tableType);

  return (
    <div className="App">
      <h1>Operation table</h1>
      <Tooltip title={`Current table: ${tableType}`}>
        <Button onClick={handleButtonClick}>Change table type</Button>
      </Tooltip>
      <div className="Table-grid">
        {tableType === "Deposit" ? (
          <Table
            columns={columnsDeposit}
            dataSource={data}
            pagination={{ pageSize: 5 }}
            scroll={{ y: 300 }}
          />
        ) : tableType === "Withdrawal" ? (
          <Table
            columns={columnsWithdrawals}
            dataSource={data}
            pagination={{ pageSize: 5 }}
            scroll={{ y: 300 }}
          />
        ) : (
          <Table
            columns={columnsTradeOrders}
            dataSource={data}
            pagination={{ pageSize: 5 }}
            scroll={{ y: 300 }}
          />
        )}
      </div>
    </div>
  );

}

export default App;
