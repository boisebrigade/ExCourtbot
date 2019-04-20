let component = ReasonReact.statelessComponent(__MODULE__);

let make = (~title, children) => {
  ...component,
  render: _self =>
    <div className="flex flex-column w-100 h-100">
      <div className="bb b--black-10 mr4 ml4">
        <h1> {ReasonReact.string(title)} </h1>
      </div>
      <div className="mr4 ml4 mt4"> ...children </div>
    </div>,
};
