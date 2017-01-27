class AdditionalInfo extends React.Component {
  render() {
    return(
      <div className="add-info-block">
        <h2>Additional information:</h2>
        <span className="add-info">Average: {this.props.average}</span>
        <span className="add-info">Spread: {this.props.spread}</span>
        <span className="add-info">Forecast: {this.props.forecast}</span>
      </div>
    );
  }
}
