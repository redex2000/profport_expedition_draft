import React from 'react';
import Expeditions from "./components/Expeditions";

const values = [
    {
        title: 'На Торманс'
    },
    {
        title: 'На Марс'
    }
];

export default class Application extends React.Component {
    render() {
        return (
            <table className="table table-hover">
                <tbody>
                    <Expeditions expeditions={values} />
                </tbody>
            </table>
        );
    }
}