import * as React from 'react'
import './ImageView.scss'

import * as _ from 'lodash'

export interface ImageViewProps { url: string, close: () => void }

export class ImageView extends React.Component<ImageViewProps, {}> {
    render() {
        if (this.props.url !== null) {
            return (
                <div id='imageviewer'>
                    <div id='background'>
                        <img src={this.props.url} />
                    </div>
                    <span id='close' onClick={this.props.close.bind(this)}>x</span>
                </div>
            )
        }

        return null
    }

    escFunction(event: KeyboardEvent) {
        if (event.key == 'Escape') {
            this.props.close()
        }
    }

    componentDidMount() {
        document.addEventListener("keydown", this.escFunction.bind(this), false);
    }

    componentWillUnmount() {
        document.removeEventListener("keydown", this.escFunction.bind(this), false);
    }
}
