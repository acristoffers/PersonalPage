import * as _ from 'lodash';
import * as React from 'react';
import { i18n } from '../translations/index';
import './Sidebar.scss';

export interface SidebarProps { }

export class Sidebar extends React.Component<SidebarProps, {}> {
    render(): JSX.Element {
        let contacts = {
            Email: 'mailto:acristoffers@gmail.com',
            Facebook: 'https://www.facebook.com/acristoffers',
            Github: 'https://www.github.com/acristoffers',
            Twitter: 'https://www.twitter.com/acristoffers',
            Linkedin: 'https://www.linkedin.com/in/acristoffers',
            Lattes: 'http://lattes.cnpq.br/0846174549224433'
        }

        let languages = {
            [i18n.translate('pt')]: i18n.translate('native'),
            [i18n.translate('en')]: 'C2',
            [i18n.translate('de')]: 'C1',
            [i18n.translate('fr')]: 'B1'
        }

        let birthday = new Date(1990, 2, 17).getTime()
        let today = Date.now()
        let age = Math.floor((today - birthday) / (1000 * 3600 * 24 * 365))

        return (
            <div id='sidebar'>
                <div id="photo">
                    <img src='assets/me.jpg' />
                    <h1>Álan Crístoffer <b>e Sousa</b></h1>
                    <h2>{i18n.translate('%d years old, Brazilian').replace('%d', age.toString())}</h2>

                    <a target='_blank' href='https://acristoffers.me/assets/PublicKey.asc'>{i18n.translate('gpg_public_key')}</a>
                    <a target='_blank' href='https://acristoffers.me/assets/Python3.pdf'>Apostila de Python 3</a>
                    <a target='_blank' href='https://acristoffers.me/assets/resume.pdf'>{i18n.translate('resume')}</a>
                    <a target='_blank' href='https://github.com/acristoffers/Monografia/raw/20b935b0f9da9f59dd8e4deca33707775518c028/document.pdf'>{i18n.translate('TCC')}</a>
                </div>

                <div className='section'>
                    <h1>{i18n.translate('contacts')}</h1>
                    <ul>
                        {_.map(_.toPairs(contacts), i => <li><a target='_blank' href={i[1]}>{i[0]}</a></li>)}
                    </ul>
                </div>

                <div className='section'>
                    <h1>{i18n.translate('languages')}</h1>
                    <ul>
                        {_.map(_.toPairs(languages), i => <li>{i[0]} ({i[1]})</li>)}
                    </ul>
                </div>

                <div className='section'>
                    <h1>{i18n.translate('skills')}</h1>
                    <div>
                        {i18n.translate('$skills')}
                    </div>
                </div>
            </div>
        )
    }
}
