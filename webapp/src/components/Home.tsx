import * as React from 'react'
import './Home.scss'

import { Sidebar } from './Sidebar'
import { Content } from './Content'
import { i18n } from '../translations/index'

import * as _ from 'lodash'
import { ImageView } from './ImageView';

export interface HomeProps { }
export interface HomeState { lang: string, imageUrl: string }

export class Home extends React.Component<HomeProps, HomeState> {
    constructor(props: Readonly<HomeProps>) {
        super(props)

        this.state = {
            lang: i18n.language(),
            imageUrl: null
        }
    }

    render() {
        return (
            <div id='home'>
                <Sidebar />
                <Content openImageHandler={this.openImage.bind(this)} />
                <div id='langs'>
                    {_.map(i18n.languages(), l => <img title={i18n.translate(l)} src={`assets/${l}.svg`} alt={i18n.translate(l)} onClick={this.changeLanguage.bind(this, l)} />)}
                </div>
                <ImageView url={this.state.imageUrl} close={this.close.bind(this)} />
            </div>
        )
    }

    changeLanguage(lang: string) {
        i18n.setLanguage(lang)
        this.setState({ lang: lang })
    }

    openImage(url: string) {
        this.setState({ lang: i18n.language(), imageUrl: url })
    }

    close() {
        this.setState({ lang: i18n.language(), imageUrl: null })
    }
}
