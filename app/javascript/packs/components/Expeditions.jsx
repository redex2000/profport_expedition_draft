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
    let promise = fetch('/expeditions.json')
      .then((response) => response.json())
      .then((result) => result)
      .catch(err => console.error('Ошибка получения данных'))
    promise.then(res => console.log(res))
  }

  render() {
    const {expeditions} = this.state;
    const template = expeditions.map((expedition) => {
      return <Expedition data={expedition}/>;
    });
    return (
      <tbody>
        {template}
      </tbody>
    );
  }
}