import React from 'react';

export default class Expedition extends React.Component {
    render() {
        const {title} = this.props.data;
        return (
            <tr>
                <td>{title}</td>
            </tr>
        );
    }
}