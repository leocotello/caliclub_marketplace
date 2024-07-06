import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Dynamically import all controllers in the directory
const controllerFiles = require.context(".", true, /\.js$/)

controllerFiles.keys().forEach((filename) => {
  const controllerName = filename
    .replace("./", "")
    .replace(/_controller\.js$/, "")
    .replace(/\//g, "--")
  const controller = controllerFiles(filename).default
  application.register(controllerName, controller)
})
