// app/javascript/controllers/helpers.js
export function definitionsFromContext(context) {
  return context.keys().map((key) => {
    const identifier = key
      .replace("./", "")
      .replace(/_controller\.js$/, "")
      .replace(/\//g, "--")

    return {
      identifier,
      controllerConstructor: context(key).default,
    }
  })
}
