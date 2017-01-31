class StartPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      data: props.data,
      fromto: props.fromto,
      sell: props.data[props.fromto[0]]['sell'],
      buy: props.data[props.fromto[0]]['buy'],
      spread: props.data[props.fromto[0]]['spread'],
      curr_fromto: props.fromto[0],
    };

    this.updateFromTo = this.updateFromTo.bind(this);
    this.fetchData = this.fetchData.bind(this)
  }

  fetchData() {
    const [from, to] = this.state.curr_fromto.match(/\w+/g)

    $.ajax({
      url: 'http://localhost:3000/data',
      type: 'GET',
      success: (data) => {
        this.setState({
          data: data
        });
      },
      error: (xhr, status, err) => {
        console.error(this.props.url, status, err.toString());
      }
    });
  }

  updateFromTo(e) {
    this.setState({
      curr_fromto: e.target.value,
      sell: this.state.data[e.target.value]['sell'],
      buy: this.state.data[e.target.value]['buy'],
      spread: this.state.data[e.target.value]['spread'],
    });
  }

  componentDidMount() {
    this.timer_id = setInterval(this.fetchData, 50000);
  }

  componentWillUnmount() {
    clearInterval(this.timer_id);
  }

  render() {
    return(
      <div className="main">
        <div className="container">
          <h1>Find out about the exchange rates first!</h1>
          <div className="col-md-5">
            <RatesInfo sell={ this.state.sell }
                       buy={ this.state.buy }
                       fromto={ this.state.fromto }
                       onChange={ this.updateFromTo }
            />
          <AdditionalInfo spread={ this.state.spread }/>
          <Trigger />
          </div>
          <div className="col-md-7">
            <Chart />
          </div>
        </div>
      </div>
    );
  }
}
