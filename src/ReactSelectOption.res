@react.component
let make = (~optionProps: ReactSelect.renderOptionProps, ~scrollIntoItem) => {
  React.useEffect3(() => {
    if optionProps.isFocused {
      scrollIntoItem(optionProps.value)
    }

    None
  }, (optionProps.value, optionProps.isFocused, scrollIntoItem))
  let children =
    <div className="option">
      <span className={`flag-icon flag-icon-${optionProps.value}`} />
      {React.string(" ")}
      <span> {React.string(optionProps.label)} </span>
    </div>

  ReactSelect.reactSelectComponents.reactSelectRenderOption({
    ...optionProps,
    children: children,
  })
}
