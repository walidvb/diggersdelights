import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux';
import ReactPlayer from 'react-player'

import trackPlay from '../../analytics/trackPlay';
import * as playerActions from '../../actions/playerActions';
import styles from './PlayerContainer.scss';

class PlayerContainer extends Component {
    static propTypes = {
        tracklist: PropTypes.array.isRequired,
        currentlyPlaying: PropTypes.object,
    }
    componentWillReceiveProps({ seek, currentlyPlaying }){
        if(seek !== this.props.seek && this.player){
            console.log(seek)
            this.player.seekTo(seek);
        }

        if(currentlyPlaying != this.props.currentlyPlaying){
            console.log(currentlyPlaying)
            trackPlay(currentlyPlaying);
        }
    }
    playNext(i){
        const { currentlyPlaying, tracklist, play } = this.props;
        for (let i = 0; i < tracklist.length; i++) {
            const track = tracklist[i];
            if (currentlyPlaying.id == track.id && i < tracklist.length ){
                play(tracklist[i + 1])
                return;
            }
        }
        this.props.pause();
    }
    renderTrack(t, i){
        const isPlaying = this.props.currentlyPlaying && this.props.currentlyPlaying.id == t.id;
        return (
            <div key={i} className={[styles.track, isPlaying ? styles.playing : null].join(' ')} onClick={() => this.props.playTrack(t)}>
                {t.title}
            </div>
        )
    }
    renderCurrentlyPlaying(){
        if (this.props.currentlyPlaying === undefined){
            return null;
        }
        const { title, html, url, id} = this.props.currentlyPlaying;
        const canPlay = ReactPlayer.canPlay(url);

        if (!canPlay){
            this.props.pause();
        }
        return (<div>
            <h2>{canPlay ? <div className="fa fa-warning" /> : null}{title}</h2>
            {canPlay ? 
                <ReactPlayer 
                    ref={(player) => this.player = player}
                    url={url} 
                    width="100%"
                    controls={true}
                    style={{maxHeight: "200px"}}
                    playing={this.props.playing}
                    onStart={(d) => console.log(this.props.play(d))}
                    onPlay={(d) => console.log(this.props.play(d))}
                    onProgress={(d) => console.log(this.props.onProgress(d))}
                    onPause={(d) => console.log(this.props.pause(d))}
                    onEnded={(d) => console.log(this.props.onEnded(d))}
                /> : 
                <div style={{ height: "100%" }} dangerouslySetInnerHTML={{
                    __html: html
                }} />
            }
        </div>);
    }
    render() {
        const { tracklist, placement, displayType } = this.props;
        return (
            <div className={styles.container}>
                { this.renderCurrentlyPlaying() }
                <div className={[styles.tracklist, styles[`${placement}`], styles[displayType]].join(' ')}>
                    {tracklist.map(this.renderTrack.bind(this))}
                </div>
            </div>
        )
    }
}

const mapStateToProps = ({ player }, ownProps) => ({
    ...player
})

const mapDispatchToProps = (dispatch) => ({
    ...bindActionCreators(playerActions, dispatch),
})


export default connect(mapStateToProps, mapDispatchToProps)(PlayerContainer);