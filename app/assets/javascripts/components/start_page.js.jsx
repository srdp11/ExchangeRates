class StartPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      sell: props.sell,
      buy: props.buy,
      fromto: props.fromto,
      spread: props.spread
    };
  }

  render() {
    return(
      <html>
        <head>
          <title>Exchange rates</title>
          <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
          <link href="css/customstyle.css" rel="stylesheet" media="screen" />
        </head>
        <body>
          <div className="container">
            <h1>Find out about the exchange rates first!</h1>
            <div className="col-md-5">
              <RatesInfo sell={ this.state.sell }
                         buy={ this.state.buy }
                         fromto={ this.state.fromto }
              />
            <AdditionalInfo spread={ this.state.spread }/>
            <Trigger />
            </div>
            <div className="col-md-7">
              <Chart />
            </div>
          </div>
          <script src="//code.jquery.com/jquery.js"></script>
          <script src="js/bootstrap.min.js"></script>
        </body>
      </html>
    );
  }
}
