import React from 'react';
import Expedition from "./Expedition";

export default class Expeditions extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      expeditions: []
    }
  }

  componentDidMount() {
    fetch('/v1/expeditions.json',
      {
        method: 'get',
        headers: {
          'Authorization': 'Token fyy-ifafEy7vy97M-REq'
        }
      })
      .then((response) => response.json())
      .then((result) => console.log(result))
      .catch(err => console.error('Ошибка получения данных'))
  }

  render() {
    const {expeditions} = this.state;
    return expeditions.map((expedition) => {
      return (
        <Expedition data={expedition}/>
      );
    })
  }
}