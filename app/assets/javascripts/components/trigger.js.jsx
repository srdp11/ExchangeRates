class Trigger extends React.Component {
  render() {
    return(
      <div className="trigger">
        <h2>Trigger:</h2>

        <form className="trigger-body col-md-12">
          <div className="trigger-block col-md-6">
            <label>Operation:</label>
            <select className="custom-select form-control">
              <option>Sell</option>
              <option>Buy</option>
            </select>
          </div>
          <div className="trigger-block col-md-6">
            <label>Condition:</label>
            <select className="custom-select form-control">
              <option>Greater</option>
              <option>Lesser</option>
            </select>
          </div>
          <div className="trigger-block col-md-6">
            <label>Threshold:</label>
            <div className="trigger-elem">
              <input type="text" className="control-trig-elem form-control" />
            </div>
          </div>
          <div className="trigger-block col-md-6">
            <label>Email:</label>
            <div className="trigger-elem">
              <input className="control-trig-elem form-control" type="email" />
            </div>
          </div>
          <div className="trigger-block col-md-12">
            <div className="trigger-elem">
              <button type="button" className="trigger-btn-sumbit btn btn-primary">
                Create trigger
              </button>
            </div>
          </div>
        </form>
      </div>
    );
  }
}
