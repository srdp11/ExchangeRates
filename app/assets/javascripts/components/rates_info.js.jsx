class RatesInfo extends React.Component {
  render() {
    return(
      <div className="rates-info">
        <h2>Currency exchange rates:</h2>
        <div className="rate-block">
          <span>From/To</span>
          <select className="rate-elem" onChange={ this.props.onChange }>
            {
              this.props.fromto.map(function(item) {
                return <option>{ item }</option>
              })
            }
          </select>
        </div>
        <div className="rate-block">
          <span>Buy</span>
          <span className="rate-elem">{this.props.buy}</span>
        </div>
        <div className="rate-block">
          <span>Sell</span>
          <span className="rate-elem">{this.props.sell}</span>
        </div>
      </div>
    );
  }
}
