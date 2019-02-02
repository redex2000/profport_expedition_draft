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
        fetch('/expeditions.json')
            .then((response) => response.json())
            .then((result) => this.setState({
                expeditions: result
            }))
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