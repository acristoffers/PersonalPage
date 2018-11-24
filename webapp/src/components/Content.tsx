import * as React from 'react'
import './Content.scss'

import { i18n } from '../translations/index'

import * as _ from 'lodash'

export interface ContentProps { openImageHandler: (path: string) => void }

export class Content extends React.Component<ContentProps, {}> {
    render() {
        return <div id='content'>
            <div className='section'>
                <h1>{i18n.translate('about')}</h1>
                {i18n.translate('about_me')}
            </div>

            <div className='section'>
                <h1>{i18n.translate('projects')}</h1>

                <div className='project'>
                    <div className='desc'>
                        <h1><a target='_blank' href='https://github.com/acristoffers/lachesis'>Lachesis<br /><img src='assets/lachesis.svg' /></a></h1>
                        <span>{i18n.translate('lachesis_desc')}</span>
                    </div>
                    <div className='screenshots'>
                        {
                            _.map([1, 2, 3, 4], i =>
                                <div className='screenshot'>
                                    <img onClick={this.props.openImageHandler.bind(this, `assets/screenshots/Lachesis${i}.png`)} src={`assets/screenshots/Lachesis${i}.jpg`}></img>
                                    <span>{i18n.translate(`lachesis${i}_desc`)}</span>
                                </div>
                            )
                        }
                    </div>
                </div>

                <div className='project'>
                    <div className='desc'>
                        <h1><a target='_blank' href='https://github.com/acristoffers/moirai'>Moirai</a></h1>
                        <span>{i18n.translate('moirai_desc')}</span>
                    </div>
                </div>

                <div className='project'>
                    <div className='desc'>
                        <h1><a target='_blank' href='https://github.com/acristoffers/ahio'>AHIO</a></h1>
                        <span>{i18n.translate('ahio_desc')}</span>
                    </div>
                </div>

                <div className='project'>
                    <div className='desc'>
                        <h1><a target='_blank' href='https://github.com/acristoffers/testsdatabase'>Tests Database<br /><img src='assets/tests-database.png' /></a></h1>
                        <span>{i18n.translate('tests_database_desc')}</span>
                    </div>
                    <div className='screenshots'>
                        {
                            _.map([1, 2, 3], i =>
                                <div className='screenshot'>
                                    <img onClick={this.props.openImageHandler.bind(this, `assets/screenshots/TestsDatabase${i}.png`)} src={`assets/screenshots/TestsDatabase${i}.png`}></img>
                                    <span>{i18n.translate(`tb_ss${i}_desc`)}</span>
                                </div>
                            )
                        }
                    </div>
                </div>

                <div className='project'>
                    <div className='desc'>
                        <h1><a target='_blank' href='https://github.com/acristoffers/tracker'>Tracker<br /><img src='assets/tracker.svg' /></a></h1>
                        <span>{i18n.translate('tracker_desc')}</span>
                    </div>
                    <div className='screenshots'>
                        {
                            _.map([1, 2, 3], i =>
                                <div className='screenshot'>
                                    <img onClick={this.props.openImageHandler.bind(this, `assets/screenshots/Tracker${i}.png`)} src={`assets/screenshots/Tracker${i}.png`}></img>
                                </div>
                            )
                        }
                    </div>
                </div>

                <div className='project'>
                    <div className='desc'>
                        <h1><a target='_blank' href='https://github.com/acristoffers/CEF3SimpleSample'>CEF3SimpleSample<br /><img src='assets/cef_logo.png' /></a></h1>
                        <span>{i18n.translate('cefss_desc')}</span>
                    </div>
                </div>
            </div>
        </div>
    }
}
