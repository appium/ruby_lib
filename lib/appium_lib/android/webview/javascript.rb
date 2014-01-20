# encoding: utf-8
module Appium; end # fix module not defined
module Android; end
module Appium::Android::Webview
  class << self
    # firstEmailInput().value = 'example';
    # firstPasswordInput().value =  'example'
    # firstSubmitElement().click();

    # todo: prevent namespace pollution
    # AppiumWebview = { 'ok': function() { return 'ok'; }, 'ok2': function() { return self.ok(); } }

    def javascript
      @javascript_webview_helpers ||= <<-'JS'
function firstTagWithTypeOrName(targetTag, targetType, targetName) {
  var inputs = document.getElementsByTagName(targetTag);
  var inputsLength = inputs.length;
  var target = null;

  var targetNames = [];
  if (targetName) targetNames = targetName.split(",");

  for (var i = 0; i < inputsLength; i++) {
    var input = inputs[i];

    if (targetType) {
      var type = input.type;
      var hasType = typeof type !== "undefined";
      if (hasType && type.trim().toLowerCase() === targetType) {
        target = input;
        break;
      }
    }

    // type only search will have undefined targetName.
    if (targetName) {
      var name = input.name;
      var hasName = typeof name !== "undefined";
      if (hasName && targetNames.indexOf(name.trim().toLowerCase()) !== -1) {
        target = input;
        break;
      }
    }
  }

  return target;
}

function firstInputWithTypeOrName(targetType, targetName) {
  return firstTagWithTypeOrName('input', targetType, targetName);
}

function firstEmailInput() {
  return firstInputWithTypeOrName('email', 'id,username');
}

function firstPasswordInput() {
  return firstInputWithTypeOrName('password', 'password');
}

// yahoo uses a submit button
function firstSubmitElement() {
  return firstTagWithTypeOrName('button', 'submit', 'submit') ||
         firstTagWithTypeOrName('input', 'submit', 'submit') ||
         firstTagWithTypeOrName('a', 'submit', 'submit');
}

// yahoo authorize link
// <a type="submit"
function firstAuthElement() {
  return firstTagWithTypeOrName('a', 'submit');
}
      JS
    end
  end
end