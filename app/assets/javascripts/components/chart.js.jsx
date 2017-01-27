class Chart extends React.Component {
  render() {
    return(
      <div className="chart">
        <h2 className="chart-title">Chart title</h2>
        <div className="chart-area">
          <canvas height="440"></canvas>
        </div>
      </div>
    );
  }
}
