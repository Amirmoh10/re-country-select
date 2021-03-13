// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as Caml_obj from "bs-platform/lib/es6/caml_obj.js";
import * as ReactSelect from "react-select";

function ReactSelectOption(Props) {
  var optionProps = Props.optionProps;
  var scrollIntoItem = Props.scrollIntoItem;
  React.useEffect((function () {
          if (optionProps.isFocused) {
            Curry._1(scrollIntoItem, optionProps.value);
          }
          
        }), [
        optionProps.value,
        optionProps.isFocused
      ]);
  var children = React.createElement("div", {
        className: "option"
      }, React.createElement("span", {
            className: "flag-icon flag-icon-" + optionProps.value
          }), " ", React.createElement("span", undefined, optionProps.label));
  var newrecord = Caml_obj.caml_obj_dup(optionProps);
  return Curry._1(ReactSelect.components.Option, (newrecord.children = children, newrecord));
}

var make = ReactSelectOption;

export {
  make ,
  
}
/* react Not a pure module */